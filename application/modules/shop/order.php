<?php

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Shop Cart Controller
 *
 * @uses ShopController
 * @package Shop
 * @copyright 2013 ImageCMS
 * @author <dev@imagecms.net>
 */
class Order extends \Cart\BaseOrder {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Render order summary Page for User.
     * @param  string $orderSecretKey - Order Secret key. Random string
     */
    public function view($orderSecretKey = null) {
        /** Support for Robokassa */
        if (isset($_REQUEST['Shp_orderKey']) && isset($_REQUEST['Shp_pmId'])) {
            $_GET['pm'] = $_REQUEST['Shp_pmId'];
            $orderSecretKey = $_REQUEST['Shp_orderKey'];
        }

        /** Get SOrders Model */
        $model = SOrdersModel::getOrdersByKey($orderSecretKey);
        ($model !== null) OR $this->core->error_404();

        /** Init Payment Systems */
        ShopCore::app()->SPaymentSystems->init($model);
        if (isset($_GET['pm']) && $_GET['pm'] > 0) {
            $paymentMethod = SPaymentMethodsQuery::create()->findPk((int) $_GET['pm']);
            $paymentProcessor = ShopCore::app()->SPaymentSystems->loadPaymentSystem($paymentMethod->getPaymentSystemName(), $paymentMethod);
            if ($paymentProcessor instanceof BasePaymentProcessor)
                $paymentProcessor->processPayment();
        }


        /** Init Payment Method for order */
        if ($model->getSDeliveryMethods() instanceof SDeliveryMethods) {
            $cr = new Criteria();
            $cr->add(SPaymentMethodsPeer::ACTIVE, TRUE, Criteria::EQUAL);
            $cr->add(SPaymentMethodsPeer::ID, $model->getPaymentMethod(), Criteria::EQUAL);
            $paymentMethods = $model->getSDeliveryMethods()->getPaymentMethodss($cr);
        }

        /** Start Render Template */
        $this->core->set_meta_tags(ShopCore::t(lang('Order view') . ' #' . $model->getId()));

        $this->template->registerMeta("ROBOTS", "NOINDEX, NOFOLLOW");
        $this->template->registerJsScript($this->load->library('lib_seo')->renderGAForCart($model, $this->core->settings));
        $freeFrom = SDeliveryMethodsQuery::create()
                ->findPk($model->getDeliveryMethod())
                ->getFreeFrom();

        /** Render template * */
        $this->render('order_view', array(
            'model' => $model,
            'freeFrom' => $freeFrom,
            'paymentMethod' => $paymentMethods['0'],
        ));
    }

    /**
     *  Save ordered products to database
     */
    public function make_order() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('userInfo[fullName]', lang('Name'), 'required|max_length[50]');
        $this->form_validation->set_rules('userInfo[email]', lang('Email'), 'valid_email|required|max_length[30]');
        $this->form_validation->set_rules('userInfo[phone]', lang('Phone'), '');
        $this->form_validation->set_rules('userInfo[deliverTo]', lang('Delivery address'), '');
        $this->form_validation->set_rules('userInfo[commentText]', lang('Order comment'), '');
        $this->form_validation->set_rules('deliveryMethodId', lang('Delivery Method'), 'required|callback_delivery_method_id_check');

        $user = new \SUserProfile();
        $this->form_validation = $user->validateCustomData($this->form_validation);
        unset($user);
        $order = new \SOrders;
        $this->form_validation = $order->validateCustomData($this->form_validation);
        unset($order);

        if ($this->form_validation->run()) {

            $cart = \Cart\BaseCart::getInstance();
            $cart->recountOriginTotalPrice();
            $cart->recountTotalPrice();
            $cartItems = $cart->getItems();
//            var_dumps_exit($_POST['deliveryMethodId']);
            /** Check delivery method. * */
            $deliveryMethod = SDeliveryMethodsQuery::create()
                    ->findPk((int) $_POST['deliveryMethodId']);

            $deliveryMethodId = $deliveryMethod->getId();
            $deliveryPrice = $deliveryMethod->getPrice();

            /** Check if payment method exists.* */
            $paymentMethod = SPaymentMethodsQuery::create()
                    ->findPk((int) $_POST['paymentMethodId']);

            if ($paymentMethod === null) {
                $paymentMethodId = 0;
            } else {
                $paymentMethodId = $paymentMethod->getId();
            }

            /** Set user id if logged in * */
            if ($this->dx_auth->is_logged_in() === true) {
                $user_id = $this->dx_auth->get_user_id();
            } else {
                $userInfo = $this->_createUser($_POST['userInfo']['email']);
                $user_id = $userInfo['id'];
            }

            /** Prepare order data * */
            $data = array();
            $data['userId'] = $user_id;
            $data['deliveryMethodId'] = $deliveryMethodId;
            $data['deliveryPrice'] = $deliveryPrice;
            $data['paymentMethodId'] = $paymentMethodId;
            $data['userFullName'] = $_POST['userInfo']['fullName'];
            $data['userEmail'] = $_POST['userInfo']['email'];
            $data['userPhone'] = $_POST['userInfo']['phone'];
            $data['userDeliverTo'] = $_POST['userInfo']['deliverTo'];
            $data['userCommentText'] = $_POST['userInfo']['commentText'];
            $data['userIp'] = $this->input->ip_address();

            /** Create new order * */
            //$baseOrder = new \Orders\BaseOrder();
            try {
                /** Products for admin's email (variant_name, quantity, price) * */
                $products = array();
                $order = $this->create($data, $products);
            } catch (Exception $exc) {
                echo $exc->getMessage();
                log_message('error', 'Order: ' . $exc->getMessage());
            }

            //\CMSFactory\Events::create()->registerEvent(array('order' => $order, 'price' => $order->getTotalPrice()), 'Cart:MakeOrder')->runFactory();

            /** Save to order history table * */
            try {
                $this->saveOrdersHistory($order->getId(), $user_id, $_POST['userInfo']['commentText']);
            } catch (Exception $exc) {
                echo $exc->getMessage();
                log_message('error', 'Order: ' . $exc->getMessage());
            }



            /** Prepare products for email to administrator * */
            $productsForEmail = parent::createProducsInfoTable($cartItems, $order->getDiscount());

            /** Prepare email data * */
            $checkLink = site_url() . "admin/components/run/shop/orders/createPdf/" . trim($order->getId());
            /** Getting the site's default currency symbol * */
            $defaultCurrency = \ShopCore::app()->SCurrencyHelper->getSymbol();


            $emailData = array(
                'userName' => $order->user_full_name,
                'userEmail' => $order->user_email,
                'userPhone' => $order->user_phone,
                'userDeliver' => $order->user_deliver_to,
                'orderLink' => shop_url('cart/view/' . $order->key),
                'products' => $productsForEmail,
                'deliveryPrice' => $deliveryPrice . ' ' . $defaultCurrency,
                'checkLink' => $checkLink,
                'totalPrice' => $order->getTotalPrice() . ' ' . $defaultCurrency
            );

            /** Send email * */
            \cmsemail\email::getInstance()->sendEmail($order->user_email, 'make_order', $emailData);

            /** Set flash data* */
            $this->session->set_flashdata('makeOrder', true);

            /** Redirect to view ordered prducts. * */
            redirect(shop_url('order/view/' . $order->getKey()));
        } else {
            $this->session->set_flashdata('validation_errors', validation_errors());
            redirect(shop_url('cart'));
        }
    }

    /**
     * Create new user
     * @param email $email
     * @return array
     */
    protected function _createUser($email) {
        $userInfo = array('id' => NULL);

        if ((int) ShopCore::app()->SSettings->userInfoRegister == 1) {

            $this->load->model('dx_auth/users', 'user2');
            $password = self::createCode();

            if ($this->dx_auth->is_email_available($email)) {
                $userInfo = $this->dx_auth->register($_POST['userInfo']['fullName'], $password, $email, $_POST['userInfo']['deliverTo'], '', $_POST['userInfo']['phone'], TRUE);
                $userInfo['id'] = NULL;

                if ($query = ShopCore::$ci->user2->get_user_by_email($email) AND $query->num_rows() == 1) {
                    $userInfo['id'] = $query->row()->id;
                    $userInfo['fullName'] = $_POST['userInfo']['fullName'];
                }
            }
        }
        return $userInfo;
    }

    /**
     * Check if delivery method exists.
     * @param int $deliveryMethodId
     * @return boolean
     */
    public function delivery_method_id_check($deliveryMethodId = 0) {
        $deliveryMethod = \SDeliveryMethodsQuery::create()
                ->findPk((int) $deliveryMethodId);

        if ($deliveryMethod === null) {
            $this->form_validation->set_message('delivery_method_id_check', lang('This method of delivery does not exist'));
            echo 'false';
        } else {
            echo 'true';
        }
    }

    public function test() {
        var_dumps_exit(parent::createProducsInfoTable(100));
    }

    /**
     * Get Payment Methods by ID
     * @param int $deliveryId
     * @return JSON
     * @author <dev@imagecms.net>
     * @copyright (c) 2013 ImageCMS
     */
    public function getPaymentsMethods($deliveryId = null) {

        if ($deliveryId == null)
            $response = array('success' => false, 'errors' => true, 'message' => 'Delivery id is null.');

        $paymentMethods = \ShopDeliveryMethodsSystemsQuery::create()->filterByDeliveryMethodId($deliveryId)->find();
        foreach ($paymentMethods as $paymentMethod) {
            $paymentMethodsId[] = $paymentMethod->getPaymentMethodId();
        }
        $paymentMethod = \SPaymentMethodsQuery::create()->filterByActive(true)->where('SPaymentMethods.Id IN ?', $paymentMethodsId)->orderByPosition()->find();

        $jsonData = array();
        foreach ($paymentMethod->getData() as $pm) {
            $jsonData[] = array(
                'id' => $pm->getId(),
                'name' => $pm->getName(),
                'description' => $pm->getDescription()
            );
        }
        $response = array('success' => true, 'errors' => false, 'data' => $jsonData);
        return json_encode($response);
    }
    
    /**
     * Get Payment Methods by ID
     * @param int $deliveryId string tpl
     * @return html
     * @author <dev@imagecms.net>
     * @copyright (c) 2013 ImageCMS
     */
    public function getPaymentsMethodsTpl($deliveryId = null, $tpl = 'default') {

        if ($deliveryId == null)
            $response = array('success' => false, 'errors' => true, 'message' => 'Delivery id is null.');

        $paymentMethods = \ShopDeliveryMethodsSystemsQuery::create()->filterByDeliveryMethodId($deliveryId)->find();
        foreach ($paymentMethods as $paymentMethod) {
            $paymentMethodsId[] = $paymentMethod->getPaymentMethodId();
        }
        $paymentMethod = \SPaymentMethodsQuery::create()->filterByActive(true)->where('SPaymentMethods.Id IN ?', $paymentMethodsId)->orderByPosition()->find();
        
        $this->template->assign('payments', $paymentMethod);
        $this->template->display('shop/payments/' . $tpl);
    }
}

/* End of file cart.php */

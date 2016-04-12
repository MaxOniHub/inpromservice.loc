<?php

namespace Cart\ItemsTypes;

/**
 * 
 * @property \SProductVariants $model
 * @author
 */
class ItemVariant extends IItemType {

    protected function getModel() {
        $this->model = \SProductVariantsQuery::create()->joinWithI18n(\MY_Controller::getCurrentLocale())
                ->filterById((int) $this->cartItem->id)
                ->findOne();
    }

    public function getOriginPrice() {
        $ci = &get_instance();
        $result = $ci->db
                ->select('price')
                ->limit(1)
                ->where('id', $this->cartItem->id)
                ->get('shop_product_variants')
                ->row_array();

        return $result['price'];
    }

    public function getPrice() {


        $variants = $this->model->getSProducts()->getProductVariants();
        foreach ($variants as $var)
            if ($var->getId() == $this->cartItem->id)
                return $var->getPrice();
    }

    protected function addDeprecatedFields() {
        $this->cartItem->variantId = $this->cartItem->id;
        $this->cartItem->productId = $this->model->getSProducts()->getId();
        $name = $this->model->getName();
        if (empty($name)) {
            $name = $this->model->getSProducts()->getName();
        }
        $this->cartItem->variantName = $name;
    }

}

?>

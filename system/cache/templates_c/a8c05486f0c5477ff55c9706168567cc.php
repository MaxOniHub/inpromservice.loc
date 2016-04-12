<!-- php vars to js -->
<?php if($is_logged_in == '1'): ?>
    <?php $is_logged_in = 1?>
    <?php $wish_list = $CI->load->module('wishlist')?>
    <?php $countWL = $wish_list->getUserWishListItemsCount($CI->dx_auth->get_user_id())?>
<?php else:?>
    <?php $is_logged_in = 0?>
    <?php $countWL = 0?>
<?php endif; ?>
<?php $countSh = getProductViewsCount()?>
<script type="text/javascript">
    <?php if($comp = $CI->session->userdata('shopForCompare')): ?>
        <?php $cnt_comp = count($comp)?>
    <?php else:?>
        <?php $cnt_comp = 0?>
    <?php endif; ?>
        var curr = '<?php if(isset($CS)){ echo $CS; } ?>',
        nextCs = '<?php echo $NextCS?>',
        discountInPopup = true,
        pricePrecision = parseInt('<?php echo ShopCore::app()->SSettings->pricePrecision?>'),
        checkProdStock = "<?php echo ShopCore::app()->SSettings->ordersCheckStocks?>", //use in plugin plus minus
        inServerCart = parseInt("<?php echo ShopCore::app()->SCart->totalItems()?>"),
        inServerCompare = parseInt("<?php if(isset($cnt_comp)){ echo $cnt_comp; } ?>"),
        inServerWishList = parseInt("<?php if(isset($countWL)){ echo $countWL; } ?>"),
        countViewProd = parseInt("<?php if(isset($countSh)){ echo $countSh; } ?>"),
        theme = "<?php if(isset($THEME)){ echo $THEME; } ?>",
        inCart = '<?php echo lang ('В корзине','newLevel'); ?>',
        toCart = '<?php echo lang ('Купить','newLevel'); ?>',
        pcs = '<?php echo lang ('Количество:'); ?>',
        kits = '<?php echo lang ('Комплектов:'); ?>',
        captchaText = '<?php echo lang ('Код протекции'); ?>',
        isLogin = "<?php if(isset($is_logged_in)){ echo $is_logged_in; } ?>" == '1' ? true : false,
        plurProd = ['<?php echo lang ("товар","newLevel"); ?>', '<?php echo lang ("товара","newLevel"); ?>', '<?php echo lang ("товаров","newLevel"); ?>'],
        plurKits = ['<?php echo lang ("набор","newLevel"); ?>', '<?php echo lang ("набора","newLevel"); ?>', '<?php echo lang ("наборов","newLevel"); ?>'],
        plurComments = ['<?php echo lang ("отзыв","newLevel"); ?>', '<?php echo lang ("отзыва","newLevel"); ?>', '<?php echo lang ("отзывов","newLevel"); ?>'],
        
        selectDeliv = false,
        selIcons = '[class*=icon_]',
        preloader = '.preloader',
        selScrollPane = '.frame-scroll-pane .content-carousel';
        text = {
            search: function(text) {
                return '<?php echo lang ("Введите боллее", "newLevel"); ?>' + ' ' + text + ' <?php echo lang ("символов", "newLevel"); ?>';
            },
            error: {
                notLogin: '<?php echo lang ("У список бажань можуть додавати лише авторизовані користувачі", "newLevel"); ?>',
                fewsize: function(text) {
                    return '<?php echo lang ("Выберете размер меньше или равно", "newLevel"); ?>' + ' ' + text + ' <?php echo lang ("пикселей", "newLevel"); ?>';
                },
                enterName: '<?php echo lang ("Введите название", "newLevel"); ?>'
            }
        }
    
</script><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1459371989; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/config.js.tpl ?>
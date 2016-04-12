<div class="frame-user-toolbar">
    <div class="container inside-padd">
        <?php if($compare = $CI->session->userdata('shopForCompare')): ?>
            <?php $countCo = count($compare);?>
        <?php else:?>
            <?php $countCo = 0;?>
        <?php endif; ?>
        <?php $wish_list = $CI->load->module('wishlist')?>
        <?php $countWL = $wish_list->getUserWishListItemsCount($CI->dx_auth->get_user_id())?>
        <?php $countSh = getProductViewsCount()?>
        <div class="content-user-toolbar" <?php if(!($countCo!=0 || $countWL!=0 || $countSh!=0)): ?>style="display:none;"<?php endif; ?>>
            <ul class="items items-user-toolbar">
                <li class="box-1">
                    <?php $this->include_shop_tpl('wish_list_data', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
                </li>
                <li class="box-2">
                    <?php $this->include_shop_tpl('compare_data', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
                </li>
                <?php if($countSh): ?>
                    <li class="box-3">
                        <div class="btn-already-show">
                            <button type="button" data-drop=".frame-already-show" data-effect-on="slideDown" data-effect-off="slideUp" data-place="inherit">
                                <span class="icon_already_show"></span>
                                <span class="text-view-list">
                                    <span class="text-el d_l_1"><?php echo lang ("Ви вже переглянули",'newLevel'); ?></span>
                                    <span class="text-el">&nbsp;(<?php echo $countSh?>)</span>
                                    </span>
                            </button>
                        </div>
                    </li>
                <?php endif; ?>
                <li class="box-4">
                    <div class="btn-toggle-toolbar">
                        <button type="button" data-rel="0" <?php if($_COOKIE['condUserToolbar'] == 0 && isset($_COOKIE['condUserToolbar'])): ?>style="display: none;"<?php else:?> class="activeUT"<?php endif; ?>>
                            <span class="icon_times"></span>
                            <span class="text-el"><?php echo lang ('Згорнути','newLevel'); ?></span>
                        </button>
                        <button type="button" data-rel="1" <?php if($_COOKIE['condUserToolbar'] == 1 ||  !isset($_COOKIE['condUserToolbar'])): ?>style="display: none;"<?php else:?> class="activeUT"<?php endif; ?>>
                            <span class="text-el"><?php echo lang ('Розгорнути','newLevel'); ?></span>
                        </button>
                    </div>
                </li>
            </ul>
        </div>
        <div class="btn-to-up">
            <button type="button">
                <span class="icon_arrow_p"></span>
                <span class="text-el"><?php echo lang ('Вверх','newLevel'); ?></span>
            </button>
        </div>
    </div>
    <div class="drop frame-already-show">
        <div class="content-already-show">
            <div class="horizontal-carousel p_r" id="ViewedProducts">
                <?php /*<?php echo widget_ajax ('ViewedProducts', '#ViewedProducts'); ?>*/?>
                <?php echo widget ('ViewedProducts'); ?>
            </div>
        </div>
    </div>
</div><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1459370250; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/user_toolbar.tpl ?>
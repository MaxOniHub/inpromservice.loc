<?php $topCartCount = ShopCore::app()->SCart->totalItems()?>
<div class="btn-bask tiny-bask">
    <button>
        <span class="frame-icon">
            <span class="icon_cleaner"></span>
        </span>
        <span class="text-cleaner bask">
            <span class="empty" <?php if($topCartCount == 0): ?>style="display: inline"<?php endif; ?>>
                <span class="helper"></span>
                <span>
                    <span class="text-el"><?php echo lang ('Корзина пуста','newLevel'); ?></span>
                </span>
            </span>
            <span class="no-empty" <?php if($topCartCount != 0): ?>style="display: inline"<?php endif; ?>>
                <span class="helper"></span>
                <span>
                    <span class="text-el topCartCount"><?php echo $topCartCount?></span>
                    <span class="text-el">&nbsp;</span>
                    <span class="text-el plurProd"><?php echo SStringHelper::Pluralize(ShopCore::app()->SCart->totalItems(), array(lang('товар','newLevel'),lang('товара','newLevel'),lang('товаров','newLevel')))?></span>
                    <span class="divider text-el">&#8226;</span>
                    <span class="d_i-b">
                        <span class="text-el topCartTotalPrice"><?php echo str_replace(',', '.', ShopCore::app()->SCart->totalPrice())?></span>
                        <span class="text-el">&nbsp;<span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span></span>
                    </span>
                </span>
            </span>
        </span>
    </button>
</div>
<?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/cart_data.tpl ?>
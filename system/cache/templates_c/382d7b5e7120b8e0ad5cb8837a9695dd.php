<?php $condBtn = $class != 'btn inWL'?>
<div class="btn-wish <?php if(!$condBtn): ?>btn-wish-in<?php endif; ?>">
    <button class="toWishlist" type="button" data-rel="tooltip" data-title="<?php echo lang ('В список желаний','newLevel'); ?>" <?php if($is_logged_in): ?>data-drop="#wishListPopup" data-source="<?php echo site_url ('/wishlist/renderPopup/'. $varId); ?>"<?php else:?>data-drop="#notification" data-modal="true" data-overlayopacity="0" data-timeclosemodal="3000"<?php endif; ?> <?php if(!$condBtn): ?>style="display: none;"<?php endif; ?>>
        <span class="icon_wish"></span>
        <span class="text-el d_l"><?php echo lang ('В список желания','newLevel'); ?></span>
    </button>
    <button class="inWishlist" type="button" data-rel="tooltip" data-title="<?php echo lang ('В списке желаний','newLevel'); ?>" <?php if($condBtn): ?>style="display: none;"<?php endif; ?>>
        <span class="icon_wish"></span>
        <span class="text-el d_l"><?php echo lang ('В списке желания','newLevel'); ?></span>
    </button>
</div>
<?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; //templates/newLevel/wishlist/button.tpl ?>
<?php if(count($brands) > 0): ?>
    <div class="big-container frame-brands">
        <div class="products-carousel">
            <?php /*carousel_js*/?>
            <div class="frame-title container">
                <div class="title">
                    <span class="text-el"><?php if(isset($title)){ echo $title; } ?></span>
                </div>
            </div>
            <div class="container">
                <div class="frame-brands-carousel">
                    <div class="content-carousel">
                        <ul class="items items-brands">
                            <?php if(is_true_array($brands)){ foreach ($brands as $brand){ ?>
                                <li>
                                    <a href="<?php echo shop_url ( $brand['full_url'] ); ?>" class="frame-photo-title">
                                        <span class="photo-block">
                                            <span class="helper"></span>
                                            <img data-original="<?php echo media_url ( $brand['img_fullpath'] ); ?>" src="<?php if(isset($THEME)){ echo $THEME; } ?>images/blank.gif" title="<?php echo $brand['name']; ?>" alt="<?php echo $brand['name']; ?>" class="lazy"/>
                                        </span>
                                    </a>
                                </li>
                            <?php }} ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="group-button-carousel">
                <button type="button" class="prev arrow">
                    <span class="icon_arrow_p"></span>
                </button>
                <button type="button" class="next arrow">
                    <span class="icon_arrow_n"></span>
                </button>
            </div>
            <div class="container">
                <span class="show-all-brands s-all-d">
                    <a href="<?php echo shop_url ('brand/'); ?>" class="t-d_n f-s_0">
                        <span class="icon_arrow"></span>
                        <span class="text-el"><?php echo lang ('Смотреть все','newLevel'); ?></span>
                    </a>
                </span>
            </div>
        </div>
    </div>
<?php endif; ?><?php $mabilis_ttl=1460567221; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/widgets/brands.tpl ?>
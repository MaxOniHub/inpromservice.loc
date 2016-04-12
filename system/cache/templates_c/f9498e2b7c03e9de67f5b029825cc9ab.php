<?php if(count($products) > 0): ?>
    <section class="special-proposition">
        <div class="frame-title">
            <div class="title">
                <span class="text-el text-proposition-h"><?php if(isset($title)){ echo $title; } ?></span>
            </div>
        </div>
        <div class="big-container">
            <div class="products-carousel frame-scroll-pane">
                <?php /*frame-scroll-pane || carousel_js*/?>
                <div class="content-carousel container">
                    <ul class="items items-catalog items-h-carousel">
                        <?php $CI->load->module('new_level')->OPI($products, array('widget'=>true))?>
                    </ul>
                </div>
                <div class="group-button-carousel">
                    <button type="button" class="prev arrow">
                        <span class="icon_arrow_p"></span>
                    </button>
                    <button type="button" class="next arrow">
                        <span class="icon_arrow_n"></span>
                    </button>
                </div>
            </div>
        </div>
    </section>
<?php endif; ?><?php $mabilis_ttl=1460574559; $mabilis_last_modified=1458569576; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/widgets/action_products.tpl ?>
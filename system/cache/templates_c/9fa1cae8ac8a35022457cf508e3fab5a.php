<?php if(count($products) > 0): ?>
    <section class="special-proposition frame-view-products">
        <div class="big-container">
            <div class="carousel_js products-carousel">
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
<?php else:?>
    <div class="inside-padd">
        <div class="msg f-s_0">
            <div class="info"><span class="icon_info"></span><span class="text-el"><?php echo lang ('No viewed products','newLevel'); ?></span></div>
        </div>
    </div>
<?php endif; ?><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/widgets/ViewedProducts.tpl ?>
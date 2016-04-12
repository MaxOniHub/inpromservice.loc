<?php $CI->load->module('banners')->render()?>
<div class="frame-benefits">
    <?php echo widget ('benefits'); ?>
</div>
<?php /*?><div class="frame-start-page-category-menu">
    <div class="container">
        <?php \Category\RenderMenu::create()->setConfig(array('cache'=>TRUE))->load('start_page_category_menu')?>
    </div>
</div><?php */?>
<div class="horizontal-carousel">
    <div id="popular_products">
        <?php echo widget ('popular_products', TRUE); ?>
    </div>
    <div id="action_products">
        <div class="preloader"></div>
        <?php echo widget_ajax ('action_products', '#action_products'); ?>
    </div>
    <div id="new_products">
        <div class="preloader"></div>
        <?php echo widget_ajax ('new_products', '#new_products'); ?>
    </div>
</div>
<?php echo widget ('brands'); ?>
<div class="frame-seotext-news">
    <div class="frame-seo-text">
        <div class="container">
            <div class="text seo-text">
                <?php echo widget ('start_page_seo_text'); ?>
            </div>
        </div>
    </div>
    <?php echo widget ('latest_news', TRUE); ?>
</div><?php $mabilis_ttl=1460567221; $mabilis_last_modified=1390483720; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/start_page.tpl ?>
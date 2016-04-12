<?php /*
/**
* @file - template for displaying shop category page
* Variables
*   $category: (object) instance of SCategory
*       $category->getDescription(): method which returns category description
*       $category->getName(): method which returns category name according to currenct locale
*   $products: PropelObjectCollection of (object)s instance of SProducts
*       $product->firstVariant: variable which contains the first variant of product
*       $product->firstVariant->toCurrency(): method which returns price according to current currencya and format
*   $totalProducts: integer contains products count
*   $pagination: string variable contains html code for displaying pagination
*   $pageNumber: integer variable contains the current page number
*   $banners: array of (object)s of SBanners which have to be displayed in current page
*/?>

<!--Start. Make bread crumbs -->
<div class="frame-crumbs">
    <?php echo widget ('path'); ?>
</div>
<!--End. Make bread crumbs -->
<div class="frame-inside page-category">
    <div class="container">
        <div class="right-catalog">
            <!-- Start. Category name and count products in category-->
            <div class="f-s_0 title-category">
                <div class="frame-title">
                    <h1 class="d_i title"><?php echo $title?></h1>
                </div>
                <span class="count">(<?php if(isset($totalProducts)){ echo $totalProducts; } ?> <?php echo SStringHelper::Pluralize($totalProducts, array(lang('товар','newLevel'),lang('товара','newLevel'),lang('товаров','newLevel')))?>)</span>
            </div>
            <!-- End. Category name and count products in category-->
            <?php if($totalProducts == 0): ?>
                <!-- Start. Empty category-->
                <div class="msg layout-highlight layout-highlight-msg">
                    <div class="info">
                        <span class="icon_info"></span>
                        <span class="text-el"><?php echo lang ('Не найдено товаров','newLevel'); ?></span>
                    </div>
                </div>
                <!-- End. Empty category-->
            <?php endif; ?>
            <!--Start. Banners block-->
            <?php $CI->load->module('banners')->render($category->getId())?>

            <!--End. Banners-->
            <?php $this->include_tpl('catalogue_header', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop'); ?>
            <!-- Start.If count products in category > 0 then show products list and pagination links -->
            <?php if($totalProducts > 0): ?>
                <ul class="animateListItems items items-catalog <?php if($_COOKIE['listtable'] == 0): ?> table<?php else:?> list<?php endif; ?>" id="items-catalog-main">
                    <!-- Include template for one product item-->
                    <?php $CI->load->module('new_level')->OPI($model, array('wishlist'=>true, 'codeArticle' => true))?>
                </ul>
                <!-- render pagination-->
                <?php if(isset($pagination)){ echo $pagination; } ?>
            <?php endif; ?>
            <!-- End.If count products in category > 0 then show products and pagination links -->
        </div>
        <div class="filter left-catalog">
            <?php if($category->hasSubCats()): ?>
                <div class="frame-category-menu layout-highlight">
                    <div class="title-menu-category">
                        <div class="title-default">
                            <div class="title-h3 title">Категории:</div>
                        </div>
                    </div>
                    <div class="inside-padd">
                        <nav>
                            <ul class="nav nav-vertical nav-category">
                                <?php if(is_true_array($category->getChildsByParentIdI18n($category->getId()))){ foreach ($category->getChildsByParentIdI18n($category->getId()) as $key => $value){ ?>
                                    <li><a href="<?php echo shop_url ('category/' . $value->getFullPath()); ?>"><?php echo $value->getName()?></a></li>
                                    <?php }} ?>
                            </ul>
                        </nav>
                    </div>
                </div>
            <?php endif; ?>
            <!-- Load filter-->
            <?php $CI->load->module('smart_filter')->init()?>
        </div>
        <!--widget for popular products in this category-->
    </div>
</div>
<?php echo widget ('latest_news'); ?>
<?php if(trim($category->getDescription()) != ""): ?>
    <div class="frame-seo-text">
        <div class="container">
            <div class="text seo-text">
                <?php echo trim($category->getDescription())?>
            </div>
        </div>
    </div>
<?php endif; ?>
<!--Start. Popular products -->
<div class="horizontal-carousel">
    <?php echo widget ('popular_products_cartogory_h'); ?>
</div>
<!--End. Popular products -->
<script type="text/javascript" src="<?php if(isset($THEME)){ echo $THEME; } ?>js/cusel-min-2.5.js"></script><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/category.tpl ?>
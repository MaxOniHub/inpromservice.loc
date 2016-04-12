<?php /*/**
* @file Render shop product;
* @partof main.tpl;
* @updated 26 February 2013;
* Variables
*  $model : PropelObjectCollection of (object) instance of SProducts
*   $model->hasDiscounts() : Check whether the discount on the product.
*   $model->firstVariant : variable which contains the first variant of product;
*   $model->firstVariant->toCurrency() : variable which contains price of product;
*
*/?>
<?php $Comments = $CI->load->module('comments')->init($model)?>
<?php $NextCSIdCond = $NextCS != null?>
<div class="frame-crumbs">
    <!-- Making bread crumbs -->
    <?php echo widget ('path'); ?>
</div>

<div class="frame-inside page-product">
    <div class="container z-i_2">
        <div class="clearfix item-product <?php if($model->firstVariant->getStock() == 0): ?>not-avail<?php endif; ?>">
            <div class="f-s_0 title-product">
                <div class="frame-title">
                    <h1 class="d_i"><?php echo  ShopCore::encode($model->getName())?></h1>
                </div>
                <span class="frame-variant-name-code">
                    <span class="frame-variant-code" <?php if(!$model->firstVariant->getNumber()): ?>style="display:none;"<?php endif; ?>>
                        <?php echo lang ('Артикул','newLevel'); ?>:
                        <span class="code">
                            <?php if($model->firstVariant->getNumber()): ?>
                                <?php echo trim ($model->firstVariant->getNumber()); ?>
                            <?php endif; ?>
                        </span>
                    </span>
                    <span class="frame-variant-name" <?php if(!$model->firstVariant->getName()): ?>style="display:none;"<?php endif; ?>>
                        <?php echo lang ('Вариант','newLevel'); ?>:
                        <span class="code">
                            <?php if($model->firstVariant->getName()): ?>
                                <?php echo trim ($model->firstVariant->getName()); ?>
                            <?php endif; ?>
                        </span>
                    </span>
                    <?php if($model->getBrand() != null): ?>
                        <?php $brand = $model->getBrand()->getName()?>
                        <?php $hasBrand = trim($brand) != ''?>
                        <span class="frame-item-brand"><?php echo lang ('Бренд','newLevel'); ?>:
                            <span class="code">
                                <?php if($hasBrand): ?>
                                    <a href="<?php echo shop_url ('brand/'.$model->getBrand()->getUrl()); ?>">
                                        <?php echo trim($brand)?>
                                    </a>
                                <?php endif; ?>
                            </span>
                        </span>
                    <?php endif; ?>
                </span>
            </div>
            <div class="right-product">
                <div id="xBlock"></div>
                <div class="right-product-left">
                    <div class="f-s_0 buy-block">
                        <!--Select variant -->
                        <?php $variants = $model->getProductVariants()?>
                        <?php if(count($variants) > 1): ?>
                            <div class="check-variant-product">
                                <div class="title"><?php echo lang ('Выберите вариант','newLevel'); ?>:</div>
                                <div class="lineForm">
                                    <select name="variant" id="variantSwitcher">
                                        <?php if(is_true_array($model->getProductVariants())){ foreach ($model->getProductVariants() as $key => $productVariant){ ?>
                                            <option value="<?php echo $productVariant->getId()?>">
                                                <?php if($productVariant->getName()): ?>
                                                    <?php echo ShopCore::encode($productVariant->getName())?>
                                                <?php else:?>
                                                    <?php echo ShopCore::encode($model->getName())?>
                                                <?php endif; ?>
                                            </option>
                                        <?php }} ?>
                                    </select>
                                </div>
                            </div>
                        <?php endif; ?>
                        <!--End. Select variant -->
                        <div class="frame-prices-buy-wish-compare">
                            <div class="frame-prices-buy f-s_0">
                                <!-- $model->hasDiscounts() - check for a discount. And show old price-->
                                <div class="frame-prices f-s_0">
                                    <!-- Check for discount-->
                                    <?php $oldoprice = $model->getOldPrice() && $model->getOldPrice() != 0 && $model->getOldPrice() > $model->firstVariant->toCurrency()?>
                                    <?php $hasDiscounts = $model->hasDiscounts()?>
                                    <?php if($hasDiscounts): ?>
                                        <span class="price-discount">
                                            <span>
                                                <span class="price priceOrigVariant"><?php echo $model->firstVariant->toCurrency('OrigPrice')?></span>
                                                <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                            </span>
                                        </span>
                                    <?php endif; ?>
                                    <?php if($oldoprice && !$hasDiscounts): ?>
                                        <span class="price-discount">
                                            <span>
                                                <span class="price priceOrigVariant"><?php echo intval($model->getOldPrice())?></span>
                                                <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                            </span>
                                        </span>
                                    <?php endif; ?>
                                    <!-- Start. Product price-->
                                    <?php if($model->firstVariant->toCurrency() > 0): ?>
                                        <span class="current-prices f-s_0">
                                            <span class="price-new">
                                                <span>
                                                    <span class="price priceVariant"><?php echo $model->firstVariant->toCurrency()?></span>
                                                    <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                </span>
                                            </span>
                                            <?php if($NextCSIdCond): ?>
                                                <span class="price-add">
                                                    <span>
                                                        (<span class="price addCurrPrice"><?php echo $model->firstVariant->toCurrency('Price',$NextCSId)?></span>
                                                        <span class="curr-add"><?php if(isset($NextCS)){ echo $NextCS; } ?></span>)
                                                    </span>
                                                </span>
                                            <?php endif; ?>
                                        </span>
                                    <?php endif; ?>
                                    <!-- End. Product price-->
                                </div>
                                <!-- Start button for main & variants prod -->
                                <div class="funcs-buttons">
                                    <?php if(is_true_array($variants)){ foreach ($variants as $key => $productVariant){ ?>
                                        <?php $discount = 0?>
                                        <?php $hasDiscounts = $model->hasDiscounts()?>
                                        <?php if($hasDiscounts): ?>
                                            <?php $discount = $productVariant->getvirtual('numDiscount')/$productVariant->toCurrency()*100?>
                                        <?php endif; ?>
                                        <?php if($productVariant->getStock() > 0): ?>
                                            <div class="frame-count-buy variant_<?php echo $productVariant->getId()?> variant" <?php if($key != 0): ?>style="display:none"<?php endif; ?>>
                                                <div class="frame-count">
                                                    <div class="number" data-title="<?php echo lang ('Количество на складе','newLevel'); ?> <?php echo $productVariant->getstock()?>" data-prodid="<?php echo $model->getId()?>" data-varid="<?php echo $productVariant->getId()?>" data-rel="frameplusminus">
                                                        <div class="frame-change-count">
                                                            <div class="btn-plus">
                                                                <button type="button">
                                                                    <span class="icon-plus"></span>
                                                                </button>
                                                            </div>
                                                            <div class="btn-minus">
                                                                <button type="button">
                                                                    <span class="icon-minus"></span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <input type="text" value="1" data-rel="plusminus" data-title="<?php echo lang ('Только цифры','newLevel'); ?>" data-min="1" data-max="<?php echo $productVariant->getstock()?>">
                                                    </div>
                                                </div>
                                                <div class="btn-buy btn-buy-p">
                                                    <button class="btnBuy infoBut"
                                                            disabled="disabled"
                                                            type="button"
                                                            data-id="<?php echo $productVariant->getId()?>"
                                                            data-prodid="<?php echo $model->getId()?>"
                                                            data-varid="<?php echo $productVariant->getId()?>"
                                                            data-price="<?php echo $productVariant->toCurrency()?>"
                                                            data-count="1"
                                                            data-name="<?php echo ShopCore::encode($model->getName())?>"
                                                            data-vname="<?php echo trim(ShopCore::encode($productVariant->getName()))?>"
                                                            data-maxcount="<?php echo $productVariant->getstock()?>"
                                                            data-number="<?php echo trim($productVariant->getNumber())?>"
                                                            data-url="<?php echo shop_url('product/'.$model->getUrl())?>"
                                                            data-img="<?php echo $productVariant->getSmallPhoto()?>"
                                                            data-mainImage="<?php echo $productVariant->getMainPhoto()?>"
                                                            data-largeImage="<?php echo $productVariant->getlargePhoto()?>"
                                                            data-origPrice="<?php if($model->hasDiscounts()): ?><?php echo $productVariant->toCurrency('OrigPrice')?><?php endif; ?>"
                                                            data-addPrice="<?php if($NextCSIdCond): ?><?php echo $productVariant->toCurrency('Price',$NextCSId)?><?php endif; ?>"
                                                            data-prodStatus='<?php echo json_encode (promoLabelBtn($model->getAction(), $model->getHot(), $model->getHit(), $discount)); ?>'
                                                            >
                                                        <span class="icon_cleaner icon_cleaner_buy"></span>
                                                        <span class="text-el"><?php echo lang ('Купити'); ?></span>
                                                    </button>
                                                </div>
                                            </div>
                                        <?php else:?>
                                            <div class="d_i-b v-a_m">
                                                <div class="variant_<?php echo $productVariant->getId()?> variant" <?php if($key != 0): ?>style="display:none"<?php endif; ?>>
                                                    <div class="alert-exists"><?php echo lang ('Нет в наличии','newLevel'); ?></div>
                                                    <div class="btn-not-avail">
                                                        <button
                                                            type="button"
                                                            data-drop=".drop-report"
                                                            data-source="/shop/ajax/getNotifyingRequest"

                                                            data-id="<?php echo $productVariant->getId()?>"
                                                            data-prodid="<?php echo $model->getId()?>"
                                                            data-varid="<?php echo $productVariant->getId()?>"
                                                            data-url="<?php echo shop_url('product/'.$model->getUrl())?>"
                                                            data-price="<?php echo $productVariant->toCurrency()?>"
                                                            data-origPrice="<?php if($model->hasDiscounts()): ?><?php echo $productVariant->toCurrency('OrigPrice')?><?php endif; ?>"
                                                            data-addPrice="<?php if($NextCSIdCond): ?><?php echo $productVariant->toCurrency('Price',$NextCSId)?><?php endif; ?>"
                                                            data-name="<?php echo ShopCore::encode($model->getName())?>"
                                                            data-vname="<?php echo trim(ShopCore::encode($productVariant->getName()))?>"
                                                            data-maxcount="<?php echo $productVariant->getstock()?>"
                                                            data-number="<?php echo trim($productVariant->getNumber())?>"
                                                            data-img="<?php echo $productVariant->getSmallPhoto()?>"
                                                            data-mainImage="<?php echo $productVariant->getMainPhoto()?>"
                                                            data-largeImage="<?php echo $productVariant->getlargePhoto()?>"
                                                            class="infoBut">
                                                            <span class="icon-but"></span>
                                                            <span class="text-el"><?php echo lang ('Сообщить о появлении','newLevel'); ?></span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                    <?php }} ?>
                                </div>
                            </div>
                            <!-- end. frame-prices-buy -->
                            <div class="frame-wish-compare-list f-s_0">
                                <!-- Wish List buttons -->
                                <?php if(is_true_array($variants)){ foreach ($variants as $key => $pv){ ?>
                                    <div class="frame-btn-wish variant_<?php echo $pv->getId()?> variant" <?php if($key != 0): ?>style="display:none"<?php endif; ?> data-id="<?php echo $model->getId()?>" data-varid="<?php echo $pv->getId()?>">
                                        <?php $CI->load->module('wishlist')->renderWLButton($pv->getId())?>
                                    </div>
                                <?php }} ?>
                                <!-- end of Wish List buttons -->
                                <!-- compare buttons -->
                                <div class="frame-btn-compare">
                                    <div class="btn-compare" data-prodid="<?php echo $model->getId()?>">
                                        <button class="toCompare"
                                                data-prodid="<?php echo $model->getId()?>"
                                                type="button"
                                                data-title="<?php echo lang ('До порівнянн','newLevel'); ?>"
                                                data-firtitle="<?php echo lang ('До порівняння','newLevel'); ?>"
                                                data-sectitle="<?php echo lang ('В сравнении','newLevel'); ?>"
                                                data-rel="tooltip">
                                            <span class="icon_compare"></span>
                                            <span class="text-el d_l"><?php echo lang ('До порівняння','newLevel'); ?></span>
                                        </button>
                                    </div>
                                </div>
                                <!-- end of compare buttons -->
                            </div>
                            <!-- End button for main & variants prod -->
                        </div>
                        <!-- end. frame-prices-buy-wish-compare -->
                    </div>
                    <!-- end. buy-block -->
                    <!-- Start. Description -->
                    <?php //if trim($model->getShortDescription()) != ''?>
                    <?php if(false): ?>
                        <div class="short-desc">
                            <?php echo $model->getShortDescription()?>
                        </div>
                    <?php elseif ($props = ShopCore::app()->SPropertiesRenderer->renderPropertiesInlineNew($model->getId())): ?>
                        <div class="short-desc">
                            <p><?php echo $props?></p>
                        </div>
                    <?php endif; ?>
                    <!--  End. Description -->
                    <!--Start .Share-->
                    <dl class="social-product">
                        <dt class="s-t text-social-like"><?php echo lang ('Понравился товар?', 'newLevel'); ?></dt>
                        <dd class="social-like">
                            <?php echo $CI->load->module('share')->_make_like_buttons()?>
                        </dd>
                        <dt class="s-t text-social-tell"><?php echo lang ('Рассказать друзьям:', 'newLevel'); ?></dt>
                        <dd class="social-tell">
                            <?php echo $CI->load->module('share')->_make_share_form()?>
                        </dd>
                    </dl>
                    <!-- End. Share -->
                </div>
                <!-- end. right-product-left -->
                <div class="right-product-right">
                    <!--Start. Payments method form -->
                    <?php echo widget ('payments_delivery_methods_info'); ?>
                    <!--End. Payments method form -->
                </div>
            </div>
            <div class="left-product">
                <?php $sizeAddImg = sizeof($productImages = $model->getSProductImagess())?>
                <a rel="position: 'xBlock'" onclick="return false;" href="<?php echo $model->firstVariant->getLargePhoto()?>" class="frame-photo-title photoProduct cloud-zoom" id="photoGroup" title="<?php echo ShopCore::encode($model->getName())?>">
                    <span class="photo-block">
                        <span class="helper"></span>
                        <img src="<?php echo $model->firstVariant->getMainPhoto()?>" alt="<?php echo ShopCore::encode($model->getName())?> - <?php echo $model->getId()?>" id="vimg" title="<?php echo ShopCore::encode($model->getName())?> - <?php echo $model->getId()?>"/>
                        <?php $discount = 0?>
                        <?php if($hasDiscounts): ?>
                            <?php $discount = $model->firstVariant->getvirtual('numDiscount')/$model->firstVariant->toCurrency('origprice')*100?>
                        <?php endif; ?>
                        <?php echo promoLabel ($model->getAction(), $model->getHot(), $model->getHit(), $discount); ?>
                    </span>
                </a>
                <!-- End. Photo block-->
                <!-- Star rating -->
                <?php if($model->enable_comments && intval($Comments[$model->getId()]) !== 0): ?>
                    <div class="frame-star t-a_j">
                        <?php $CI->load->module('star_rating')->show_star_rating($model, false)?>
                        <div class="d-i_b">
                            <button data-trigger="[data-href='#comment']" data-scroll="true" class="count-response d_l">
                                <?php echo intval ($Comments[$model->getId()]); ?>
                                <?php echo SStringHelper::Pluralize($Comments[$model->getId()], array(lang("отзыв","newLevel"),lang("отзыва","newLevel"),lang("отзывов","newLevel")))?>
                            </button>
                        </div>
                    </div>
                <?php else:?>
                    <div class="frame-star t-a_j">
                        <div class="d_i-b">
                            <button data-trigger="[data-href='#comment']" data-scroll="true" class="count-null-response d_l"><?php echo lang ('Оставить отзыв','newLevel'); ?></button>
                        </div>
                    </div>
                <?php endif; ?>
                <!-- End. Star rating-->
                <!--Additional images-->
                <?php if($sizeAddImg > 0): ?>
                    <ul data-rel="mainThumbPhoto">
                        <li class="d_n">
                            <a <?php /*rel="group"*/?> href="<?php echo $model->firstVariant->getLargePhoto()?>" title="<?php echo ShopCore::encode($model->getName())?>">
                                <span class="photo-block">
                                    <span class="helper"></span>
                                    <img src="<?php echo $model->firstVariant->getSmallPhoto()?>" alt="<?php echo ShopCore::encode($model->getName())?>"/>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div class="horizontal-carousel">
                        <div class="frame-thumbs carousel_js">
                            <?php /*carousel_js*/?>
                            <div class="content-carousel">
                                <ul class="items-thumbs items">
                                    <!--if cloudzoom-->
                                    <li class="active">
                                        <a rel="useZoom: 'photoGroup', smallImage: '<?php echo $model->firstVariant->getMainPhoto()?>'" href="<?php echo $model->firstVariant->getLargePhoto()?>" title="<?php echo ShopCore::encode($model->getName())?>" class="cloud-zoom-gallery">
                                            <span class="photo-block">
                                                <span class="helper"></span>
                                                <img src="<?php echo $model->firstVariant->getSmallPhoto()?>" alt="<?php echo ShopCore::encode($model->getName())?>"/>
                                            </span>
                                        </a>
                                    </li>
                                    <!--if cloudzoom -->
                                    <?php if(is_true_array($productImages)){ foreach ($productImages as $key => $image){ ?>
                                        <li>
                                            <a <?php /*rel="group"*/?> rel="useZoom: 'photoGroup', smallImage: '<?php echo productImageUrl ('products/additional/'.$image->getImageName()); ?>'" href="<?php echo productImageUrl ('products/additional/'.$image->getImageName()); ?>" title="<?php echo ShopCore::encode($model->getName())?>" class="cloud-zoom-gallery">
                                                <span class="photo-block">
                                                    <span class="helper"></span>
                                                    <img src="<?php echo productImageUrl('products/additional/thumb_'.$image->getImageName())?>" alt="<?php echo ShopCore::encode($model->getName())?> - <?php echo ++$key?>"/>
                                                </span>
                                            </a>
                                        </li>
                                    <?php }} ?>
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
                <?php endif; ?>
                <!--End block-->
            </div>
        </div>
    </div>
    <div class="frame-benefits-product">
        <div class="frame-benefits">
            <?php echo widget ('benefits'); ?>
        </div>
    </div>
    <!--Kit start-->
    <?php if($model->getShopKits() && $model->getShopKits()->count() > 0): ?>
        <div class="container">
            <section class="frame-complect horizontal-carousel">
                <div class="title-complect">
                    <div class="title"><?php echo lang ('Специальное предложение! Купить, установить и получить скидку на аксессуары!','newLevel'); ?></div>
                </div>
                <div class="carousel_js products-carousel complects-carousel">
                    <div class="content-carousel">
                        <ul class="items-complect items">
                            <?php if(is_true_array($model->getShopKits())){ foreach ($model->getShopKits() as $key => $kitProducts){ ?>
                                <li>
                                    <ul class="items items-bask row-kits">
                                        <!-- main product -->

                                        <li>
                                            <div class="frame-kit main-product">
                                                <div class="frame-photo-title">
                                                    <span class="photo-block">
                                                        <span class="helper"></span>
                                                        <img src="<?php echo $kitProducts->getMainProduct()->firstVariant->getSmallPhoto()?>" alt="<?php echo ShopCore::encode($kitProducts->getMainProduct()->getName())?>"/>
                                                        <?php echo promoLabel ($kitProducts->getSProducts()->getAction(), $kitProducts->getSProducts()->getHot(), $kitProducts->getSProducts()->getHit(), 0); ?>
                                                    </span>
                                                    <span class="title"><?php echo ShopCore::encode($model->getName())?></span>
                                                </div>
                                                <div class="description">
                                                    <div class="frame-prices f-s_0">
                                                        <!-- Start. Product price-->
                                                        <span class="current-prices f-s_0">
                                                            <span class="price-new">
                                                                <span>
                                                                    <span class="price priceVariant"><?php echo $kitProducts->getMainProductPrice()?></span>
                                                                    <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                                </span>
                                                            </span>
                                                            <?php if($NextCSIdCond): ?>
                                                                <span class="price-add">
                                                                    <span>

                                                                        (<span class="price addCurrPrice"><?php echo $kitProducts->getMainProductPrice($NextCSId)?></span>

                                                                        <span class="curr-add"><?php if(isset($NextCS)){ echo $NextCS; } ?></span>)
                                                                    </span>
                                                                </span>
                                                            <?php endif; ?>
                                                        </span>
                                                        <!-- End. Product price-->
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- /end main product -->
                                        <?php if(is_true_array($kitProducts->getShopKitProducts())){ foreach ($kitProducts->getShopKitProducts() as $key => $kitProduct){ ?>
                                            <!-- additional product -->
                                            <li>
                                                <div class="next-kit">+</div>
                                                <div class="frame-kit">
                                                    <a href="<?php echo shop_url ('product/' . $kitProduct->getSProducts()->getUrl()); ?>" class="frame-photo-title">
                                                        <span class="photo-block">
                                                            <span class="helper"></span>
                                                            <img src="<?php echo $kitProduct->getSProducts()->firstVariant->getSmallPhoto()?>" alt="<?php echo ShopCore::encode($kitProduct->getSProducts()->getName())?>"/>

                                                            <?php $discount = $kitProduct->getDiscount()?>

                                                            <?php echo promoLabel ($kitProduct->getSProducts()->getAction(), $kitProduct->getSProducts()->getHot(), $kitProduct->getSProducts()->getHit(), $discount); ?>
                                                        </span>
                                                        <span class="title"><?php echo ShopCore::encode($kitProduct->getSProducts()->getName())?></span>
                                                    </a>
                                                    <div class="description">
                                                        <div class="frame-prices f-s_0">
                                                            <!-- Check for discount-->
                                                            <?php if($kitProduct->getDiscount()): ?>
                                                                <span class="price-discount">
                                                                    <span>
                                                                        <span class="price priceOrigVariant"><?php echo $kitProduct->getKitProductPrice()?></span>
                                                                        <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                                    </span>
                                                                </span>
                                                            <?php endif; ?>
                                                            <!-- Start. Product price-->

                                                            <span class="current-prices f-s_0">
                                                                <span class="price-new">
                                                                    <span>
                                                                        <span class="price priceVariant"><?php echo $kitProduct->getKitNewPrice()?></span>
                                                                        <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                                    </span>
                                                                </span>
                                                                <?php if($NextCSIdCond): ?>
                                                                    <span class="price-add">
                                                                        <span>
                                                                            (<span class="price addCurrPrice"><?php echo $kitProduct->getKitNewPrice($NextCSId)?></span>
                                                                            <span class="curr-add"><?php if(isset($NextCS)){ echo $NextCS; } ?></span>)
                                                                        </span>
                                                                    </span>
                                                                <?php endif; ?>
                                                            </span>

                                                            <!-- End. Product price-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- /additional product -->
                                        <?php }} ?>
                                    </ul>
                                    <!-- total -->
                                    <div class="complect-gen-sum">
                                        <div class="gen-sum-kit">=</div>
                                        <div class="frame-gen-price-buy-complect">
                                            <div class="frame-prices f-s_0">
                                                <span class="price-discount">
                                                    <span>
                                                        <span class="price"><?php echo $kitProducts->getTotalPriceOld()?></span>
                                                        <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                    </span>
                                                </span>
                                                <span class="current-prices f-s_0">
                                                    <span class="price-new">
                                                        <span>
                                                            <span class="price"><?php echo $kitProducts->getTotalPrice()?></span>
                                                            <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                                                        </span>
                                                    </span>
                                                    <?php if($NextCSIdCond): ?>
                                                        <span class="price-add">
                                                            <span>
                                                                (<span class="price"><?php echo $kitProducts->getTotalPrice($NextCSId)?></span>
                                                                <span class="curr-add"><?php if(isset($NextCS)){ echo $NextCS; } ?></span>)
                                                            </span>
                                                        </span>
                                                    <?php endif; ?>
                                                </span>
                                            </div>
                                            <div class="btn-buy">
                                                <button class="btnBuy" type="button"
                                                        data-prodid="<?php echo implode(',', $kitProducts->getProductIdCart())?>"
                                                        data-price="<?php echo $kitProducts->getTotalPrice()?>"
                                                        data-prices ="<?php echo json_encode($kitProducts->getPriceCart())?>"
                                                        data-addprice="<?php if($NextCSIdCond): ?><?php echo $kitProducts->getTotalPrice($NextCSId)?><?php endif; ?>"
                                                        data-addprices="<?php if($NextCSIdCond): ?><?php echo json_encode($kitProducts->getPriceCart($NextCSId))?><?php endif; ?>"
                                                        data-origprices='<?php echo json_encode($kitProducts->getOrigPriceCart())?>'
                                                        data-origprice='<?php echo $kitProducts->getTotalPriceOld()?>'
                                                        data-name="<?php echo ShopCore::encode(json_encode($kitProducts->getNamesCart()))?>"
                                                        data-kit="true"
                                                        data-kitId="<?php echo $kitProducts->getId()?>"
                                                        data-varid="<?php echo $kitProducts->getMainProduct()->firstVariant->getId()?>"
                                                        data-url='<?php echo json_encode($kitProducts->getUrls())?>'
                                                        data-img='<?php echo json_encode($kitProducts->getImgs())?>'
                                                        data-maxcount='<?php echo $kitProduct->getSProducts()->firstVariant->getStock()?>'
                                                        data-count='1'
                                                        data-prodstatus='<?php echo json_encode ($kitProducts->getKitStatus()); ?>'
                                                        >
                                                    <span class="icon_cleaner icon_cleaner_buy"></span>
                                                    <span class="text-el"><?php echo lang ('Купити'); ?></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /total -->
                                </li>
                            <?php }} ?>
                        </ul>
                    </div>
                    <!-- Start. Buttons for next/prev kit-->
                    <div class="group-button-carousel">
                        <button type="button" class="prev arrow">
                            <span class="icon_arrow_p"></span>
                        </button>
                        <button type="button" class="next arrow">
                            <span class="icon_arrow_n"></span>
                        </button>
                    </div>
                    <!-- Start. Buttons for next/prev kit-->
                </div>
            </section>
        </div>
    <?php endif; ?>
    <!--        End. Buy kits-->
    <div class="container f-s_0">
        <!--        Start. Tabs block       -->
        <ul class="tabs tabs-data tabs-product">
            <li class="active">
                <button data-href="#view"><?php echo lang ('Обзор','newLevel'); ?></button>
            </li>
            <?php if($dl_properties = ShopCore::app()->SPropertiesRenderer->renderPropertiesTableNew($model->getId())): ?>

                <li><button data-href="#first" data-source="<?php echo shop_url ('product_api/renderProperties'); ?>" data-data='{"product_id": <?php echo $model->getId()?>}' data-selector=".characteristic"><?php echo lang ('Свойства','newLevel'); ?></button></li>
            <?php endif; ?>
            <?php if($fullDescription = $model->getFullDescription()): ?>
                <li><button data-href="#second" data-source="<?php echo shop_url ('product_api/renderFullDescription'); ?>" data-data='{"product_id": <?php echo $model->getId()?>}' data-selector=".inside-padd > .text"><?php echo lang ('Полное описание','newLevel'); ?></button></li>
            <?php endif; ?>
            <?php if($accessories): ?>
                <li><button data-href="#fourth" data-source="<?php echo shop_url ('product_api/getAccessories'); ?>" data-data='{"product_id": <?php echo $model->getId()?>}' data-selector=".inside-padd > .items"><?php echo lang ('Аксессуары','newLevel'); ?></button></li>
            <?php endif; ?>
            <!--Output of the block comments-->
            <?php if($Comments && $model->enable_comments): ?>
                <li>
                    <button type="button" data-href="#comment" onclick="Comments.renderPosts($('#comment .inside-padd'))">
                        <span class="icon_comment-tab"></span>
                        <span class="text-el">
                            <span id="cc">
                                <?php if(intval($Comments[$model->getId()][0]) !== 0): ?>
                                    <?php echo intval($Comments[$model->getId()])?>
                                    <?php echo SStringHelper::Pluralize($Comments[$model->getId()], array(lang("отзыв","newLevel"),lang("отзыва","newLevel"),lang("отзывов","newLevel")))?>
                                <?php else:?>
                                    <?php echo lang ('Оставить отзыв','newLevel'); ?>
                                <?php endif; ?>
                            </span>
                        </span>
                    </button>
                </li>
            <?php endif; ?>
        </ul>
        <div class="frame-tabs-ref frame-tabs-product">
            <div id="view">

                <?php if($dl_properties): ?>
                    <div class="inside-padd">
                        <h2><?php echo lang ('Свойства','newLevel'); ?></h2>
                        <div class="characteristic">
                            <div class="product-charac patch-product-view">
                                <?php echo $dl_properties?>
                            </div>
                            <button class="t-d_n f-s_0 s-all-d ref d_n_" data-trigger="[data-href='#first']" data-scroll="true">
                                <span class="icon_arrow"></span>
                                <span class="text-el"><?php echo lang ('Просмотреть все спецификации','newLevel'); ?></span>
                            </button>
                        </div>

                    </div>
                <?php endif; ?>
                <?php if($fullDescription != ''): ?>
                    <div class="inside-padd">
                        <!--                        Start. Description block-->
                        <div class="product-descr patch-product-view">
                            <div class="text">
                                <div class="title-h2"><?php echo lang ('Описание' , 'newLevel'); ?></div>
                                <h2><?php echo  ShopCore::encode($model->getName())?></h2>
                                <?php echo $fullDescription?>
                            </div>
                        </div>
                        <button class="t-d_n f-s_0 s-all-d ref d_n_" data-trigger="[data-href='#second']" data-scroll="true">
                            <span class="icon_arrow"></span>
                            <span class="text-el"><?php echo lang ('Полное описание','newLevel'); ?></span>
                        </button>
                        <!--                        End. Description block-->
                    </div>

                <?php endif; ?>

                <div class="inside-padd">
                    <!--Start. Comments block-->
                    <div class="frame-form-comment">
                        <?php $c=$CI->load->module('comments/commentsapi')->renderAsArray($CI->uri->uri_string())?>
                        <div class="for_comments">
                            <?php echo $c['comments']?>
                        </div>
                        <!--End. Comments block-->
                    </div>
                </div>
                <?php if($accessories): ?>
                    <div class="accessories">
                        <div class="title-default">
                            <div class="title">
                                <h2 class="d_i"><?php echo lang ('Аксессуары','newLevel'); ?> <?php echo $model->getName()?></h2>
                                <?php if(count($accessories) > 4): ?>
                                    <button class="t-d_n f-s_0 s-all-d ref s-all-marg" data-trigger="[data-href='#fourth']" data-scroll="true">
                                        <span class="icon_arrow"></span>
                                        <span class="text-el"><?php echo lang ('Смотреть все аксессуары','newLevel'); ?></span>
                                    </button>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="inside-padd">
                            <ul class="items items-default">
                                <?php $CI->load->module('new_level')->OPI($accessories, array('defaultItem'=>true, 'limit'=>4))?>
                            </ul>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
            <!--             Start. Characteristic-->
            <div id="first">
                <div class="inside-padd">
                    <div class="title-h2"><?php echo lang ('Свойства', 'newLevel'); ?></div>
                    <div class="characteristic">
                        <div class="preloader"></div>
                    </div>
                </div>
            </div>
            <!--                    End. Characteristic-->
            <div id="second">
                <div class="inside-padd">
                    <div class="title-h2"><?php echo lang ('Описание' , 'newLevel'); ?></div>
                    <div class="text">
                        <div class="preloader"></div>
                    </div>
                </div>
            </div>
            <div id="comment">
                <div class="inside-padd for_comments">
                    <div class="preloader"></div>
                </div>
            </div>
            <!--Block Accessories Start-->
            <?php if($accessories): ?>
                <div id="fourth" class="accessories">
                    <div class="inside-padd">
                        <div class="title-h2"><?php echo lang ('Аксессуары','newLevel'); ?> <?php echo $model->getName()?></div>
                        <ul class="items items-default">
                            <div class="preloader"></div>
                        </ul>
                    </div>
                </div>
            <?php endif; ?>
            <!--End. Block Accessories-->
        </div>
    </div>
    <!-- End. Tabs block       -->
</div>
</div>
<div class="horizontal-carousel">
    <?php echo widget ('similar'); ?>
</div>
<?php echo widget ('latest_news'); ?>
<script type="text/javascript">
    var hrefCategoryProduct = "<?php if(isset($category_url)){ echo $category_url; } ?>";
</script>
    <script type="text/javascript">
        var
                //productPhotoFancybox = true,
                productPhotoDrop = true,
                productPhotoCZoom = true,
                forThumbFancybox = "body{background-color:#fff;text-align: center;height:100%;margin:0;}img{height: auto; max-width: 100%; vertical-align: middle; border: 0; width: auto\9;max-height: 100%; -ms-interpolation-mode: bicubic; }.helper{vertical-align: middle;width: 0;height: 100%;padding: 0 !important;border: 0 !important;display: inline-block;}.helper + *{vertical-align: middle;display: inline-block;word-break: break-word;}";
    </script>

<?php /*
<script type="text/javascript" src="<?php if(isset($THEME)){ echo $THEME; } ?>js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/fancybox.css" media="all" />
*/?>
<script type="text/javascript" src="<?php if(isset($THEME)){ echo $THEME; } ?>js/cloud-zoom.1.0.3.min.js"></script>
<script type="text/javascript" src="<?php if(isset($THEME)){ echo $THEME; } ?>js/cusel-min-2.5.js"></script>
<div class="drop drop-style" id="photo">
    <button type="button" class="icon_times_drop" data-closed="closed-js"></button>
    <div class="drop-header">
        <div class="title"></div>
    </div>
    <div class="drop-content-photo">
        <div class="inside-padd">
        </div>
        <div class="horizontal-carousel">
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
    <div class="drop-footer">
    </div>
</div><?php $mabilis_ttl=1460568523; $mabilis_last_modified=1459451840; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/product.tpl ?>
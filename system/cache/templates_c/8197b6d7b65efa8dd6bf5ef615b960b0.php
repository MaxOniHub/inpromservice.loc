<?php echo var_dump ($limit != false && $limit != NULL); ?>
<?php $widget = $widget != false && $widget != NULL?>
<?php $default = $defaultItem != false && $defaultItem != NULL?>
<?php $wishlist = $wishlist != false && $wishlist != NULL?>
<?php $compare = $compare != false && $compare != NULL?>
<?php $codeArticle = $codeArticle != false && $codeArticle != NULL?>
<?php $defaultItem = $defaultItem != false && $defaultItem != NULL?>
<?php $limit = $limit != false && $limit != NULL?>

<?php if(is_true_array($products)){ foreach ($products as $key => $p){ ?>
    <?php if($key >= $limit && $limit): ?>
        <?php break?>
    <?php endif; ?>
    <?php $Comments = $CI->load->module('comments')->init($p)?>
    <li <?php if($p->firstVariant->getStock() == 0): ?>class="not-avail"<?php endif; ?> data-pos="top">
        <a href="<?php echo shop_url ('product/' . $p->getUrl()); ?>" class="frame-photo-title" title="<?php echo ShopCore::encode($p->getName())?>">
            <span class="photo-block">
                <span class="helper"></span>
                <?php $photo = $p->firstVariant->getMediumPhoto()?>
                <img data-original="<?php echo $photo?>"
                     src="<?php if(isset($THEME)){ echo $THEME; } ?>images/blank.gif"
                     alt="<?php echo ShopCore::encode($p->firstVariant->getName())?>"
                     class="vimg lazy"/>
                <?php $discount = 0?>
                <?php if($p->hasDiscounts()): ?>
                    <?php $discount = $p->firstVariant->getvirtual('numDiscount') / $p->firstVariant->toCurrency('origprice') * 100?>
                <?php endif; ?>
                <?php echo promoLabel ($p->getAction(), $p->getHot(), $p->getHit(), $discount); ?>
            </span>
            <span class="title"><?php echo ShopCore::encode($p->getName())?></span>
        </a>
        <div class="description">
            <?php if($codeArticle): ?>
                <div class="frame-variant-name-code">
                    <?php $hasCode = $p->firstVariant->getNumber() == ''?>
                    <span class="frame-variant-code" <?php if($hasCode): ?>style="display:none;"<?php endif; ?>><?php echo lang ('Артикул','newLevel'); ?>:
                        <span class="code">
                            <?php if(!$hasCode): ?>
                                <?php echo trim ($p->firstVariant->getNumber()); ?>
                            <?php endif; ?>
                        </span>
                    </span>
                    <?php $hasVariant = $p->firstVariant->getName() == ''?>
                    <span class="frame-variant-name" <?php if($hasVariant): ?>style="display:none;"<?php endif; ?>><?php echo lang ('Вариант','newLevel'); ?>:
                        <span class="code">
                            <?php if(!$hasVariant): ?>
                                <?php echo trim ($p->firstVariant->getName()); ?>
                            <?php endif; ?>
                        </span>
                    </span>
                    <?php if($brand = $p->getBrand()): ?>
                        <?php $brand = $brand->getName()?>
                        <?php $hasBrand = trim($brand) != ''?>
                        <span class="frame-item-brand"><?php echo lang ('Бренд','newLevel'); ?>:
                            <span class="code">
                                <?php if($hasBrand): ?>
                                    <a href="<?php echo shop_url ('brand/'.$p->getBrand()->getUrl()); ?>">
                                        <?php echo trim($brand)?>
                                    </a>
                                <?php endif; ?>
                            </span>
                        </span>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
            <?php if(!$vertical): ?>
                <?php if($p->enable_comments && intval($Comments[$p->getId()]) !== 0): ?>
                    <div class="frame-star f-s_0">
                        <?php $CI->load->module('star_rating')->show_star_rating($p, false)?>
                        <a href="<?php echo shop_url ('product/'.$p->url.'#comment'); ?>" class="count-response">
                            <?php echo intval ($Comments[$p->getId()]); ?>
                            <?php echo SStringHelper::Pluralize($Comments[$p->getId()], array(lang("отзыв","newLevel"),lang("отзыва","newLevel"),lang("отзывов","newLevel")))?>
                        </a>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
            <div class="frame-prices f-s_0">
                <!-- Check for discount-->
                <?php $oldoprice = $p->getOldPrice() && $p->getOldPrice() != 0 && $p->getOldPrice() > $p->firstVariant->toCurrency()?>
                <?php $hasDiscounts = $p->hasDiscounts()?>
                <?php if($hasDiscounts): ?>
                    <span class="price-discount">
                        <span>
                            <span class="price priceOrigVariant"><?php echo $p->firstVariant->toCurrency('OrigPrice')?></span>
                            <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                        </span>
                    </span>
                <?php endif; ?>
                <?php if($oldoprice && !$hasDiscounts): ?>
                    <span class="price-discount">
                        <span>
                            <span class="price priceOrigVariant"><?php echo intval($p->getOldPrice())?></span>
                            <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                        </span>
                    </span>
                <?php endif; ?>
                <?php if($p->firstVariant->toCurrency() > 0): ?>
                    <span class="current-prices f-s_0">
                        <span class="price-new">
                            <span>
                                <span class="price priceVariant"><?php echo $p->firstVariant->toCurrency()?></span>
                                <span class="curr"><?php if(isset($CS)){ echo $CS; } ?></span>
                            </span>
                        </span>
                        <?php if($NextCS != null): ?>
                            <span class="price-add">
                                <span>
                                    (<span class="price addCurrPrice"><?php echo $p->firstVariant->toCurrency('Price',$NextCSId)?></span>
                                    <span class="curr-add"><?php if(isset($NextCS)){ echo $NextCS; } ?></span>)
                                </span>
                            </span>
                        <?php endif; ?>
                    </span>
                <?php endif; ?>
            </div>
            <?php $variants = $p->getProductVariants()?>
            <?php if(!$widget && !$defaultItem && !$compare): ?>
                <?php if(count($variants) > 1): ?>
                    <div class="check-variant-catalog">
                        <div class="lineForm">
                            <select id="сVariantSwitcher_<?php echo $p->firstVariant->getId()?>" name="variant">
                                <?php if(is_true_array($variants)){ foreach ($variants as $key => $pv){ ?>
                                    <?php if($pv->getName()): ?>
                                        <?php $name = ShopCore::encode($pv->getName())?>
                                    <?php else:?>
                                        <?php $name = ShopCore::encode($p->getName())?>
                                    <?php endif; ?>
                                    <option value="<?php echo $pv->getId()?>" title="<?php echo $name?>">
                                        <?php echo $name?>
                                    </option>
                                <?php }} ?>
                            </select>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endif; ?>

            <!--            End. Price-->
            <div class="funcs-buttons">
                <!-- Start. Collect information about Variants, for future processing -->
                <?php if(is_true_array($variants)){ foreach ($variants as $key => $pv){ ?>
                    <?php if($pv->getStock() > 0): ?>
                        <div class="frame-count-buy variant_<?php echo $pv->getId()?> variant" <?php if($key != 0): ?>style="display:none"<?php endif; ?>>
                            <?php if(!$widget && !$default): ?>
                                <div class="frame-count">
                                    <div class="number" data-title="<?php echo lang ('Количество на складе','newLevel'); ?> <?php echo $pv->getstock()?>" data-prodid="<?php echo $p->getId()?>" data-varid="<?php echo $pv->getId()?>" data-rel="frameplusminus">
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
                                        <input type="text" value="1" data-rel="plusminus" data-title="<?php echo lang ('Только цифры','newLevel'); ?>" data-min="1" data-max="<?php echo $pv->getstock()?>">
                                    </div>
                                </div>
                            <?php endif; ?>
                            <div class="btn-buy">
                                <button
                                    <?php $discount = 0?>
                                    <?php if($hasDiscounts): ?>
                                        <?php $discount = $pv->getvirtual('numDiscount')/$pv->toCurrency()*100?>
                                    <?php endif; ?>
                                    disabled="disabled"
                                    class="btnBuy infoBut"
                                    type="button"
                                    data-id="<?php echo $pv->getId()?>"
                                    data-prodid="<?php echo $p->getId()?>"
                                    data-varid="<?php echo $pv->getId()?>"
                                    data-count="1"
                                    data-name="<?php echo ShopCore::encode($p->getName())?>"
                                    data-vname="<?php echo trim(ShopCore::encode($pv->getName()))?>"
                                    data-maxcount="<?php echo $pv->getstock()?>"
                                    data-number="<?php echo trim($pv->getNumber())?>"
                                    data-mediumImage="<?php echo $pv->getMediumPhoto()?>"
                                    data-img="<?php echo $pv->getSmallPhoto()?>"
                                    data-url="<?php echo shop_url('product/'.$p->getUrl())?>"
                                    data-price="<?php echo $pv->toCurrency()?>"
                                    data-origPrice="<?php if($p->hasDiscounts()): ?><?php echo $pv->toCurrency('OrigPrice')?><?php endif; ?>"
                                    data-addPrice="<?php if($NextCS != null): ?><?php echo $pv->toCurrency('Price',$NextCSId)?><?php endif; ?>"
                                    data-prodStatus='<?php echo json_encode (promoLabelBtn($p->getAction(), $p->getHot(), $p->getHit(), $discount)); ?>'>
                                    <span class="icon_cleaner icon_cleaner_buy"></span>
                                    <span class="text-el"><?php echo lang ('Купити', 'newLevel'); ?></span>
                                </button>
                            </div>
                        </div>
                    <?php else:?>
                        <div class="btn-not-avail variant_<?php echo $pv->getId()?> variant" <?php if($key != 0): ?>style="display:none"<?php endif; ?>>
                            <button
                                class="infoBut"
                                type="button"
                                data-drop=".drop-report"
                                data-source="/shop/ajax/getNotifyingRequest"

                                data-id="<?php echo $pv->getId()?>"
                                data-prodid="<?php echo $p->getId()?>"
                                data-varid="<?php echo $pv->getId()?>"
                                data-url="<?php echo shop_url('product/'.$p->getUrl())?>"
                                data-price="<?php echo $pv->toCurrency()?>"
                                data-origPrice="<?php if($p->hasDiscounts()): ?><?php echo $pv->toCurrency('OrigPrice')?><?php endif; ?>"
                                data-addPrice="<?php if($NextCS != null): ?><?php echo $pv->toCurrency('Price',$NextCSId)?><?php endif; ?>"
                                data-name="<?php echo ShopCore::encode($p->getName())?>"
                                data-vname="<?php echo trim(ShopCore::encode($pv->getName()))?>"
                                data-maxcount="<?php echo $pv->getstock()?>"
                                data-number="<?php echo trim($pv->getNumber())?>"
                                data-img="<?php echo $pv->getSmallPhoto()?>"
                                data-mediumImage="<?php echo $pv->getMediumPhoto()?>"
                                <span class="icon-but"></span>
                                <span class="text-el"><?php echo lang ('Сообщить о появлении','newLevel'); ?></span>
                            </button>
                        </div>
                    <?php endif; ?>
                <?php }} ?>
            </div>
            <?php if(!$widget && !$defaultItem): ?>
                <div class="p_r frame-without-top">
                    <div class="frame-wish-compare-list no-vis-table">
                        <?php if($wishlist): ?>
                            <!-- Wish List buttons -->
                            <?php if(is_true_array($variants)){ foreach ($variants as $key => $pv){ ?>
                                <div class="frame-btn-wish variant_<?php echo $pv->getId()?> variant d_i-b_" <?php if($key != 0): ?>style="display:none"<?php endif; ?> data-id="<?php echo $p->getId()?>" data-varid="<?php echo $pv->getId()?>">
                                    <?php $CI->load->module('wishlist')->renderWLButton($pv->getId())?>
                                </div>
                            <?php }} ?>
                            <!-- end of Wish List buttons -->
                        <?php endif; ?>
                        <?php if(!$compare): ?>
                            <div class="frame-btn-comp">
                                <!-- compare buttons -->
                                <div class="btn-compare">
                                    <button class="toCompare"
                                            data-prodid="<?php echo $p->getId()?>"
                                            type="button"
                                            data-title="<?php echo lang ('В список сравнений','newLevel'); ?>"
                                            data-firtitle="<?php echo lang ('В список сравнений','newLevel'); ?>"
                                            data-sectitle="<?php echo lang ('В списке сравнений','newLevel'); ?>"
                                            data-rel="tooltip">
                                        <span class="icon_compare"></span>
                                        <span class="text-el d_l"><?php echo lang ('В список сравнений','newLevel'); ?></span>
                                    </button>
                                </div>
                                <!-- end of compare buttons -->
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endif; ?>
            <!-- End. Collect information about Variants, for future processing -->
            <?php if(!$widget && !$compare && !$defaultItem): ?>
                <div class="p_r frame-without-top">
                    <div class="no-vis-table">
                        <!--Start. Description-->
                        <?php if(trim($p->getShortDescription()) != ''): ?>
                            <div class="short-desc">
                                <?php echo strip_tags($p->getShortDescription())?>
                            </div>
                        <?php elseif ($props = ShopCore::app()->SPropertiesRenderer->renderPropertiesInlineNew($p->getId(), 1)): ?>
                            <div class="short-desc">
                                <p><?php echo $props?></p>
                            </div>
                        <?php endif; ?>
                        <!-- End. Description-->
                    </div>
                </div>
            <?php endif; ?>
        </div>
        <!--        Start. Remove buttons if compare or wishlist-->
        <?php if($compare && !$widget): ?>
            <button type="button" class="icon_times deleteFromCompare" onclick="Shop.CompareList.rm(<?php echo  $p->getId()?>, this)"></button>
        <?php endif; ?>
        <!--        End. Remove buttons if compare or wishlist-->

        <div class="decor-element"></div>
    </li>
<?php }} ?><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1459371702; //templates/newLevel/new_level/one_product_item.tpl ?>
<?php

/**
 * Skeleton subclass for representing a row from the 'shop_products' table.
 *
 *
 *
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package    propel.generator.Shop
 */
class SProducts extends BaseSProducts {

    public static $obj_discount;
    public $relatedProductsCache = null;
    public $variantsCache = null;
    public $appliedDiscounts;
    public $DFA = true;
    public $entityName = 'product';

    public function attributeLabels() {
        return array(
            'Name' => ShopCore::t('Название'),
            'Price' => ShopCore::t('Цена'),
            'Number' => ShopCore::t('Артикул'),
            'ShortDescription' => ShopCore::t('Краткое Описание'),
            'FullDescription' => ShopCore::t('Полное Описание'),
            'MetaTitle' => ShopCore::t('Meta Title'),
            'MetaDescription' => ShopCore::t('Meta Description'),
            'MetaKeywords' => ShopCore::t('Meta Keywords'),
            'Categories' => ShopCore::t('Дополнительные Категории'),
            'CategoryId' => ShopCore::t('Категория'),
            'Active' => ShopCore::t('Активен'),
            'Hit' => ShopCore::t('Хит'),
            'Hot' => ShopCore::t('Новинка'),
            'Action' => ShopCore::t('Акция'),
            'Brand' => ShopCore::t('Бренд'),
            'Stock' => ShopCore::t('Количество'),
            'RelatedProducts' => ShopCore::t('Связанные товары'),
            'tpl' => ShopCore::t('Шаблон продукта'),
        );
    }

    public function rules() {
        return array(
            array(
                'field' => 'Name',
                'label' => 'Название товара',
                'rules' => 'required',
            ),
            array(
                'field' => 'variants[PriceInMain][]',
                'label' => $this->getLabel('Price'),
                'rules' => 'trim|required|numeric',
            ),
            array(
                'field' => 'CategoryId',
                'label' => $this->getLabel('CategoryId'),
                'rules' => 'required|integer',
            ),
        );
    }

    /**
     * After Save model
     *
     * @return boolean|string
     */
    public function postSave() {
        $this->hasCustomData = false;
        $this->customFields = false;
        if ($this->hasCustomData === false)
            $this->collectCustomData($this->entityName, $this->getId());
        $this->saveCustomData();

        //saving custom data
        //TODO: need recode to use $this->saveCustomData()
        //       ShopCore::app()->CustomFieldsDataQuery->saveCustomFieldsData($this->getId(), $this->entityName);
//        if (count($_POST['custom_field']))
//            $this->saveCustomData();

        parent::postSave();
    }

    public function preDelete() {

        // Delete product variants
        $productVariants = SProductVariantsQuery::create()
                ->filterByProductId($this->getId())
                ->find();

        if ($productVariants->count() > 0) {
            foreach ($productVariants as $v)
                $v->delete();
        }

        //if

        if (file_exists(ShopCore::$imagesUploadPath . $this->getMainImage()))
            @unlink(ShopCore::$imagesUploadPath . $this->getMainImage());

        if (file_exists(ShopCore::$imagesUploadPath . $this->getSmallImage()))
            @unlink(ShopCore::$imagesUploadPath . $this->getSmallImage());

        if (sizeof($this->getSProductImagess()) > 0) {
            foreach ($this->getSProductImagess() as $image)
                $image->delete();
        }

        return true;
    }

    /**
     * Get first product variant.
     *
     * @return array|PropelCollection|SProductVariants
     */
    public function getFirstVariant($type = null) {
        $variants = $this->getProductVariants(null, null, $type);

        if (sizeof($variants) > 0) {
            return $variants[0];
        } else {
            return $variants;
        }
    }

    /**
     * Load product variants and apply discounts
     *
     * @param  $criteria
     * @param PropelPDO $con
     * @return array|PropelCollection
     */
    public function getProductVariants($criteria = null, PropelPDO $con = null, $type = null, $locale = null) {
        $locale = $locale == null ? $locale = MY_Controller::getCurrentLocale() : $locale;


        $variants = SProductVariantsQuery::create()->joinWithI18n($locale, Criteria::LEFT_JOIN)->filterByProductId($this->getId());


        if ($type === null) {
            $variants = $variants->withColumn('IF(shop_product_variants.stock > 0, 1, 0)', 'allstock');
            $variants = $variants->orderBy('allstock', Criteria::DESC);
        }
        $variants = $variants->orderByPosition(Criteria::ASC)->find();
        if (!$this->with_discount) {
            foreach ($variants as $v) {

                $arr_for_discount = array(
                    'product_id' => $this->getId(),
                    'category_id' => $this->getCategoryId(),
                    'brand_id' => $this->getBrandId(),
                    'vid' => $v->getId(),
                    'id' => $this->getid()
                );
                \CMSFactory\assetManager::create()->discount = 0;
                if (!self::$obj_discount) {
                    $ci = &get_instance();
                    if (count($ci->db->where('name', 'mod_discount')->get('components')->result_array()) != 0) {
                        self::$obj_discount = new \mod_discount\discount_product;
                        self::$obj_discount->get_product_discount_event($arr_for_discount);
                    }
                } else {
                    self::$obj_discount->get_product_discount_event($arr_for_discount);
                }

                if ($discount = \CMSFactory\assetManager::create()->discount) {

                    $price = $discount['price'];
                    $discount_val = $discount['discount_value'];
                    $dif_price = (float) $price - (float) $discount_val;
                    if ($dif_price < 0)
                        $price_new = 1;
                    else
                        $price_new = $dif_price;
                    $v->setVirtualColumn('origPrice', $price);
                    $v->setVirtualColumn('numDiscount', $discount_val);
                    $v->setVirtualColumn('discount', $discount);
                    $v->setVirtualColumn('discounttpl', \CMSFactory\assetManager::create()->discount_tpl);
                    $v->setPrice($price_new);
                    $this->appliedDiscounts = true;
                }
            }
            $this->with_discount = true;
        }



        return $variants;
    }

    /**
     * Get first product variant for kit.
     *
     * @return array|PropelCollection|SProductVariants
     */
    public function getKitFirstVariant(ShopKitProduct $shopKitProduct) {
        $variants = $this->getKitProductVariants($shopKitProduct);

        if (sizeof($variants) > 0) {
            return $variants[0];
        } else {
            return $variants;
        }
    }

    public function getKitProductVariants(ShopKitProduct $shopKitProduct, $criteria = null, PropelPDO $con = null) {
        $criteria = SProductVariantsQuery::create(null, $criteria)
                ->joinWithI18n(MY_Controller::getCurrentLocale(), Criteria::LEFT_JOIN);
        $variants = parent::getProductVariants($criteria, $con);

        if ($variants->count() > 0) {
            foreach ($variants as $variant) {
                $price = $variant->getPrice() - ($variant->getPrice() / 100 * $shopKitProduct->getDiscount());
                $variant->setVirtualColumn('economy', $variant->getPrice() / 100 * $shopKitProduct->getDiscount());
                $variant->setPrice($price);
            }
        }

        return $variants;
    }

    public function getRating() {
        $rating = SProductsRatingQuery::create()->findPk($this->getId());
        if ($rating !== null)
            $rating = round($rating->getRating() / $rating->getVotes());
        else
            $rating = 0;

        return $rating;
    }

    public function getVotes() {
        $rating = SProductsRatingQuery::create()->findPk($this->getId());
        if ($rating !== null)
            $rating = $rating->getVotes();
        else
            $rating = 0;
        return $rating;
    }

    /**
     * Check if product has applied discounts
     *
     * @return bool
     */
    public function hasDiscounts() {
        if ($this->appliedDiscounts)
            return true;
        else
            return false;
    }

    public function countProperties() {
        $cr = new Criteria();
        $cr->add(SPropertiesPeer::ACTIVE, TRUE, Criteria::EQUAL);
        $cr->add(SPropertiesPeer::SHOW_ON_SITE, TRUE, Criteria::EQUAL);
        return $this->getSProductPropertiesDatasJoinSProperties($cr)->count();
    }

//    public function totalComments() {
//        $ci = & get_instance();
//
//        $ci->db->select('*');
//        $ci->db->where('item_id = ', $this->getId());
//        $ci->db->where('module = ', 'shop');
//        $query = $ci->db->get('comments');
//
//        if ($query->num_rows() > 0) {
//            return $query->num_rows();
//        }
//
//        return 0;
//    }

    /**
     * @param $value
     * @return SProducts
     */
    public function setRelatedProducts($value) {
        if (is_array($value))
            $value = implode(',', $value);

        return parent::setRelatedProducts($value);
    }

    /**
     * Get related products list.
     *
     * @param int $limit
     * @return array|bool|mixed|PropelObjectCollection
     */
    public function getRelatedProductsModels($limit = 5) {
        if ($this->relatedProductsCache !== null)
            return $this->relatedProductsCache;

        $ids = explode(',', $this->getRelatedProducts());
        $ids = array_map('trim', $ids);

        if (is_array($ids) && count($ids) > 0) {
            $models = SProductsQuery::create()
                    ->joinWithI18n(MY_Controller::getCurrentLocale())
                    ->orderByCreated(Criteria::DESC)
                    ->findPks($ids);

            if (sizeof($models) > 0) {
                $this->relatedProductsCache = $models;
                return $models;
            }
        }

        $this->relatedProductsCache = false;
        return false;
    }

    /**
     * Get sample hits list from the same category as current product.
     *
     * @param int $limit
     * @return array|bool|mixed|PropelObjectCollection
     */
    public function getSampleHitsModels($limit = 5) {
        $models = SProductsQuery::create()
                ->joinWithI18n(MY_Controller::getCurrentLocale())
                ->orderByCreated(Criteria::DESC)
                ->where('SProducts.Id NOT IN ?', $this->getId())
                ->filterByHit(1)
                ->filterByCategoryId($this->getCategoryId())
                ->limit($limit)
                ->find();

        if (sizeof($models) > 0) {
            return $models;
        }

        return false;
    }

    /**
     * Get sample new products list from the same category as current product.
     *
     * @param int $limit
     * @return array|bool|mixed|PropelObjectCollection
     */
    public function getSampleNewestModels($limit = 6) {
        $models = SProductsQuery::create()
                ->joinWithI18n(MY_Controller::getCurrentLocale())
                ->orderByCreated(Criteria::DESC)
                ->where('SProducts.Id NOT IN ?', $this->getId())
                ->filterByCategoryId($this->getCategoryId())
                ->filterByHot(1)
                ->limit($limit)
                ->find();

        if (sizeof($models) > 0) {
            return $models;
        }

        return false;
    }

    /**
     * Get products list from the same category as current product.
     *
     * @param int $limit
     * @return array|bool|mixed|PropelObjectCollection
     */
    public function getSameBrandCategoryProductsModels($limit = 6) {
        $models = SProductsQuery::create()
                ->joinWithI18n(MY_Controller::getCurrentLocale())
                ->orderByCreated(Criteria::DESC)
                ->where('SProducts.Id NOT IN ?', $this->getId())
                ->filterByCategoryId($this->getCategoryId())
                ->filterByBrandId($this->getBrandId())
                ->limit($limit)
                ->find();

        if (sizeof($models) > 0) {
            return $models;
        }

        return false;
    }

    /**
     * Get products list from the same category with a similar price as current product.
     *
     * @param int $limit
     * @return array|bool|mixed|PropelObjectCollection
     */
    public function getSimilarPriceProductsModels($limit = 6, $price_percent = 20) {
        if (($price_percent <= 100) and ($price_percent >= 0)) {
            $price_percent *= 0.01;
        } else {
            $price_percent = 0.2;
        }

        $low_similar = $this->firstVariant->getPrice() - $this->firstVariant->getPrice() * $price_percent;
        $high_similar = $this->firstVariant->getPrice() + $this->firstVariant->getPrice() * $price_percent;

        $models = SProductsQuery::create()
                ->joinWithI18n(MY_Controller::getCurrentLocale())
                ->leftJoin('ProductVariant')
                ->distinct('ProductId')
                ->filterByCategoryId($this->getCategoryId())
                ->where('SProducts.Id NOT IN ?', $this->getId())
                ->where('ProductVariant.Price >= ?', $low_similar)
                ->where('ProductVariant.Price <= ?', $high_similar)
                ->orderByCreated(Criteria::DESC)
                ->limit($limit)
                ->find();

        if (sizeof($models) > 0) {
            return $models;
        }

        return false;
    }

    /**
     * Populates the translatable object using an array.
     *
     * @param      array  $arr     An array to populate the object from.
     * @param      string $keyType The type of keys the array uses.
     * @return     void
     */
    public function fromArray($arr, $keyType = BasePeer::TYPE_PHPNAME) {
        $peerName = get_class($this) . I18nPeer;
        $keys = $peerName::getFieldNames($keyType);

        if (array_key_exists('Locale', $arr)) {
            $this->setLocale($arr['Locale']);
            unset($arr['Locale']);
        } else {
            $defaultLanguage = getDefaultLanguage();
            $this->setLocale($defaultLanguage['identif']);
        }

        foreach ($keys as $key)
            if (array_key_exists($key, $arr)) {
                $methodName = set . $key;
                $this->$methodName($arr[$key]);
            }

        parent::fromArray($arr, $keyType);
    }

    public function getTranslatableFieldNames($keyType = BasePeer::TYPE_PHPNAME) {
        $peerName = get_class($this) . I18nPeer;
        $keys = $peerName::getFieldNames($keyType);
        $keys = array_flip($keys);

        if (array_key_exists('Locale', $keys)) {
            unset($keys['Locale']);
        }

        if (array_key_exists('Id', $keys)) {
            unset($keys['Id']);
        }

        return array_flip($keys);
    }

    public function toArray($keyType = BasePeer::TYPE_PHPNAME, $includeLazyLoadColumns = true, $alreadyDumpedObjects = array(), $includeForeignObjects = false) {
        $result = parent::toArray($keyType, $includeLazyLoadColumns, $alreadyDumpedObjects, $includeForeignObjects);

        $translatableFieldNames = $this->getTranslatableFieldNames();
        foreach ($translatableFieldNames as $fieldName) {
            $methodName = 'get' . $fieldName;
            $result[$fieldName] = $this->$methodName();
        }

        return $result;
    }

    public function translatingRules() {
        $rules = $this->rules();
        $translatingRules = array();
        $translatableFieldNames = $this->getTranslatableFieldNames();

        foreach ($rules as $rule) {
            if (in_array($rule['field'], $translatableFieldNames)) {
                $translatingRules[$rule['field']] = $rule['rules'];
            }
        }

        return $translatingRules;
    }

    /**
     * get kits where this products models is a main product
     *
     * @param	string $modelAlias The alias of a model in the query
     * @param	Criteria $criteria Optional Criteria to build the query from
     * @return	PropelCollection of kits
     */
    public function getKits($criteria = null) {
        $criteria = $criteria === null ? ShopKitQuery::create()->filterByActive(TRUE)->orderByPosition(Criteria::ASC) : $criteria;

        return $this->getShopKits($criteria);
        ;
    }

    public function getShopKits($criteria = null, PropelPDO $con = null) {

        if (null === $this->collShopKits || null !== $criteria) {
            if ($this->isNew() && null === $this->collShopKits) {
                // return empty collection
                $this->initShopKits();
            } else {
                $collShopKits = ShopKitQuery::create(null, $criteria)
                        ->filterBySProducts($this)
                        ->filterByActive(TRUE)
                        ->orderByPosition(Criteria::ASC)
                        ->find($con);
                if (null !== $criteria) {
                    return $collShopKits;
                }
                //$this->collShopKits = $collShopKits;
            }
        }


        foreach ($collShopKits as $kit) {
            foreach ($kit->getShopKitProducts() as $product) {
                if ($product->getSProducts()->getFirstVariant()->getStock()) {

                    $this->collShopKits = $collShopKits;
                } else {
                    return false;
                }
            }
        }

        return $this->collShopKits;
    }

    /**
     * Check show kitss for logged user or not
     * @param boolean $logged  True for logged and false for not
     * @return ShopKits
     */
    public function getShopKitsLoggedUsersCheck($logged = FALSE) {
//        $c = new Criteria();
//        $c->add(ShopKitPeer::ONLY_FOR_LOGGED, 1);
        if ($logged == FALSE) {
            $c = new Criteria();
            $c->add(ShopKitPeer::ONLY_FOR_LOGGED, !$logged, Criteria::NOT_EQUAL);
            return $this->getShopKits($c);
        }
        return $this->getShopKits();
    }

    /**
     * Get product properties
     * @param string $type Type of property (main, showInCompare, showInFilter, showOnProductPage)
     * @return array
     */
    public function getProductProperties($type = null) {

        /** Get product properties for product */
        $properties = SPropertiesQuery::create()
                ->filterByActive(1);

        /** Is main property */
        if ($type == 'main')
            $properties = $properties->filterByMainProperty(1);

        /** Show on product page */
        if ($type == 'showOnProductPage')
            $properties = $properties->filterByShowOnSite(1);

        /** Show in compare */
        if ($type == 'showInCompare')
            $properties = $properties->filterByShowInCompare(1);

        /** Show in filter  */
        if ($type == 'showInFilter')
            $properties = $properties->filterByShowInFilter(1);

        $properties = $properties->joinSProductPropertiesData()
                ->joinWithI18n(MY_Controller::getCurrentLocale())
                ->where('SProductPropertiesData.ProductId = ?', $this->getId())
                ->select(array('Id', 'ShowInCompare', 'ShowInFilter', 'ShowOnSite', 'ShowInFilter', 'MainProperty', 'SPropertiesI18n.Name', 'SPropertiesI18n.Description'))
                ->withColumn('SProductPropertiesData.Value', 'Value')
                ->distinct()
                ->orderByPosition()
                ->find()
                ->toArray();


        /** Prepare first property */
        if ($properties != null) {

            $propertiesRes[$properties[0]['SPropertiesI18n.Name']] = $properties[0];
            $propertiesRes[$properties[0]['SPropertiesI18n.Name']] = array();
            unset($propertiesRes[$properties[0]['SPropertiesI18n.Name']]['SPropertiesI18n.Name']);
        }

        /** Prepare result array for properties */
        foreach ($properties as $key => $prop) {
            if (array_key_exists($prop['SPropertiesI18n.Name'], $propertiesRes)) {
                $propertiesRes[$prop['SPropertiesI18n.Name']][] = $prop['Value'];
            } else {
                $propertiesRes[$prop['SPropertiesI18n.Name']] = $prop;
                $propertiesRes[$prop['SPropertiesI18n.Name']] = array($prop['Value']);
            }
        }

        return $propertiesRes;
    }
    
    /**
     * Get product additional images
     * @param string $orderByMethod  Possible values 'asc' and 'desc'.
     * @return Sproducts
     */
    public function getSProductAdditionalImages($orderByMethod = 'asc') {
        $c = new Criteria();
        if (strtolower($orderByMethod) == 'desc') {
            $c->addDescendingOrderByColumn(SProductImagesPeer::POSITION);
        } else {
            $c->addAscendingOrderByColumn(SProductImagesPeer::POSITION);
        }

        return parent::getSProductImagess($c);
    }

}

// SProducts

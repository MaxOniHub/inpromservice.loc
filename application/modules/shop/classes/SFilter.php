<?php

/**
 * @property CI_DB_active_record $db
 */
class SFilter {

    private $ci;
    private $db;
    private $locale;
    private $model = null;
    private $sort = false;

    public function __construct() {
        
        $this->ci = &get_instance();
        $this->db = &$this->ci->db;
        $this->locale = MY_Controller::getCurrentLocale();

        if ($_GET['lp'])
            $this->get_lp = (int) $_GET['lp'] / ShopCore::app()->SCurrencyHelper->getRateByfilter() - 1;
        if ($_GET['rp'])
            $this->get_rp = (int) $_GET['rp'] / ShopCore::app()->SCurrencyHelper->getRateByfilter() + 1;
    }

    /**
     * get product bt get prop request
     * @param optional (int) key unset
     * @return --
     */
    private function getProductIdFromPropGet($keyUnsey = null) {

        if (is_array(ShopCore::$_GET['p'])) {
            $propertiesInGet = ShopCore::$_GET['p'];
            if (null != $keyUnsey)
                unset($propertiesInGet[$keyUnsey]);
            $array_products = array();
            foreach ($propertiesInGet as $pkey => $pvalue) {
                $arr_prod = array();
                foreach ($pvalue as $pk => $pv) {
                    $this->db->cache_on();
                    $this->db->where('shop_product_properties_data.property_id', (int) $pkey);
                    $this->db->where('shop_product_properties_data.value', $pv);
                    $this->db->or_where('shop_product_properties_data.value', ShopCore::encode($pv));
                    
                    foreach ($this->db->select('distinct product_id')->get('shop_product_properties_data')->result_array() as $prod)
                        $arr_prod[] = $prod['product_id'];
                    $this->db->cache_off();
                }
                $array_products[] = $arr_prod;
            }
        }

        return $array_products;
    }

    /**
     * filter by price object db 
     * @param --
     * @return --
     */
    private function filterProductFromPriceGet() {

        if (isset($this->get_lp) || isset($this->get_rp)) {
            if (isset($this->get_lp) && $this->get_lp > 0)
                $this->db->where('shop_product_variants.price >= ', (int) ($this->get_lp));

            if (isset($this->get_rp) && $this->get_rp > 0)
                $this->db->where('shop_product_variants.price <= ', (int) ($this->get_rp));
        }
    }

    /**
     * returns array of stdClass brands objects
     * @param SCategory $categoryModel
     * @return type
     */
    public function getBrands() {
        if (!$this->model) {
            return;
        } else {
            if (get_class($this->model)) {
                $this->db->cache_on();
                $brands = $this->db->select('distinct shop_brands_i18n.name, shop_brands.id')
                        ->from('shop_brands')
                        ->join('shop_products', 'shop_products.brand_id = shop_brands.id')
                        ->join('shop_product_categories', 'shop_product_categories.product_id=shop_products.id')
                        ->join('shop_brands_i18n', 'shop_brands_i18n.id=shop_brands.id')
                        ->where('shop_products.active', 1)
                        ->where('shop_product_categories.category_id', $this->model->getId())
                        ->where('shop_brands_i18n.locale', $this->locale)
                        ->get();
                $this->db->cache_off();
                if ($brands) {
                    $brands = $brands->result();
                    $brands = $this->getProductsInBrandCount($brands);
                } else {
                    $brands = null;
                }

                return $brands;
            } else {
                return array();
            }
        }
    }

    /**
     * count products in brands
     * @param type $brands
     * @return type
     */
    private function getProductsInBrandCount($brands = array()) {
        if (is_array($brands)) {

            $array_products = $this->getProductIdFromPropGet();
            foreach ($brands as $key => $brand) {
                $this->db->cache_on();
                $this->db->select('DISTINCT shop_products.id')
                        ->from('shop_products')
                        ->join('shop_product_variants', 'shop_product_variants.product_id=shop_products.id')
                        ->join('shop_product_categories', 'shop_product_categories.product_id = shop_products.id')
                        ->where('shop_products.brand_id', $brand->id)
                        ->where('shop_products.active', 1)
                        ->where('shop_product_categories.category_id', $this->model->getId())
                        ->group_by('shop_product_variants.product_id');

                $this->filterProductFromPriceGet();

                if (count($array_products))
                    foreach ($array_products as $product)
                        $this->db->where_in('shop_product_categories.product_id', $product);

                $brands[$key]->countProducts = $this->db->get();

                $this->db->cache_off();

                if ($brands[$key]->countProducts) {
                    $brands[$key]->countProducts = $brands[$key]->countProducts
                            ->num_rows();
                }
            }
        }
        return $brands;
    }

    /**
     * returns array of stdClass properties objects
     * @param SCategory $categoryModel
     * @return type
     */
    public function getProperties() {

        if (!$this->model) {
            return;
        } else {
            $this->db->cache_on();
            // всі властивості даної категорії
            if (get_class($this->model) == 'SCategory') {
                $this->db->select('DISTINCT (shop_product_properties_categories.property_id), shop_product_properties_i18n.name')
                        ->from('shop_product_properties_categories')
                        ->join('shop_product_properties', 'shop_product_properties_categories.property_id=shop_product_properties.id')
                        ->join('shop_product_properties_i18n', 'shop_product_properties_categories.property_id=shop_product_properties_i18n.id')
                        ->where('shop_product_properties_i18n.locale', $this->locale)
                        ->where('shop_product_properties.show_in_filter', 1)
                        ->where('shop_product_properties_categories.category_id', $this->model->getId());
            }

            if (get_class($this->model) == 'SBrands') {
                $this->db->select('DISTINCT (shop_product_properties.id), shop_product_properties_i18n.name')
                        ->from('shop_product_properties_data')
                        ->join('shop_products', 'shop_products.id=shop_product_properties_data.product_id')
                        ->join('shop_product_properties', 'shop_product_properties.id=shop_product_properties_data.property_id')
                        ->join('shop_product_properties_i18n', 'shop_product_properties.id=shop_product_properties_i18n.id')
                        ->where('shop_products.brand_id', $this->model->getId())
                        ->where('shop_product_properties_i18n.locale', $this->locale)
                        ->where('shop_product_properties.show_in_filter', 1);
            }

            $properties = $this->db
                    ->order_by('shop_product_properties.position')
                    ->get();

            $this->db->cache_off();

            if ($properties) {
                $properties = $properties->result();
                if (is_array($properties)) {
                    foreach ($properties as $key => $item) {
                        // значення властивостей 
                        $this->db->cache_on();
                        $this->db
                                ->select('DISTINCT (`value`), `shop_product_properties_data`.`id`')
                                ->from('shop_product_properties_data')
                                ->join('shop_product_categories', 'shop_product_categories.product_id=shop_product_properties_data.product_id')
                                ->where('shop_product_properties_data.property_id', $item->property_id)
                                ->where('shop_product_properties_data.locale', $this->locale);

                        if (get_class($this->model) == 'SCategory')
                            $this->db->where('shop_product_categories.category_id', $this->model->getId());

                        if (get_class($this->model) == 'SBrands')
                            $this->db
                                    ->join('shop_products', 'shop_products.id=shop_product_properties_data.product_id')
                                    ->where('shop_products.brand_id', $this->model->getId());

                        $properties[$key]->possibleValues = $this->db
                                ->group_by('shop_product_properties_data.value')
                                ->get();

                        $this->db->cache_off();

                        if ($properties[$key]->possibleValues)
                            $properties[$key]->possibleValues = $properties[$key]->possibleValues->result_array();
                        else
                            throw new Exception;
                    }
                }
            } else {
                throw new Exception("Wrong query");
            }

            $properties = $this->getProductsInProperties($properties);
            if ($this->sort)
                $properties = $this->setPropValuePos($properties);
            return $properties;
        }
    }

    /**
     * for sorting
     */
    private function setPropValuePos($properties) {
        $this->db->cache_on();

        $data = $this->db->select('*, shop_product_properties.id as pid')
                ->from('shop_product_properties')
                ->join('shop_product_properties_i18n', 'shop_product_properties_i18n.id = shop_product_properties.id')
                ->where('shop_product_properties_i18n.locale', $this->locale)
                ->get();

        $prop_for_sync = $data->result_array();
        $this->db->cache_off();

        foreach ($properties as $key => $prop) {
            foreach ($prop_for_sync as $p_for_sync) {
                if ($p_for_sync['id'] == $prop->property_id) {
                    $data_origin = $prop->possibleValues;
                    $data_sync = unserialize($p_for_sync['data']);
                    $properties[$key]->possibleValues = $this->syncDataPos($data_origin, $data_sync);
                }
            }
        }

        return $properties;
    }

    /**
     * for sorting
     */
    private function syncDataPos($data_origin, $data_sync) {

        $arr_aux = array();
        foreach ($data_sync as $d_s) {
            foreach ($data_origin as $d_o) {
                if ($d_s == $d_o['value'])
                    $arr_aux[] = $d_o;
            }
        }
        return $arr_aux;
    }

    /**
     * count propucts in each property
     * @param type $properties
     * @return type
     */
    private function getProductsInProperties($properties = array()) {

        foreach ($properties as $key => $item) {
            $properties[$key]->productsCount = 0;

            $array_products = $this->getProductIdFromPropGet($item->property_id);

            foreach ($properties[$key]->possibleValues as $k => $v) {
                $this->db->cache_on();
                $this->db
                        ->select('distinct shop_product_properties_data.product_id')
                        ->from('shop_product_properties_data')
                        ->join('shop_product_categories', 'shop_product_categories.product_id = shop_product_properties_data.product_id')
                        ->join('shop_products', 'shop_product_categories.product_id = shop_products.id')
                        ->join('shop_brands', 'shop_products.brand_id = shop_brands.id', 'left')
                        ->join('shop_product_variants', 'shop_product_variants.product_id = shop_products.id')
                        ->where('shop_product_properties_data.locale', $this->locale);

                if (get_class($this->model) == 'SCategory')
                    $this->db->where('shop_product_categories.category_id', $this->model->getId());

                if (get_class($this->model) == 'SBrands')
                    $this->db->where('shop_products.brand_id', $this->model->getId());


                $this->filterProductFromPriceGet();

                if (isset(ShopCore::$_GET['brand']) && is_array(ShopCore::$_GET['brand'])) {
                    $brands_ids = array();
                    foreach (ShopCore::$_GET['brand'] as $brandId)
                        $brands_ids[] = $brandId;
                    $this->db->where_in('shop_products.brand_id', $brands_ids);
                }

                if (count($array_products))
                    foreach ($array_products as $product)
                        $this->db->where_in('shop_product_properties_data.product_id', $product);

                $this->db->where('shop_product_properties_data.value', $v['value']);
                $this->db->where('shop_product_properties_data.property_id', (int) $item->property_id);
                $this->db->where('shop_products.active',1);
                $productSelect = $this->db->get();
                
                $this->db->cache_off();

                if ($productSelect)
                    $properties[$key]->possibleValues[$k]['count'] = $productSelect->num_rows();

                $properties[$key]->productsCount += $properties[$key]->possibleValues[$k]['count'];              
            }
        }
        return $properties;
    }

    /**
     * returns array with min and max price
     */
    public function getPricerange() {
        if (!$this->model) {
            return;
        } else {
            $this->db->cache_on();

            $this->db->select('MIN(shop_product_variants.price) AS minCost, MAX(shop_product_variants.price) AS maxCost')
                    ->from('shop_product_variants')
                    ->join('shop_products', 'shop_product_variants.product_id=shop_products.id')
                    ->join('shop_product_categories', 'shop_product_categories.product_id = shop_products.id');

            if (get_class($this->model) == 'SBrands')
                $priceRange = $this->db->where('shop_products.brand_id', $this->model->getId())
                        ->get();

            if (get_class($this->model) == 'SCategory')
                $priceRange = $this->db->where('shop_product_categories.category_id', $this->model->getId())
                        ->get();
            
            $this->db->cache_off();

            if ($priceRange) {
                $priceRange = $priceRange->result_array();
                $priceRange = $priceRange[0];
                $priceRange['minCost'] = (int) ShopCore::app()->SCurrencyHelper->convert($priceRange['minCost']);
                $priceRange['maxCost'] = (int) ShopCore::app()->SCurrencyHelper->convert($priceRange['maxCost']);
            } else {
                throw new Exception;
            }
            
            return $priceRange;
        }
    }

    /**
     *
     * @param SProductsQuery $products
     * @return type
     * for propel product query object filtration by price
     *
     */
    public function makePriceFilter(SProductsQuery $products) {
        if (isset($this->get_lp))
            $products = $products->where('FLOOR(ProductVariant.Price) >= ?', (int) $this->get_lp);
        if (isset($this->get_rp))
            $products = $products->where('FLOOR(ProductVariant.Price) <= ?', (int) $this->get_rp);

        return $products;
    }

    /**
     * for propel product query object filtration by brands
     * @param SProductsQuery $products
     * @return type
     */
    public function makeBrandsFilter(SProductsQuery $products) {
        if (isset(ShopCore::$_GET['brand']) && !empty(ShopCore::$_GET['brand'])) {
            $products = $products->filterByBrandId(ShopCore::$_GET['brand']);
        }
        return $products;
    }

    /**
     * for propel product query object filtration by properties
     * @param SProductsQuery $products
     * @return type
     */
    public function makePropertiesFilter(SProductsQuery $products) {

        $arr_product = $this->getProductIdFromPropGet();
        if (count($arr_product) > 0)
            foreach ($arr_product as $p)
                $products = $products->filterById($p);

        return $products;
    }
    
    /**
     * for propel product query object filtration by category
     * @param SProductsQuery $products
     * @return type
     */
    public function makeCategoriesFilter(SProductsQuery $products) {
        if (isset(ShopCore::$_GET['category']) && !empty(ShopCore::$_GET['category'])) {
            $products = $products->filterByCategoryId(ShopCore::$_GET['category']);
        }
        return $products;
    }

    /**
     * to prevent setting any other variables in get array
     * @param ---
     */
    public function filterGet() {
        $allowedKeys = $this->ci->config->load('filter');

        foreach (array_keys(ShopCore::$_GET) as $key) {
            if (!in_array($key, $allowedKeys))
                unset(ShopCore::$_GET[$key]);
        }
    }

    public function init($model) {
        if (!$model)
            return false;
        else {
            if (in_array(get_class($model), array('SCategory', 'SBrands'))) {
                $this->model = $model;
            }
        }
    }
    /**
     * returns array of stdClass category objects
     * @param --
     * @return arry
     */
    public function getCategories() {
        if (!$this->model)
            return;
        else {
            if (get_class($this->model) == 'SBrands') {
                $this->db->cache_on();

                $categories = $this->db->select('shop_products.category_id, shop_category_i18n.name')
                        ->from('shop_products')
                        ->join('shop_category', 'shop_category.id=shop_products.category_id')
                        ->join('shop_category_i18n', 'shop_category_i18n.id=shop_category.id')
                        ->where('shop_products.brand_id', $this->model->getId())
                        ->where('shop_category_i18n.locale', $this->locale)
                        ->group_by('shop_products.category_id')
                        ->get();
                
                $this->db->cache_off();

                if ($categories) {
                    $categories = $categories->result();
                    $categories = $this->countCategories($categories);
                    return $categories;
                } else {
                    throw new Exception;
                }
                
            } else {
                return;
            }
        }
    }
    /**
     * count propucts in each category
     * @param type $categories
     * @return array
     */
    private function countCategories($categories) {
        if (!$categories)
            return;
        else {

            $arr_product = $this->getProductIdFromPropGet();

            foreach ($categories as $key => $value) {
                $this->db->cache_on();

                $this->db->select('discinct shop_products.id')
                        ->from('shop_products')
                        ->join('shop_product_variants', 'shop_product_variants.product_id=shop_products.id')
                        ->where('shop_products.category_id', $value->category_id)
                        ->where('shop_products.brand_id', $this->model->getId());
                
                $this->db->where('shop_products.active',1);

                $this->filterProductFromPriceGet();

                if (count($arr_product))
                    foreach ($arr_product as $product)
                        $this->db->where_in('shop_products.id', $product);

                $categories[$key]->countProducts = $this->db->get();


                $this->db->cache_off();
                if ($categories[$key]->countProducts) {
                    $categories[$key]->countProducts = $categories[$key]->countProducts->num_rows();
                }
            }
            return $categories;
        }
    }
}

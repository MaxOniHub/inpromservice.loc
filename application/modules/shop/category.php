<?php

(defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * @property SCategory $categoryModel
 */
class Category extends \Category\BaseCategory {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        if ($this->categoryModel->getFullPath() !== $this->categoryPath) {
            redirect('shop/category/' . $this->categoryModel->getFullPath(), 'location', '301');
        }

        /** Pagination */
        $this->load->library('Pagination');
        $this->pagination = new SPagination();

        $categoryPagination['base_url'] = shop_url('category/' . $this->categoryModel->getFullPath() . SProductsQuery::getFilterQueryString());
        $categoryPagination['total_rows'] = $this->data['totalProducts'];
        $categoryPagination['per_page'] = $this->perPage;
        $categoryPagination['last_link'] = ceil($this->data['totalProducts'] / $this->perPage);
        include_once "./templates/{$this->config->item('template')}/paginations.php";

        $this->pagination->initialize($categoryPagination);
        $this->data['pagination'] = $this->pagination->create_links();
        $this->data['page_number'] = $this->pagination->cur_page;

        /* Seo block (canonical) */
        if ((!empty(\ShopCore::$_GET) || strstr($_SERVER['REQUEST_URI'], '?')) && (!\ShopCore::$_GET['per_page'])) {
            $this->template->registerCanonical(site_url($this->uri->uri_string()));
        }

        /* Set meta tags */
        $this->core->set_meta_tags(
                $this->categoryModel->makePageTitle(), $this->categoryModel->makePageKeywords(), $this->categoryModel->makePageDesc(), $this->pagination->cur_page, $this->categoryModel->getShowSiteTitle()
        );

        /** Register event 'category:load' */
        \CMSFactory\Events::create()->registerEvent($this->data, 'category:load');
        \CMSFactory\Events::runFactory();

        /** Render template */
        $this->render($this->templateFile, $this->data);
        exit;
    }

}


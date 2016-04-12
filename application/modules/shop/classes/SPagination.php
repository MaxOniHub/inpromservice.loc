<?php

class SPagination extends CI_Pagination {

    var $base_url = ''; // The page we are linking to
    var $prefix = ''; // A custom prefix added to the path.
    var $suffix = ''; // A custom suffix added to the path.
    var $total_rows = 0; // Total number of items (database results)
    var $per_page = 10; // Max number of items you want shown per page
    var $num_links = 3; // Number of "digit" links to show before/after the currently viewed page
    var $cur_page = 0; // The current page being viewed
    var $use_page_numbers = FALSE; // Use page number for segment instead of offset
    var $first_link = '<span class="first-page">&laquo;</span>';
    var $next_link = '<span class="next-page">Следующая страница</span> <span class="text-el">→</span>';
    var $prev_link = '<span class="text-el">←</span> <span class="prev-page">Предыдущая страница</span>';
    var $last_link = '<span class="last-page">&raquo;</span>';
    var $uri_segment = 3;
    var $full_tag_open = '<div class="pagination"><ul class="f-s_0">';
    var $full_tag_close = '</ul></div>';
    var $first_tag_open = '<li>';
    var $first_tag_close = '<li class="clear-pag-item">...</li></li>';
    var $first_tag_close_no_dots = '</li>';
    var $last_tag_open = '<li class="clear-pag-item">...</li><li>';
    var $last_tag_open_no_dots = '<li>';
    var $last_tag_close = '</li>';
    var $first_url = ''; // Alternative URL for the First Page.
    var $cur_tag_open = '<li class="active"><span>';
    var $cur_tag_close = '</span></li>';
    var $next_tag_open = '<li class="next-page">';
    var $next_tag_close = '</li>';
    var $prev_tag_open = '<li class="prev-page">';
    var $prev_tag_close = '</li>';
    var $num_tag_open = '<li>';
    var $num_tag_close = '</li>';
    var $page_query_string = FALSE;
    var $query_string_segment = 'per_page';
    var $display_pages = TRUE;
    var $anchor_class = '';
    var $controls_tag_open = '';
    var $controls_tag_close = '';
    var $separate_controls = FALSE;

    public function __construct() {
        parent::__construct();
    }

    public function create_links() {
        // If our item count or per-page total is zero there is no need to continue.
        if ($this->total_rows == 0 OR $this->per_page == 0) {
            return '';
        }

        // Calculate the total number of pages
        $num_pages = ceil($this->total_rows / $this->per_page);

        // Is there only one page? Hm... nothing more to do here then.
        if ($num_pages == 1) {
            return '';
        }

        // Determine the current page number.
        $CI = & get_instance();

        if ($CI->config->item('enable_query_strings') === TRUE OR $this->page_query_string === TRUE) {
            if ($CI->input->get($this->query_string_segment) != 0) {
                $this->cur_page = $CI->input->get($this->query_string_segment);

                // Prep the current page - no funny business!
                $this->cur_page = (int) $this->cur_page;
            }
        } else {
            if ($CI->uri->segment($this->uri_segment) != 0) {
                $this->cur_page = $CI->uri->segment($this->uri_segment);

                // Prep the current page - no funny business!
                $this->cur_page = (int) $this->cur_page;
            }
        }

        $this->num_links = (int) $this->num_links;

        if ($this->num_links < 1) {
            show_error('Your number of links must be a positive number.');
        }

        if (!is_numeric($this->cur_page)) {
            $this->cur_page = 0;
        }

        // Is the page number beyond the result range?
        // If so we show the last page
        if ($this->cur_page > $this->total_rows)
            $this->cur_page = ($num_pages - 1) * $this->per_page;

        $uri_page_number = $this->cur_page;
        $this->cur_page = floor(($this->cur_page / $this->per_page) + 1);

        // Calculate the start and end numbers. These determine
        // which number to start and end the digit links with
        $start = (($this->cur_page - $this->num_links) > 0) ? $this->cur_page - ($this->num_links - 1) : 1;
        $end = (($this->cur_page + $this->num_links) < $num_pages) ? $this->cur_page + $this->num_links : $num_pages;

        // Is pagination being used over GET or POST?  If get, add a per_page query
        // string. If post, add a trailing slash to the base URL if needed
        if ($CI->config->item('enable_query_strings') === TRUE OR $this->page_query_string === TRUE)
            $this->base_url = rtrim($this->base_url) . '&amp;' . $this->query_string_segment . '=';
        else
            $this->base_url = rtrim($this->base_url, '/') . '/';

        $this->base_url = str_replace('?&amp;per_page=', '?per_page=', $this->base_url);

        // And here we go...
        $output = '';
        // Render the "First" link
        if ($this->cur_page > ($this->num_links + 1)) {
            $base_url = str_replace('?per_page=', '', $this->base_url);
            if ($this->cur_page == ($this->num_links + 2))
                $output .= $this->first_tag_open . '<a href="' . $base_url . '">' . $this->first_link . '</a>' . $this->first_tag_close_no_dots;
            else
                $output .= $this->first_tag_open . '<a href="' . $base_url . '">' . $this->first_link . '</a>' . $this->first_tag_close;
        }

        // Render the "previous" link
        if ($this->cur_page != 1) {
            $i = $uri_page_number - $this->per_page;
            if ($i == 0)
                $i = '';
            if ($i == 0)
                $prevurl = str_replace('?per_page=', '', $this->base_url);
            else
                $prevurl = $this->base_url . $i;
            $output .= $this->prev_tag_open . '<a href="' . $prevurl . '">' . $this->prev_link . '</a>' . $this->prev_tag_close;
        }

        // Write the digit links
        for ($loop = $start - 1; $loop <= $end; $loop++) {
            $base_url = $this->base_url;
            $i = ($loop * $this->per_page) - $this->per_page;

            if ($i >= 0) {
                if ($this->cur_page == $loop) {
                    $output .= $this->cur_tag_open . $loop . $this->cur_tag_close; // Current page
                } else {
                    $n = ($i == 0) ? '' : $i;
                    if ($n == 0)
                        $base_url = str_replace('?per_page=', '', $this->base_url);
                    $output .= $this->num_tag_open . '<a href="' . $base_url . $n . '">' . $loop . '</a>' . $this->num_tag_close;
                }
            }
        }

        // Render the "next" link
        if ($this->cur_page < $num_pages) {
            $output .= $this->next_tag_open . '<a href="' . $this->base_url . ($this->cur_page * $this->per_page) . '">' . $this->next_link . '</a>' . $this->next_tag_close;
        }

        // Render the "Last" link
        if (($this->cur_page + $this->num_links) < $num_pages) {
            $i = (($num_pages * $this->per_page) - $this->per_page);
            if (($this->cur_page + $this->num_links) + 1 == $num_pages)
                $output .= $this->last_tag_open_no_dots . '<a href="' . $this->base_url . $i . '">' . $this->last_link . '</a>' . $this->last_tag_close;
            else
                $output .= $this->last_tag_open . '<a href="' . $this->base_url . $i . '">' . $this->last_link . '</a>' . $this->last_tag_close;
        }

        // Kill double slashes.  Note: Sometimes we can end up with a double slash
        // in the penultimate link so we'll kill all double slashes.
        $output = preg_replace("#([^:])//+#", "\\1/", $output);

        // Add the wrapper HTML if exists
        $output = $this->full_tag_open . $output . $this->full_tag_close;

        return $output;
    }

}

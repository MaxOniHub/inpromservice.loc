<div class="frame-crumbs">
    {widget('path')}
</div>
<div class="frame-inside page-text">
    <div class="container">
        <div class="text-left">{load_menu('left_menu')}</div>
        <div class="text-right">
            <div class="text">
                <h1>{$page.title}</h1>
                <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=hVTXtBtu_2RRk0fiEB8x8jrIistAmwrg&width=700&height=450"></script>
                <br /><br />
                {$page.full_text}

                {$Comments = $CI->load->module('comments')->init($page)}
                {$c=$CI->load->module('comments/commentsapi')->renderAsArray($CI->uri->uri_string())}
                <div class="forComments">
                    {echo $c['comments']}
                </div>
            </div>
        </div>
    </div>
</div>
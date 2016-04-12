<!--Start. Top menu and authentication data block-->
<div class="menu-header">
    <div class="container">
        <nav class="left-header f_l">
            <ul class="nav">
                {load_menu('top_menu')}
            </ul>
        </nav>
        <div style="display:inline-block;">
              {widget('langswitcher')}
        </div>
        <div class="right-header f_r">
            {include_shop_tpl('auth_data')}
        </div>
    </div>
</div>
<!--End. Top menu and authentication data block-->
<div class="content-header">
    <div class="container">
        <!--        Logo-->
        {if  $CI->uri->uri_string() == ''}
            <span class="logo">
                <a href="{site_url('')}" class="logo"><img src="{echo siteinfo('siteinfo_logo_url')}" alt="logo.png"/> </a>
            </span>
        {else:}
            <a href="{site_url('')}" class="logo">
                <img src="{echo siteinfo('siteinfo_logo_url')}" alt="logo.png"/>
            </a>
        {/if}
        <div class="left-content-header">
            <div class="frame-search-cleaner">
                <!--                Start. Include cart data template-->
                <div id="bask_block" class="frame-cleaner">
                    {include_shop_tpl('cart_data')}
                </div>
                <!--                    End. Include cart data template-->
                <!--                Start. Show search form-->
                <div class="frame-search-form">
                    <div class="p_r">
                        <form name="search" method="get" action="{shop_url('search')}">
                            <span class="btn-search">
                                <button type="submit"><span class="icon_search"></span><span class="text-el">{lang('Найти','newLevel')}</span></button>
                            </span>
                            <div class="frame-search-input">
                                <input type="text" class="input-search" id="inputString" name="text" autocomplete="off" value="{if strpos($CI->uri->uri_string, 'search') !== false}{htmlspecialchars($_GET['text'])}{/if}"  placeholder="{lang('Поиск по сайту', 'newLevel')}"/>
                                <div id="suggestions" class="drop drop-search"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--                End. Show search form-->
            </div>
        </div>
    </div>
</div>
{if strpos($CI->uri->uri_string, 'search') !== false}
    {literal}
        <script>
            $(document).on('scriptDefer', function() {
                var input = $('#inputString');
                input.setCursorPosition(input.val().length);
            });
        </script>
    {/literal}
{/if}
<!--Start. Top menu and authentication data block-->
<div class="menu-header">
    <div class="container">
        <nav class="left-header f_l">
            <ul class="nav">
                <?php echo load_menu ('top_menu'); ?>
            </ul>
        </nav>
        <div style="display:inline-block;">
              <?php echo widget ('langswitcher'); ?>
        </div>
        <div class="right-header f_r">
            <?php $this->include_shop_tpl('auth_data', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
        </div>
    </div>
</div>
<!--End. Top menu and authentication data block-->
<div class="content-header">
    <div class="container">
        <!--        Logo-->
        <?php if($CI->uri->uri_string() == ''): ?>
            <span class="logo">
                <a href="<?php echo site_url (''); ?>" class="logo"><img src="<?php echo siteinfo('siteinfo_logo_url')?>" alt="logo.png"/> </a>
            </span>
        <?php else:?>
            <a href="<?php echo site_url (''); ?>" class="logo">
                <img src="<?php echo siteinfo('siteinfo_logo_url')?>" alt="logo.png"/>
            </a>
        <?php endif; ?>
        <div class="left-content-header">
            <div class="frame-search-cleaner">
                <!--                Start. Include cart data template-->
                <div id="bask_block" class="frame-cleaner">
                    <?php $this->include_shop_tpl('cart_data', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
                </div>
                <!--                    End. Include cart data template-->
                <!--                Start. Show search form-->
                <div class="frame-search-form">
                    <div class="p_r">
                        <form name="search" method="get" action="<?php echo shop_url ('search'); ?>">
                            <span class="btn-search">
                                <button type="submit"><span class="icon_search"></span><span class="text-el"><?php echo lang ('Найти','newLevel'); ?></span></button>
                            </span>
                            <div class="frame-search-input">
                                <input type="text" class="input-search" id="inputString" name="text" autocomplete="off" value="<?php if(strpos($CI->uri->uri_string, 'search') !== false): ?><?php echo htmlspecialchars ($_GET['text']); ?><?php endif; ?>"  placeholder="<?php echo lang ('Поиск по сайту', 'newLevel'); ?>"/>
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
<?php if(strpos($CI->uri->uri_string, 'search') !== false): ?>
        <script>
            $(document).on('scriptDefer', function() {
                var input = $('#inputString');
                input.setCursorPosition(input.val().length);
            });
        </script>
    
<?php endif; ?><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1459542331; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/header.tpl ?>
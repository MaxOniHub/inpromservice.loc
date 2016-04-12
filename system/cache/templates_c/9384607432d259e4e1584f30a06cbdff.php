<?php /*
/**
* @main.tpl - template for displaying shop main page
* Variables
*   $site_title: variable for insert site title
*   $canonical: variable for insert canonical
*   $site_description: variable for insert site description
*   $THEME: variable for template path
*   $site_keywords : variable for insert site keywords
*   $content : variable for insert content of page
*/?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title><?php if(isset($site_title)){ echo $site_title; } ?></title>
        <meta name="description" content="<?php if(isset($site_description)){ echo $site_description; } ?>" />
        <meta name="keywords" content="<?php if(isset($site_keywords)){ echo $site_keywords; } ?>" />
        <meta name = "format-detection" content = "telephone=no" />
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?><?php if(isset($colorScheme)){ echo $colorScheme; } ?>/colorscheme.css" media="all" />

        <?php if($CI->uri->segment(1) == MY_Controller::getCurrentLocale()): ?>
            <?php $lang = '/' . \MY_Controller::getCurrentLocale()?> 
        <?php else:?>
            <?php $lang = ''?> 
        <?php endif; ?>
        <script type="text/javascript">
            var locale = "<?php echo $lang?>";
        </script>

        <!--[if lte IE 9]><script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/lte_ie_8.css" /><![endif]-->
        <!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="<?php if(isset($THEME)){ echo $THEME; } ?>css/ie_7.css" />
            <script src="<?php if(isset($THEME)){ echo $THEME; } ?>js/localStorageJSON.js"></script>
        <![endif]-->

        <script type="text/javascript" src="<?php if(isset($THEME)){ echo $THEME; } ?>js/jquery-1.8.3.min.js"></script>
        <link rel="icon" href="<?php echo siteinfo('siteinfo_favicon_url')?>" type="image/x-icon" />
        <link rel="shortcut icon" href="<?php echo siteinfo('siteinfo_favicon_url')?>" type="image/x-icon" />
    </head>
    <body class="is<?php echo $agent[0]?> not-js"> 
        <?php $this->include_tpl('language/jsLangsDefine.tpl', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
        <?php $this->include_tpl('language/jsLangs.tpl', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
        <div class="main-body">
            <div class="fon-header">
                <header>
                    <?php $this->include_tpl('header', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
                </header>
                <div class="frame-menu-main horizontal-menu">
                    <?php \Category\RenderMenu::create()->setConfig(array('cache'=>TRUE))->load('category_menu')?>
                </div>
            </div>
            <div class="content">
                <?php if(isset($content)){ echo $content; } ?>
            </div>
            <div class="h-footer"></div>
        </div>
        <footer>
            <?php $this->include_tpl('footer', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
        </footer>
        <?php $this->include_tpl('user_toolbar', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>

        <!-- scripts -->
        <?php $this->include_tpl('config.js', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
            <script>
                function downloadJSAtOnload() {
                    var cL = 0,
                            scripts = ['raphael-min', 'sp_ll_jc_mw_icms_us_scripts'],
                            scriptsL = scripts.length;

                    $.map(scripts, function(i, n) {
                        $.getScript(theme + 'js/' + i + '.js', function() {
                            cL++;
                            if (cL == scriptsL) {
                                $(document).trigger({'type': 'scriptDefer'});
                                init();
                            }
                        });
                    })
                }

                // Check for browser support of event handling capability
                if (window.addEventListener)
                    window.addEventListener("load", downloadJSAtOnload, false);
                else if (window.attachEvent)
                    window.attachEvent("onload", downloadJSAtOnload);
                else
                    window.onload = downloadJSAtOnload;
            </script>
        
        <?php $this->include_shop_tpl('js_templates', '/home/u14026/public_html/inpromservice.com.ua/templates/newLevel'); ?>
        <!-- scripts end -->
        <!-- Разработано - <a href="http://artexgroup.com.ua">Креативная компания "АРТ ЭКС груп</a> -->
    </body>
</html><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1459455472; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/../main.tpl ?>
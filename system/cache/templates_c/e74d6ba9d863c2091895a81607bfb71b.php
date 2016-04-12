<?php $colorScheme = 'css/color_scheme_1'?>
<div class="frame-inside page-404">
    <div class="container">
        <div class="content">
            <img src="<?php if(isset($THEME)){ echo $THEME; } ?><?php if(isset($colorScheme)){ echo $colorScheme; } ?>/images/404.png"/>
            <div class="description">
                <?php if(isset($error)){ echo $error; } ?>
                <div class="title"><?php echo lang ('Страница не найдена','newLevel'); ?></div>
                <p><b><?php echo lang ('Эта страница не существует или была удалена.','newLevel'); ?></b></p>
                <p><?php echo lang ('Приносим свои извинения за доставленные неудобства. Для продолжения работы вы можете перейти к представленным пунктам меню, воспользоваться  поиском по сайту либо перейти на','newLevel'); ?>
                <div class="btn-buy">
                    <a href="<?php echo site_url (); ?>"><span class="text-el"><?php echo lang ('Перейти на главную страницу','newLevel'); ?></span></a>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        $(document).on('ready', function(){
            $('footer').css({'z-index': 1, 'position': 'relative'});
        });
    </script>
<?php $mabilis_ttl=1460569772; $mabilis_last_modified=1386330344; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/404.tpl ?>
<div class="frame-crumbs">
    <?php echo widget ('path'); ?>
</div>
<div class="frame-inside page-text">
    <div class="container">
        <div class="text-left"><?php echo load_menu ('left_menu'); ?></div>
        <div class="text-right">
            <h1><?php echo encode( $category['name'] ) ?></h1>
            <ul class="items items-text-category">
                <?php if(is_true_array($pages)){ foreach ($pages as $p){ ?>
                    <li>
                        <a href="../<?php echo $p['cat_url']; ?><?php echo $p['url']; ?>" class="frame-photo-title <?php if($p['field_field_img']): ?>is-img<?php endif; ?>">
                            <?php if($p['field_field_img']): ?>
                                <span class="photo-block">
                                    <span class="helper"></span>
                                    <img src="<?php echo $p['field_field_img']; ?>" alt="" />
                                </span>
                            <?php endif; ?>
                            <span class="d_b">
                                <span class="date f-s_0 d_b">
                                    <span class="icon_time"></span><span class="text-el"></span>
                                    <span class="day"><?php echo date("d",  $p['publish_date'] ) ?> </span>
                                    <span class="month"><?php echo month(date("n",  $item['publish_date'] )) ?> </span>
                                    <span class="year"><?php echo date("Y ",  $p['publish_date'] ) ?></span>
                                </span>
                                <span class="title"><?php echo $p['title']; ?></span>
                            </span>
                        </a>
                        <div class="description">
                            <?php echo $p['prev_text']; ?>
                        </div>
                    </li>
                <?php }} ?>
            </ul>  
        </div>
    </div>
</div>
            <?php $mabilis_ttl=1460574534; $mabilis_last_modified=1386330344; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/category.tpl ?>
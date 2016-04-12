<?php if($can_comment == 1 AND !$is_logged_in): ?>
    <label>
        <span class="title__icsi-css"><b><?php echo sprintf (lang('Будь ласка, авторизуйтеся, щоб залишити коментар', 'newLevel'), site_url( $modules['auth'] )); ?></b></span>
    </label>
<?php endif; ?>
<div class="comment__icsi-css" id="comment__icsi-css">
  
    <?php if($can_comment == 0 OR $is_logged_in): ?>
        <div class="main-form-comments__icsi-css <?php if(!$comments_arr): ?>noComments<?php endif; ?>">
            <div class="frame-comments__icsi-css layout-highlight">
                <div class="title_h2__icsi-css title-default">
                    <div class="title"><?php echo lang ('Залишити коментар','newLevel'); ?></div>
                </div>
                <!-- Start of new comment fild -->
                <div class="form-comment__icsi-css form__icsi-css main-form-comments">
                    <div class="inside-padd">
                        <form method="post">
                            <?php if(!$is_logged_in): ?>
                                <?php if($use_moderation): ?>
                                    <label>
                                        <span class="frame_form_field__icsi-css">
                                            <div class="msg">
                                                <div class="success">
                                                    <?php echo lang ('Коментар буде відправлений на модерацію','newLevel'); ?>
                                                </div>
                                            </div>
                                        </span>
                                    </label>
                                <?php endif; ?>
                                <label style="width: 45%;float: left;">
                                    <span class="title__icsi-css"><?php echo lang ('Ваше ім`я','newLevel'); ?></span>
                                    <span class="frame_form_field__icsi-css">
                                        <input type="text" name="comment_author" value="<?php echo get_cookie ('comment_author'); ?>"/>
                                    </span>
                                </label>
                                <label style="width: 45%;margin-left: 10%;float: left;">
                                    <span class="title__icsi-css"><?php echo lang ('Ваш email:', 'newLevel'); ?></span>
                                    <span class="frame_form_field__icsi-css">
                                        <input type="text" name="comment_email" id="comment_email" value="<?php echo get_cookie ('comment_email'); ?>"/>
                                    </span>
                                </label>
                            <?php endif; ?>
                            <label>
                                <span class="title__icsi-css"><?php echo lang ('Текст коментаря:'); ?></span>
                                <span class="frame_form_field__icsi-css">
                                    <textarea name="comment_text" class="comment_text"><?php echo $_POST['comment_text']; ?></textarea>
                                </span>
                            </label>
                            <!-- Start star reiting -->
                            <div class="frameLabel__icsi-css">
                                <span class="title__icsi-css f_l t-a_l"><?php echo lang ('Ваша оцінка:', 'newLevel'); ?></span>
                                <div class="frame_form_field__icsi-css">
                                    <div class="star">
                                        <div class="productRate star-big clicktemprate">
                                            <div class="for_comment" style="width: 0%"></div>
                                            <input class="ratec" name="ratec" type="hidden" value=""/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End star reiting -->
                            <?php if($use_captcha): ?>
                                <label>
                                    <span class="title__icsi-css"><?php echo lang ('Код захисту'); ?></span>
                                    <?php if(isset($cap_image)){ echo $cap_image; } ?>
                                    <span class="frame_form_field__icsi-css">
                                        <input type="text" name="captcha" id="captcha"/>
                                    </span>
                                </label>
                            <?php endif; ?>

                            <div class="frameLabel__icsi-css">
                                <span class="frame_form_field__icsi-css">
                                    <div class="btn-form">
                                        <input type="submit" value="<?php echo lang ('Коментувати'); ?>" onclick="Comments.post
                                            (this)"/>
                                    </div>
                                </span>
                            </div>
                        </form>
                    </div>
                    <!-- End of new comment fild -->
                </div>
            </div>
        </div>
    <?php endif; ?>
    <?php if($comments_arr): ?>
        <div class="frame-list-comment__icsi-css">
            <ul class="sub-1 product-comment patch-product-view">
                <?php if(is_true_array($comments_arr)){ foreach ($comments_arr as $key => $comment){ ?>
                    <li>
                        <input type="hidden" name="comment_item_id" value="<?php echo $comment['id']; ?>"/>
                        <div class="author-data-comment__icsi-css">
                            <span class="f-s_0"><span class="icon_comment"></span><span class="author-comment__icsi-css"><?php echo $comment['user_name']; ?>, </span></span>
                            <span class="date-comment__icsi-css"> <?php echo date ('d-m-Y H:i',  $comment['date'] ); ?></span>
                        </div>
                        <?php if($comment['rate']  != 0): ?>
                            <div class="mark-pr">
                                <span><?php echo lang ('Оцінка:','newLevel'); ?></span>
                                <div class="star-small d_i-b">
                                    <div class="productRate star-small">
                                        <div style="width: <?php echo (int) $comment['rate']  *20 ?>%"></div>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                        <div class="frame-comment__icsi-css">
                            <p><?php echo $comment['text']; ?></p>
                            <?php if($comment['text_plus']  != Null): ?>
                                <p>
                                    <b><?php echo lang ('Так', 'newLevel'); ?></b><br>
                                    <?php echo $comment['text_plus']; ?>
                                </p>
                            <?php endif; ?>
                            <?php if($comment['text_minus']  != Null): ?>
                                <p>
                                    <b><?php echo lang ('Ні', 'newLevel'); ?></b><br>
                                    <?php echo $comment['text_minus']; ?>
                                </p>
                            <?php endif; ?>
                        </div>
                        <div class="func-button-comment__icsi-css">
                            <?php if($can_comment == 0 OR $is_logged_in): ?>
                                <div class="btn__icsi-css f_l__icsi-css">
                                    <button type="button" data-rel="cloneAddPaste" data-parid="<?php echo $comment['id']; ?>">
                                        <span class="icon-comment__icsi-css"></span>
                                        <span class="text-el d_l_1"><?php echo lang ('Відповісти'); ?></span>
                                    </button>
                                </div>
                            <?php endif; ?>

                            <div class="f_r__icsi-css">
                                <span>
                                    <span class="s-t"><?php echo lang ('Чи корисний відгук?','newLevel'); ?></span>
                                    <span class="btn__icsi-css like__icsi-css">
                                        <button type="button" class="usefullyes" data-comid="<?php echo  $comment['id']  ?>">
                                            <span class="text-el"><?php echo lang ('Так','newLevel'); ?> <span class="yesholder<?php echo $comment['id']; ?>">(<?php echo  $comment['like']  ?>)</span></span>
                                        </button>
                                    </span>
                                    <span class="btn__icsi-css dis-like__icsi-css">
                                        <button type="button" class="usefullno" data-comid="<?php echo  $comment['id']  ?>">
                                            <span class="text-el"><?php echo lang ('Ні','newLevel'); ?> <span class="noholder<?php echo $comment['id']; ?>">(<?php echo  $comment['disslike']  ?>)</span></span>
                                        </button>
                                    </span>
                                </span>
                            </div>
                        </div>
                        <?php $countAnswers = $CI->load->module('comments')->commentsapi->getCountCommentAnswersByCommentId( $comment['id'] ) ?>
                        <?php if($countAnswers): ?>
                            <ul class="frame-list-comment__icsi-css sub-2">
                                <?php if(is_true_array($comment_ch)){ foreach ($comment_ch as $com_ch){ ?>
                                    <?php if($com_ch['parent']  ==  $comment['id']): ?>
                                        <li>
                                            <div class="author-data-comment__icsi-css">
                                                <span class="s-t"><?php echo lang ('Коментар від','newLevel'); ?></span>
                                                <span class="author-comment__icsi-css"><?php echo $com_ch['user_name']; ?></span>
                                                <span class="date-comment__icsi-css"><?php echo date ('d-m-Y H:i',  $com_ch['date'] ); ?></span>
                                            </div>
                                            <div class="frame-comment__icsi-css">
                                                <p>
                                                    <?php echo $com_ch['text']; ?>
                                                </p>
                                            </div>
                                        </li>
                                    <?php endif; ?>
                                <?php }} ?>
                            </ul>
                        <?php endif; ?>
                        <div class="btn-all-comments">
                            <button type="button"><span class="text-el" data-hide='<span class="d_l_1"><?php echo lang ('Приховати','newLevel'); ?></span> ↑' data-show='<span class="d_l_1"><?php echo lang ('Смотреть все ответы','newLevel'); ?></span> ↓'></span></button>
                        </div>
                    </li>
                <?php }} ?>
            </ul>
            <button class="t-d_n f-s_0 s-all-d ref d_n_" data-trigger="[data-href='#comment']" data-scroll="true">
                <span class="icon_arrow"></span>
                <span class="text-el"><?php echo lang ('Продивитися всі відповіді','newLevel'); ?></span>
            </button>
        </div>
    <?php endif; ?>

    <div class="frame-drop-comment__icsi-css" data-rel="whoCloneAddPaste">
        <div class="form-comment__icsi-css form__icsi-css layout-highlight frame-comments__icsi-css">
            <div class="title_h2__icsi-css title-default">
                <div class="title"><?php echo lang ('Ваша відповідь','newLevel'); ?></div>
            </div>
            <div class="inside-padd">
                <form>
                    <label class="err-label">
                        <span class="frame_form_field__icsi-css">
                            <div class="frameLabel__icsi-css error" name="error_text"></div>
                        </span>
                    </label>

                    <?php if(!$is_logged_in): ?>
                        <label>
                            <span class="title__icsi-css"><?php echo lang ('Ваше ім`я:', 'newLevel'); ?></span>
                            <span class="frame_form_field__icsi-css">
                                <input type="text" name="comment_author" value="<?php echo get_cookie ('comment_author'); ?>"/>
                            </span>
                        </label>
                        <label>
                            <span class="title__icsi-css"><?php echo lang ('Ваш email:', 'newLevel'); ?> </span>
                            <span class="frame_form_field__icsi-css">
                                <input type="text" name="comment_email" value="<?php echo get_cookie ('comment_email'); ?>"/>
                            </span>
                        </label>
                        <label>
                            <span class="frame_form_field__icsi-css">
                                <div class="msg">
                                    <div class="success">
                                        <?php echo lang ('Коментар буде відправленний на модерацію','newLevel'); ?>
                                    </div>
                                </div>
                            </span>
                        </label>
                    <?php endif; ?>
                    <label>
                        <span class="title__icsi-css"><?php echo lang ('Текст відповіді:','newLevel'); ?></span>
                        <span class="frame_form_field__icsi-css">
                            <textarea class="comment_text" name="comment_text"></textarea>
                        </span>
                    </label>
                    <div class="frameLabel__icsi-css">
                        <span class="frame_form_field__icsi-css">
                            <input type="hidden" id="parent" name="comment_parent" value="">
                            <span class="btn-form">
                                <input type="submit" value="<?php echo lang ('Коментувати', 'newLevel'); ?>" onclick="Comments.post(this)"/>
                            </span>
                        </span>
                    </div>
                </form>
            </div>  
        </div>
    </div>
</div><?php $mabilis_ttl=1460568523; $mabilis_last_modified=1459369902; //templates/newLevel/comments/comments_api.tpl ?>
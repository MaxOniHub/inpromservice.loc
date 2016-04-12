<nav>
    <ul class="nav nav-enter-reg">
        <?php if(!$CI->dx_auth->is_logged_in()): ?>
            <li class="btn-enter">
                <button type="button"
                        id="loginButton"
                        data-drop=".drop-enter"
                        data-source="<?php echo site_url ('auth'); ?>"
                        >
                    <span class="icon_enter"></span>
                    <span class="text-el"><?php echo lang ('Вход','newLevel'); ?></span>
                </button>
            </li>
            <li class="or f-s_0">
                <span class="text-el"><?php echo lang ('или','newLevel'); ?></span>
            </li>
            <li class="btn-register">
                <a href="/auth/register" rel=”nofollow”>
                    <span class="icon_reg"></span>
                    <span class="text-el"><?php echo lang ('Регистрация','newLevel'); ?></span>
                </a>
            </li>
            <!--Else show link for personal cabinet -->
        <?php else:?>
            <li class="btn-personal-area">
                <a href="/shop/profile">
                    <span class="icon_enter"></span>
                    <span class="text-el"><?php echo lang ('Личный кабинет','newLevel'); ?></span>
                </a>
            </li>
            <li class="btn-exit-shop">
                <button type="button" class="f-s_0" onclick="ImageCMSApi.formAction('/auth/authapi/logout', '',{callback: function(msg, status, form, DS) {
                                if (status) {
                                    var items = Shop.Cart.getAllItems();
                                    for (var i = 0; i < items.length; i++)
                                        localStorage.removeItem(items[i].storageId());
                                    localStorage.removeItem('wishList');
                                }
                            }});
                        return false;">
                    <span class="icon_exit"></span>
                    <span class="text-el"><?php echo lang ('Выход','newLevel'); ?></span>
                </button>
            </li>
        <?php endif; ?>
    </ul>
</nav><?php $mabilis_ttl=1460566825; $mabilis_last_modified=1390385002; ///home/u14026/public_html/inpromservice.com.ua/templates/newLevel/shop/auth_data.tpl ?>
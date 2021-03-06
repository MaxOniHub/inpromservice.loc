<div class="container">
    <section class="mini-layout">
        <div class="frame_title clearfix">
            <div class="pull-left">
                <span class="help-inline"></span>
                <span class="title">{lang('Editing status of appearance','admin')}</span>  

            </div>
            <div class="pull-right">
                <div class="d-i_b">
                    <a href="/admin/components/run/shop/notificationstatuses/index" class="t-d_n m-r_15"><span class="f-s_14">←</span> <span class="t-d_u">{lang('Back','admin')}</span></a>
                    <button type="button" class="btn btn-small btn-primary action_on formSubmit" data-action="edit" data-form="#editNot" data-submit><i class="icon-ok icon-white"></i>{lang('Save','admin')}</button>
                    <button type="button" class="btn btn-small action_on formSubmit" data-action="close" data-form="#editNot"><i class="icon-check"></i>{lang('Save and go back','admin')}</button>
                    {echo create_language_select($languages, $locale, '/admin/components/run/shop/notificationstatuses/edit/'.$model->getId())}
                </div>
            </div>                            
        </div>
        <div class="content_big_td">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <thead>
                    <tr>
                        <th colspan="6">
                            {lang('Callback status data','admin')}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">
                            <form action="{$ADMIN_URL}notificationstatuses/edit/{echo $model->getId()}/{$locale}" id="editNot" class="span9" method="post">
                                <div class="inside_padd">
                                    <div class="form-horizontal">
                                        <div class="control-group" >
                                            <label class="control-label" for="Name">{lang('Name','admin')}:{$translatable}:</label>
                                            <div class="controls">
                                                <input type="text" name="Name" id="Name" value="{echo ShopCore::encode($model->getName())}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>
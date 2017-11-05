<?php

use yii\helpers\Url;

$this->title = '添加管理员';
?>
<style>
    .layui-form-label {
        float: left;
        display: block;
        padding: 9px 15px;
        width: 120px;
        font-weight: 400;
        text-align: right;
    }
    .role_box{
        padding: 20px 12px;
    }
    .role_box h3{
        border-bottom: 1px solid #dadada;
        padding: 10px 0 5px 0;
    }
    .role_box ul{
        display: flex;
        justify-content: flex-start;
    }
    .role_box ul li{
        margin-top:12px;
    }
</style>
<div class="col-md-12 animated fadeIn node_edit">
    <div class="col-md-12" style="margin-bottom:20px;margin-top:20px;">
        <div class="bg-info" style="padding:10px;">
            <b>特别说明：</b>
        </div>
    </div>

    <form class="layui-form" method="post">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-inline">
                    <input type="text" id="username" class="form-control" placeholder="输入登录用户名" />
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" class="form-control" placeholder="输入登录密码" />
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">联系邮箱</label>
                <div class="layui-input-inline">
                    <input type="email" id="email" class="form-control" placeholder="联系邮箱" />
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="real_name" class="form-control" placeholder="真实姓名" />
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-inline">
                    <input type="number" id="phone" class="form-control" placeholder="手机号码" />
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="birth_date" class="form-control" placeholder="出生日期" />
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="status" value="1" class="form-control" title="有效" checked />
                <input type="radio" name="status" value="0" class="form-control" title="无效" />
            </div>
        </div>

        <div class="role_box">
            <h3>角色分配</h3>
            <ul>
                <?php foreach ($roles as $item) { ?>
                    <li>
                        <input type="checkbox" name="role_id[]"
                               class="role_id" value="<?= $item['id'] ?>"
                               lay-skin="primary" title="<?= $item['name'] ?>" />
                    </li>
                <?php } ?>
            </ul>
        </div>
    </form>
</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#birth_date'
        });
    });

    function submit(index, callback) {
        var data = new Object();
        data.username = $('#username').val();
        data.phone = $('#phone').val();
        data.password = $('#password').val();
        data.email = $('#email').val();
        data.real_name = $('#real_name').val();
        data.status = $("[name='status']:checked").val();
        data.birth_date = $('#birth_date').val();

        var roleIds = new Array();
        $(".role_id:checkbox:checked").each(function(){
            roleIds.push($(this).val())
        })
        roleIds = roleIds.join(',');
        data.roles = roleIds;

        app.post("<?= Url::toRoute('/system/user/save') ?>", data, function(res) {
            if (res !== false) {
                app.showMsg(res, 'success');
                app.parent.layer.close(index);

                callback(true);
            }

            callback(false);
        });
    }
</script>

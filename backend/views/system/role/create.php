<?php

use yii\helpers\Url;
$this->title = '添加角色';
?>
<link href="/js/plugins/jsTree/themes/default/style.min.css" rel="stylesheet">
<style>
    .layui-form-label {
        float: left;
        display: block;
        padding: 9px 15px;
        width: 105px;
        font-weight: 400;
        text-align: right;
    }
</style>
<form class="form-horizontal layui-form">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">基本信息</li>
            <li>权限分配</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <input type="text" id="name" class="form-control" placeholder="角色名称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <textarea class="form-control" id="remark" placeholder="备注或者描述"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="status" class="form-control" title="开启" value="1" checked />
                        <input type="radio" name="status" class="form-control" title="关闭" value="0" />
                    </div>
                </div>
            </div>

            <div class="layui-tab-item" id="menuBox"></div>
        </div>
    </div>
</form>

<script src="/js/plugins/jsTree/jstree.min.js"></script>
<script>
    var nodes = '';
    layui.use('element', function() { });

    function submit(index, callback) {
        var data = new Object();
        data.name = $('#name').val();
        data.remark = $('#remark').val();
        data.status = $("[name='status']:checked").val();
        data.nodes = nodes;

        app.post("<?= \yii\helpers\Url::toRoute('/system/role/save') ?>", data, function(res) {
            if (res !== false) {
                app.showMsg(res, 'success');
                app.parent.layer.close(index);

                callback(true);
            }

            callback(false);
        });
    }
    $(function() {
        app.post("<?= Url::toRoute('/system/node/get-data') ?>", {}, function(res) {
            if (res !== false) {
                $("#menuBox").jstree({
                    plugins : ['checkbox'],
                    core : {
                        'multiple' : true,
                        'data' : res,
                        'dblclick_toggle' : false, // 禁用双击展开
                    }
                }).bind('changed.jstree', function(e, data) {
                    var i, j, r = [];
                    for(i = 0, j = data.selected.length; i < j; i++) {
                        r.push(data.instance.get_node(data.selected[i]).id);
                    }

                    nodes = r.join(',');
                });
            }
        });
    });
</script>
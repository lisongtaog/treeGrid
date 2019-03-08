<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editable TreeGrid - jQuery EasyUI Demo</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/bird.ico">
    <link rel="stylesheet" type="text/css" href="/css/jquery-easyui-1.5.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery-easyui-1.5.5.1/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery-easyui-1.5.5.1/demo/demo.css">
    <script type="text/javascript" src="/css/jquery-easyui-1.5.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/css/jquery-easyui-1.5.5.1/jquery.easyui.min.js"></script>
</head>

<body class="easyui-layout">
<div data-options="region:'west',title:'operation',split:true" style="width:100px;">
    <div style="margin:20px 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">Edit</a><br><br><br>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a><br><br><br>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">Cancel</a>
    </div>
</div>
<div data-options="region:'center',title:'cool'" style="padding:5px;background:#eee;">
    <table id="tg" class="easyui-treegrid" title="Config" style="width:700px;height:250px"
           data-options="
                fit:true,
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url: '/selTreeGrid',
				method: 'get',
				idField: 'id',
				treeField: 'name',
				showFooter: true,
				onContextMenu:onContextMenu
			">
        <thead>
        <tr>
            <th data-options="field:'name',width:180,editor:'text'">Key</th>
            <th data-options="field:'value',width:180,align:'left',editor:'text'">Value</th>
        </tr>
        </thead>
    </table>

    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
        <div onclick="removeIt()" data-options="iconCls:'icon-remove'">Remove</div>
        <div class="menu-sep"></div>
        <div onclick="collapse()">Collapse</div>
        <div onclick="expand()">Expand</div>
    </div>
    <script type="text/javascript">

        //treegrid 的js代码
        //编辑目录
        var editingId;

        function edit() {
            if (editingId != undefined) {
                $('#tg').treegrid('select', editingId);
                return;
            }
            var node = $('#tg').treegrid('getSelected');
            if (node) {
                editingId = node.id
                $('#tg').treegrid('beginEdit', editingId);
            }
        }

        function save() {
            if (editingId != undefined) {
                $('#tg').treegrid('endEdit', editingId);
                editingId = undefined;
            }

            var node = $('#tg').treegrid('getSelected');

            // alert(row._parentId);

            var data = {"id": node.id, "name": node.name, "value": node.value, "_parentId": node._parentId};

            $.ajax({
                type: "POST",
                url: "/upTreeGrid",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                    if (result > 0) {
                        //alert("更新成功！！！");
                    }
                }
            });
        }

        function cancel() {
            if (editingId != undefined) {
                $('#tg').treegrid('cancelEdit', editingId);
                editingId = undefined;
            }
        }

        /******************************************************************/
        function onContextMenu(e, row) {
            e.preventDefault();
            $(this).treegrid('select', row.id);
            $('#mm').menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        }

        // 生成节点ID
        function uuid() {
            var uuid;
            $.ajax({
                type: "POST",
                url: "/selMaxId",
                // dataType: "json",
                // contentType: "application/json",
                // data: JSON.stringify(data),
                async: false,
                cache: false,
                success: function (result) {
                    // var jsonData = JSON.parse(result);
                    uuid = result.id;
                }
            });
            return uuid;
        }

        //添加节点
        function append() {

            if (editingId != null) {
                // $.messager.alert("提示信息", "请先保存");
                alert("提示信息", "请先保存");
                return;
            }

            var node = $('#tg').treegrid('getSelected');
            expand();
            //alert(node.id);
            //alert(uid);

            var data = {"_parentId": node.id};

            $.ajax({
                type: "POST",
                url: "/insTreeGrid",
                async: false,
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                    if (result > 0) {
                        //alert("good！！！");
                    }
                }
            });

            var uid = uuid();
            //alert(uid);

            $('#tg').treegrid('append', {
                parent: node.id,
                data: [{
                    id: uid
                }]
            })

            editingId = uid;
            if (editingId != null) {
                $('#tg').treegrid('select', editingId);
            }
            $('#tg').treegrid('beginEdit', editingId);
        }

        //删除节点方法
        function removeRow(id) {
            var data = {"id": id};

            $.ajax({
                type: "POST",
                url: "/delTreeGrid",
                async: false,
                dataType: "json",
                //contentType: "application/json",
                data: data,
                success: function (result) {
                    //alert("删除成功！！！");
                }
            });
        }

        //移除节点
        function removeIt() {
            if (editingId != null) {
                $.messager.alert("提示信息", "请先保存");
                return;
            }
            confirm('你确定要删除吗??');

            var node = $('#tg').treegrid('getSelected');

            if (node) {
                $('#tg').treegrid('remove', node.id);
            }

            removeRow(node.id);

            // var data = {"id": node.id};
            //
            // $.ajax({
            //     type: "POST",
            //     url: "/delTreeGrid",
            //     dataType: "json",
            //     contentType: "application/json",
            //     data: JSON.stringify(data),
            //     success: function (result) {
            //         if (result > 0) {
            //             // alert("删除成功！！！");
            //         }
            //     }
            // });

            var data = {"pid": node.id};
            var listId;

            $.ajax({
                type: "POST",
                url: "/selTreeGridByPid",
                async: false,
                dataType: "json",
                //contentType: "application/json",
                data: data,
                success: function (result) {
                    listId = result;
                }
            });

            for (var i = 0; i < listId.length; i++) {
                //alert(listId[i]);
                removeRow(listId[i]);
            }
        }

        //收起节点
        function collapse() {
            var node = $('#tg').treegrid('getSelected');
            if (node) {
                $('#tg').treegrid('collapse', node.id);
            }
        }

        //展开节点
        function expand() {
            var node = $('#tg').treegrid('getSelected');
            if (node) {
                $('#tg').treegrid('expand', node.id);
            }
        }
    </script>
</div>
</body>

</html>
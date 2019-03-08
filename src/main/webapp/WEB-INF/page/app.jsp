<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AppConfig</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/bird.ico"/>

    <link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.5.5.1/themes/icon.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/jquery-easyui-1.5.5.1/demo/demo.css">--%>
    <script type="text/javascript" src="/js/jquery-easyui-1.5.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.5.5.1/jquery.easyui.min.js"></script>
</head>

<body>
<div id="cc" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',split:true" style="width:160px;">
        <table id="dg" class="easyui-datagrid" title="AppId" style="height:auto"
               data-options="
                fit:true,
                rownumbers: true,
                collapsible: true,
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: '/selAppIdVersion',
				method: 'get',
				onClickRow: onClickRow,
				onRowContextMenu: onRowContextMenu
			    ">
            <thead>
            <tr>
                <th data-options="field:'appid',width:80,align:'center',editor:'text'">App ID</th>
            </tr>
            </thead>
        </table>

        <div id="menu" class="easyui-menu" style="width:120px;">
            <div onclick="onDblClickRow()" data-options="iconCls:'icon-edit'">Edit</div>
        </div>

        <div id="tb" style="height:auto">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
               onclick="append1()"></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
               onclick="removeit()"></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true"
               onclick="accept()"></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"
               onclick="reject()"></a>

            <div>
                <input id="appid" class="easyui-searchbox" prompt="Input AppId" style="width: 130px"
                       searcher="doSearch">
            </div>

        </div>


        <script type="text/javascript">
            var editIndex = undefined;

            /**
             *  双击编辑已经改为，右键编辑。
             */
            function onDblClickRow() {
                var index = $('#dg').datagrid('getRowIndex', $('#dg').datagrid('getSelected'));

                if (editIndex != index) {
                    if (editIndex == undefined) {
                        $('#dg').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                        editIndex = index;
                        // alert(editIndex);
                    } else {
                        $('#dg').datagrid('selectRow', editIndex);
                    }
                }
            }

            /**
             * 单击查询版本信息。
             */
            function onClickRow(index) {
                var row = $('#dg').datagrid('getSelected');
                var AppId = row.appid;

                $('#version').datagrid('load', {
                    url: "/selVersion",
                    appid: AppId
                });
            }

            /**
             *   插入节点，并开始编辑，查询刚插入的版本信息。
             */
            function append1() {

                if (editIndex == undefined) {

                    $.ajax({
                        type: "post",
                        url: "/selMaxConfigIdNext",
                        async: false,
                        datatype: "json",
                        success: function (index) {
                            var data = {"configId": index};
                            $.ajax({
                                type: "POST",
                                url: "/insAppid",
                                async: false,
                                dataType: "json",
                                data: data,
                                success: function (result) {
                                }
                            });
                        }
                    })

                    $('#dg').datagrid('appendRow', {appid: 'p'});
                    editIndex = $('#dg').datagrid('getRows').length - 1;
                    $('#dg').datagrid('selectRow', editIndex)
                        .datagrid('beginEdit', editIndex);

                    onClickRow(editIndex);
                }
            }

            /**
             *  删除节点。
             */
            function removeit() {
                if (!confirm("危险操作，请三思！！")) {
                    return;
                }

                var index2 = $('#dg').datagrid('getRowIndex', $('#dg').datagrid('getSelected'));

                var node = $('#dg').datagrid('getSelected');


                var delRedisData = {
                    appid: node.appid
                };

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/updataAppidDelRedis",
                    dataType: "json",
                    data: delRedisData,
                    success: function (result) {
                        alert(result);
                    }
                });



                var data = {
                    "appid": node.appid
                };

                $.ajax({
                    type: "POST",
                    url: "/delAppid",
                    async: false,
                    dataType: "json",
                    data: data,
                    success: function (result) {
                        if (result > 0) {
                            alert("删除成功！");
                            $('#dg').datagrid('cancelEdit', index2)
                                .datagrid('deleteRow', index2);

                            $('#version').datagrid('load', {
                                url: "/selVersion"
                            });

                            $('#tg').treegrid('load', {
                                url: "/selTreeGrid"
                            });
                        } else {
                            alert("删除失败！")
                        }
                    }
                });
            }

            /**
             * 关闭编辑，更新节点信息。
             */
            function accept() {
                if (editIndex == undefined) {
                    alert("操作有误，亲！");
                    return;
                }

                var node1 = $('#dg').datagrid('getSelected');
                var appid = node1.appid;

                var delRedisData = {
                    appid: appid
                };

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/updataAppidDelRedis",
                    dataType: "json",
                    data: delRedisData,
                    success: function (result) {
                        alert(result);
                    }
                });

                if (editIndex != undefined) {
                    $('#dg').datagrid('endEdit', editIndex);
                    editIndex = undefined;
                }

                var node2 = $('#dg').datagrid('getSelected');
                var appid2 = node2.appid;

                var data = {
                    "appid": appid,
                    "appid2": appid2
                };

                $.ajax({
                    type: "POST",
                    url: "/upAppId",
                    dataType: "json",
                    data: data,
                    success: function (result) {

                    }
                });
            }

            /**
             *  撤销编辑
             */
            function reject() {
                $('#dg').datagrid('rejectChanges');
                editIndex = undefined;
            }

            /**
             * 搜索框的模糊查询。
             */
            function doSearch() {
                $('#dg').datagrid('load', {
                    url: "/selAppIdVersion",
                    appid: $('#appid').val()
                });
            }

            /**
             * 右键菜单的定义。
             * @param e
             * @param index
             */
            function onRowContextMenu(e, index) {
                e.preventDefault();
                $(this).datagrid('selectRow', index);
                $('#menu').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        </script>

    </div>

    <div data-options="region:'center'" style="width:320px;">
        <div class="easyui-panel" fit="true">
            <div class="easyui-layout" fit="true" title="Complex Panel Layout" iconCls="icon-reload" collapsible="true">

                <div region="south">
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">Edit</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">Cancel</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="makeJson()">MakeJson</a>
                    <a href="/GroupSeries" class="easyui-linkbutton" style="float: right">GroupSeries</a>
                </div>

                <div region="center" border="false">
                    <table id="tg" class="easyui-treegrid" title="Config" style="width:700px;height:auto"
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
                            onContextMenu:onContextMenu,
                            onDblClickRow:edit
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

                        //编辑目录
                        var editingId = undefined;

                        /**
                         * 编辑按钮方法。
                         */
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

                        /**
                         *  保存按钮方法。结束编辑，更新数据。
                         */
                        function save() {
                            if (editingId == undefined) {
                                alert("操作有误，亲！！");
                                return;
                            }
                            if (editingId != undefined) {
                                $('#tg').treegrid('endEdit', editingId);
                                editingId = undefined;
                            }

                            var node = $('#tg').treegrid('getSelected');

                            var data = {
                                "id": node.id,
                                "name": node.name,
                                "value": node.value
                            };

                            $.ajax({
                                type: "POST",
                                async: false,
                                url: "/upTreeGrid",
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                success: function (result) {

                                   /*
                                   *    更新成功，找到appId及其对应的version(直接在version)栏里就可以得到这两个参数。
                                   *    调用jedis代码来达到删除更新的对应缓存config
                                   */
                                    delRedis();
                                }
                            });
                        }

                        /**
                         * 撤销编辑。
                         */
                        function cancel() {
                            if (editingId != undefined) {
                                $('#tg').treegrid('cancelEdit', editingId);
                                editingId = undefined;
                            }
                        }

                        /******************************************************************/
                        /**
                         * 定义编辑菜单。
                         */
                        function onContextMenu(e, row) {
                            e.preventDefault();
                            $(this).treegrid('select', row.id);
                            $('#mm').menu('show', {
                                left: e.pageX,
                                top: e.pageY
                            });
                        }

                        /**
                         * 生成节点ID的方法。
                         */
                        function uuid() {
                            var uuid;
                            $.ajax({
                                type: "POST",
                                url: "/selMaxId",
                                async: false,
                                cache: false,
                                success: function (result) {
                                    // var jsonData = JSON.parse(result);
                                    uuid = result.id;
                                }
                            });
                            return uuid;
                        }

                        /**
                         *  新增节点并开始编辑。
                         */
                        function append() {

                            if (editingId != null) {
                                $.messager.alert("提示信息", "请先保存");
                                return;
                            }

                            var node = $('#tg').treegrid('getSelected');
                            expand();

                            var data1 = {"configid": node.configid, "_parentId": node.id};

                            $.ajax({
                                type: "POST",
                                url: "/insTreeGrid",
                                async: false,
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify(data1),
                                success: function (result) {
                                    /*这里是没必要的，新增节点，是要先插入，再编辑，保存。*/
                                    // delRedis();
                                }
                            });

                            var uid = uuid();

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

                        /**
                         *  删除单个节点方法
                         */
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

                        /**
                         *  移除节点调用（删除单个节点方法）
                         */
                        function removeIt() {
                            if (editingId != null) {
                                $.messager.alert("提示信息", "请先保存");
                                return;
                            }
                            confirm('你确定要删除吗?');

                            var node = $('#tg').treegrid('getSelected');

                            if (node) {
                                $('#tg').treegrid('remove', node.id);
                            }

                            removeRow(node.id);

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
                            delRedis();
                        }

                        /**
                         *  收起节点
                         */
                        function collapse() {
                            var node = $('#tg').treegrid('getSelected');
                            if (node) {
                                $('#tg').treegrid('collapse', node.id);
                            }
                        }

                        /**
                         * 展开节点
                         */
                        function expand() {
                            var node = $('#tg').treegrid('getSelected');
                            if (node) {
                                $('#tg').treegrid('expand', node.id);
                            }
                        }

                        /**
                         *   生成json字符串
                         */
                        function makeJson() {
                            var row = $('#version').datagrid('getSelected');
                            var configid = row.configid;
                            var data = {"configid": configid};
                            $.ajax({
                                type: "POST",
                                url: "/makeJson",
                                async: false,
                                dataType: "json",
                                data: data,
                                success: function (result) {
                                }
                            });
                        }

                        /**
                        * 执行更新·删除·添加树的节点，清空对应的redis缓存
                        */
                        function delRedis() {
                            var row = $('#version').datagrid('getSelected');
                            var appid = row.appid;
                            var version = row.version;

                            var data = {
                                "appid":appid,
                                "version":version
                            };
                            $.ajax({
                                type:"POST",
                                async:false,
                                url:"/deleteRedisData",
                                data: data,
                                success: function (result) {
                                    alert(result);
                                }
                            })
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'east',split:true" style="width:230px;">
        <table id="version" class="easyui-datagrid" title="Version" style="height:auto"
               data-options="
                fit:true,
                rownumbers: true,
                collapsible: true,
				iconCls: 'icon-edit',
				singleSelect: true,
				url: '/selVersion',
				method: 'get',
				toolbar: '#tb2',
				onClickRow: onClickRow2,
				onLoadSuccess:onLoadSuccess,
				onRowContextMenu: onRowContextMenu2
			">
            <thead>
            <tr>
                <th data-options="field:'version',width:80,align:'center',editor:'text'">Version</th>
                <th data-options="field:'state',width:80,align:'center',editor:'text'">state</th>
            </tr>
            </thead>
            <div id="tb2" style="height:auto">
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
                   onclick="append2()"></a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
                   onclick="removeit2()"></a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true"
                   onclick="accept2()"></a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"
                   onclick="reject2()"></a>

                <div>
                    <input id="versionSearch" class="easyui-searchbox" prompt="Input Version" style="width: 130px"
                           searcher="doSearch2">
                </div>

            </div>
        </table>
        <div id="menu2" class="easyui-menu" style="width:120px;">
            <div onclick="onDblClickRow2()" data-options="iconCls:'icon-edit'">Edit</div>
            <div onclick="CreateConfig()" data-options="iconCls:'icon-add'">CreateConfig</div>
        </div>

        <script type="text/javascript">
            var editIndex2 = undefined;

            var onLoadSuccessFlag = false;

            /**
             *  双击改为了右键开始编辑。
             */
            function onDblClickRow2() {
                var index = $('#version').datagrid('getRowIndex', $('#version').datagrid('getSelected'));

                if (editIndex2 != index) {
                    if (editIndex2 == undefined) {
                        $('#version').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                        editIndex2 = index;
                    } else {
                        $('#version').datagrid('selectRow', editIndex2);
                    }
                }
            }

            /**
             *  单击查询config信息。
             * @param index
             */
            function onClickRow2(index) {
                var row = $('#version').datagrid('getSelected');
                var configid = row.configid;

                $('#tg').treegrid('load', {
                    url: "/selTreeGrid",
                    configid: configid
                });
            }

            /**
             *  查询成功的回调函数。
             * @param result
             */
            function onLoadSuccess(result) {

                if (onLoadSuccessFlag == true) {
                    if (editIndex2 == undefined) {
                        editIndex2 = $('#version').datagrid('getRows').length - 1;
                        $('#version').datagrid('selectRow', editIndex2)
                            .datagrid('beginEdit', editIndex2);
                    }
                }
                onLoadSuccessFlag = false;
            }

            /**
             *  插入数据， 并查询插入的version，并调用回调函数。
             */
            function append2() {
                var node = $('#dg').datagrid('getSelected');

                $.ajax({
                    type: "post",
                    url: "/selMaxConfigIdNext",
                    async: false,
                    datatype: "json",
                    success: function (index) {
                        var data = {"appid": node.appid, "configid": index};
                        $.ajax({
                            type: "POST",
                            url: "/insVersion",
                            async: false,
                            dataType: "json",
                            data: data,
                            success: function (result) {
                            }
                        });
                    }
                })

                onLoadSuccessFlag = true;

                $('#version').datagrid('load', {
                    url: "/selVersion",
                    appid: node.appid,
                });
            }

            /**
             * 删除节点
             */
            function removeit2() {
                var rows = $('#version').datagrid('getRows');
                if (rows.length < 2) {
                    alert("只有一个版本，请直接去删除appid!");
                    return
                }

                if (!confirm("危险操作，请三思！！")) {
                    return;
                }

                var index2 = $('#version').datagrid('getRowIndex', $('#version').datagrid('getSelected'));

                var node = $('#version').datagrid('getSelected');

                var data = {
                    "configid": node.configid
                };

                $.ajax({
                    type: "POST",
                    url: "/delVersion",
                    async: false,
                    dataType: "json",
                    data: data,
                    success: function (result) {
                        if (result > 0) {
                            delRedis();
                            alert("删除成功！");
                            $('#version').datagrid('cancelEdit', index2)
                                .datagrid('deleteRow', index2);

                            $('#tg').treegrid('load', {
                                url: "/selTreeGrid",
                            });

                        } else {
                            alert("删除失败！")
                        }
                    }
                });
            }

            /**
             *  结束编辑，并更新节点。
             */
            function accept2() {
                if (editIndex2 == undefined) {
                    alert("操作有误，亲！");
                    return;
                }
                var node = $('#version').datagrid('getSelected');

                if (editIndex2 != undefined) {
                    $('#version').datagrid('endEdit', editIndex2);
                    $('#version').datagrid('selectRow', editIndex2);
                    editIndex2 = undefined;
                }
                var data = {
                    "id": node.id,
                    "version": node.version,
                    "state": node.state
                };

                $.ajax({
                    type: "POST",
                    url: "/upVersion",
                    dataType: "json",
                    data: data,
                    success: function (result) {

                    }
                });
            }

            /**
             *  撤销编辑
             */
            function reject2() {
                $('#version').datagrid('rejectChanges');
                editIndex2 = undefined;
            }

            /**
             * 搜索框的精准查询。
             */
            function doSearch2() {
                var row = $('#dg').datagrid('getSelected');
                var AppId = row.appid;

                $('#version').datagrid('load', {
                    url: "/selVersion",
                    version: $('#versionSearch').val(),
                    appid: AppId
                });
            }

            /**
             *  定义右键菜单
             * @param e
             * @param index
             */
            function onRowContextMenu2(e, index) {
                e.preventDefault();
                $(this).datagrid('selectRow', index);
                $('#menu2').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

            /**
             *  创建对应版本的config
             * @param index
             * @param row
             * @constructor
             */
            function CreateConfig(index, row) {
                if (!confirm("你确定要创建新的config??")) {
                    return;
                }
                var node = $('#version').datagrid('getSelected');

                //这里不能用ajax这个是局部刷新不能用来跳转页面。
                // var data = {"configid": node.configid};
                // $.ajax({
                //     type: "POST",
                //     url: "/buildConfig",
                //     dataType: "json",
                //     async: false,
                //     data: data,
                //     success: function (result) {
                //
                //     }
                // });
                window.location.href = "/buildConfig?configid=" + node.configid;
            }
        </script>

    </div>
</div>
</body>
</html>
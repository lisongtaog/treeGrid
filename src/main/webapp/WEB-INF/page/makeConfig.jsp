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
    <script type="text/javascript" src="/js/jquery-easyui-1.5.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.5.5.1/jquery.easyui.min.js"></script>

    <script>
        var configid = ${configid};

        function choose(flag) {
            var ms = document.getElementsByName('app_use_ad_type_mode');
            for (var i = 0; i < ms.length; i++) {
                if (flag == 'all') {
                    ms[i].checked = true;
                } else if (flag == 'fx') {
                    ms[i].checked = !ms[i].checked;
                } else if (flag == 'no') {
                    ms[i].checked = false;
                }
            }
        }

        /**
         *  加载数据的公共的方法
         * @param param
         * @param success
         * @param error
         */
        function myloader(param, success, error) {
            $.ajax({
                url: '/selTreeGrid',
                data: {configid: configid},
                dataType: "json",
                success: function (data) {
                    success(data);
                }
            });
        }

        /**
         *  插入节点并返回该节点的id
         * @param data
         * @returns {*}
         */
        function insTreeGrid(data) {
            var maxId;
            $.ajax({
                type: "POST",
                url: "/insTreeGrid",
                async: false,
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                    $.ajax({
                        type: "POST",
                        url: "/selMaxId",
                        async: false,
                        cache: false,
                        success: function (result) {
                            maxId = result.id;
                        }
                    });
                }
            });
            return maxId;
        }

        /**
         *  switchs的标准生成。
         * @param number
         * @param flag
         */
        function switchs(number, flag) {

            var maxId;
            var maxId2;
            var maxId3;
            var trNum = number;

            for (var i = 0; i < trNum; i++) {
                var j = '[' + i + ']';
                var node = $('#tg').treegrid('getSelected');

                var data = {"configid": configid, "_parentId": node.id, "name": j};
                maxId = insTreeGrid(data);
                $('#tg').treegrid('append', {
                    parent: node.id,
                    data: [{
                        id: maxId,
                        name: j
                    }]
                })

                var data1 = {"configid": configid, "_parentId": maxId, "name": "name"};
                maxId2 = insTreeGrid(data1);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId2,
                        name: "name"
                    }]
                })

                if (flag == 1) {
                    var data2 = {"configid": configid, "_parentId": maxId, "name": "value"};
                    maxId3 = insTreeGrid(data2);
                    $('#tg').treegrid('append', {
                        parent: maxId,
                        data: [{
                            id: maxId3,
                            name: "value",
                            value: '<select onchange="insTF(this.value)"><option value="None">None</option><option value="False">False</option><option value="True">True</option></select>'
                        }]
                    });
                } else if (flag == 2) {
                    var data2 = {"configid": configid, "_parentId": maxId, "name": "use"};
                    maxId3 = insTreeGrid(data2);
                    $('#tg').treegrid('append', {
                        parent: maxId,
                        data: [{
                            id: maxId3,
                            name: "use",
                            value: '<select onchange="insTF(this.value)"><option value="None">None</option><option value="False">False</option><option value="True">True</option></select>'
                        }]
                    });
                }
            }
        }

        /**
         *  下拉true|false的插入。
         * @param TF
         */
        function insTF(TF) {
            var node = $('#tg').treegrid('getSelected');

            var data = {
                "id": node.id,
                "name": node.name,
                "value": TF
            };

            $.ajax({
                type: "POST",
                url: "/upTreeGrid",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                    // alert("更新成功！！！");
                }
            });
        }

        var adpArr = new Array();

        /**
         *  app_use_ad_type_mode的节点生成。
         */
        function app_use_ad_type_mode() {
            var c = $("input[type='checkbox']:checked"); //length    value
            var trNum = c.length;

            for (var i = 0; i < trNum; i++) {

                var maxId;
                var maxId2;
                var maxId3;
                var maxId4;
                var maxId5;

                var j = '[' + i + ']';
                var node = $('#tg').treegrid('getSelected');
                var data = {"configid": configid, "_parentId": node.id, "name": j};
                maxId = insTreeGrid(data);
                $('#tg').treegrid('append', {
                    parent: node.id,
                    data: [{
                        id: maxId,
                        name: j
                    }]
                })

                var ad_type;

                switch (c[i].value) {
                    case "facebook_full_screen":
                        ad_type = "adt_facebook_full";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_full_screen":
                        ad_type = "adt_admob_full";
                        adpArr[i] = ad_type;
                        break;
                    case "facebook_banner":
                        ad_type = "adt_facebook_banner";
                        adpArr[i] = ad_type;
                        break;
                    case "facebook_native2full_screen":
                        ad_type = "adt_facebook_banner";
                        adpArr[i] = ad_type;
                        break;
                    case "facebook_native2banner":
                        ad_type = "adt_facebook_native";
                        adpArr[i] = ad_type;
                        break;
                    case "facebook_native":
                        ad_type = "adt_facebook_native";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_native2full_screen":
                        ad_type = "adt_admob_native";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_native2banner":
                        ad_type = "adt_admob_native";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_native":
                        ad_type = "adt_admob_native";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_banner":
                        ad_type = "adt_admob_banner";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_banner2native":
                        ad_type = "adt_admob_banner";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_video":
                        ad_type = "adt_admob_video";
                        adpArr[i] = ad_type;
                        break;
                    case "vungle_video":
                        ad_type = "adt_vungle_video";
                        adpArr[i] = ad_type;
                        break;
                    case "unity_video":
                        ad_type = "adt_unity_video";
                        adpArr[i] = ad_type;
                        break;
                    case "admob_news":
                        ad_type = "adt_admob_news";
                        adpArr[i] = ad_type;
                        break;
                    case "facebook_news":
                        ad_type = "adt_facebook_news";
                        adpArr[i] = ad_type;
                        break;
                    case "recommend_full":
                        ad_type = "adt_recommend_full";
                        adpArr[i] = ad_type;
                        break;
                    case "recommend_native":
                        ad_type = "adt_recommend_native";
                        adpArr[i] = ad_type;
                        break;
                    case "upgrade":
                        ad_type = "adt_upgrade";
                        adpArr[i] = ad_type;
                        break;
                    case "discard":
                        ad_type = "adt_discard";
                        adpArr[i] = ad_type;
                        break;
                }

                var data1 = {"configid": configid, "_parentId": maxId, "name": "name", "value": c[i].value};
                maxId2 = insTreeGrid(data1);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId2,
                        name: "name",
                        value: c[i].value
                    }]
                })

                var data2 = {"configid": configid, "_parentId": maxId, "name": "ad_type", "value": ad_type};
                maxId3 = insTreeGrid(data2);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId3,
                        name: "ad_type",
                        value: ad_type
                    }]
                })

                var data3 = {"configid": configid, "_parentId": maxId, "name": "desc"};
                maxId4 = insTreeGrid(data3);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId4,
                        name: "desc"
                    }]
                })

                var data4 = {"configid": configid, "_parentId": maxId, "name": "ids[]"};
                maxId5 = insTreeGrid(data4);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId5,
                        name: "ids[]"
                    }]
                })
            }
        }

        /**
         *  positons的标准生成
         * @param number    生成的个数
         */
        function positions(number) {

            var trNum = number;

            for (var i = 0; i < trNum; i++) {
                var j = '[' + i + ']';
                var node = $('#tg').treegrid('getSelected');

                var maxId;
                var data = {"configid": configid, "_parentId": node.id, "name": j};
                maxId = insTreeGrid(data);
                $('#tg').treegrid('append', {
                    parent: node.id,
                    data: [{
                        id: maxId,
                        name: j
                    }]
                })

                var maxId2;
                var data1 = {"configid": configid, "_parentId": maxId, "name": "name"};
                maxId2 = insTreeGrid(data1);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId2,
                        name: "name"
                    }]
                })

                var maxId3;
                var data2 = {"configid": configid, "_parentId": maxId, "name": "type"};
                maxId3 = insTreeGrid(data2);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId3,
                        name: "type",
                        value: '<select onchange="include_use_ad_type_mode(this.value,' + maxId2 + ',' + maxId + ');"><option value="none">none</option><option value="apt_native">apt_native</option><option value="apt_full">apt_full</option><option value="apt_video">apt_video</option><option value="apt_banner">apt_banner</option><option value="apt_news">apt_news</option></select>'
                    }]
                })

                var maxId4;
                var data3 = {"configid": configid, "_parentId": maxId, "name": "ad_delay"};
                maxId4 = insTreeGrid(data3);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId4,
                        name: "ad_delay"
                    }]
                })

                var maxId5;
                var data4 = {"configid": configid, "_parentId": maxId, "name": "home_delay"};
                maxId5 = insTreeGrid(data4);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId5,
                        name: "home_delay"
                    }]
                })

                var maxId6;
                var data5 = {"configid": configid, "_parentId": maxId, "name": "t_silent"};
                maxId6 = insTreeGrid(data5);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId6,
                        name: "t_silent"
                    }]
                })

                var maxId7;
                var data6 = {"configid": configid, "_parentId": maxId, "name": "auto_seq[]"};
                maxId7 = insTreeGrid(data6);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId7,
                        name: "auto_seq"
                    }]
                })

                var maxId8;
                var data7 = {"configid": configid, "_parentId": maxId, "name": "switchs[]"};
                maxId8 = insTreeGrid(data7);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId8,
                        name: "switchs[]"
                    }]
                })

                var maxId9;
                var data8 = {"configid": configid, "_parentId": maxId, "name": "play_chance_control"};
                maxId9 = insTreeGrid(data8);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId9,
                        name: "play_chance_control"
                    }]
                })

                var maxId11;
                var data10 = {"configid": configid, "_parentId": maxId9, "name": "play_space"};
                maxId11 = insTreeGrid(data10);
                $('#tg').treegrid('append', {
                    parent: maxId9,
                    data: [{
                        id: maxId11,
                        name: "play_space"
                    }]
                })

                var maxId12;
                var data11 = {"configid": configid, "_parentId": maxId9, "name": "chances[]"};
                maxId12 = insTreeGrid(data11);
                $('#tg').treegrid('append', {
                    parent: maxId9,
                    data: [{
                        id: maxId12,
                        name: "chances[]"
                    }]
                })

                var maxId10;
                var data9 = {"configid": configid, "_parentId": maxId, "name": "include_use_ad_type_mode[]"};
                maxId10 = insTreeGrid(data9);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId10,
                        name: "include_use_ad_type_mode[]"
                    }]
                })
            }
        }

        /**
         *  include_use_ad_type_mode的生成
         * @param type
         * @param nameId
         * @param includeId
         */
        function include_use_ad_type_mode(type, nameId, includeId) {
            if (!confirm("谨慎操作！")) {
                return;
            }
            includeId = includeId + 11;
            var node = $('#tg').treegrid('getSelected');

            var data = {
                "id": nameId,
                "name": 'name',
                "value": type
            };

            $.ajax({
                type: "POST",
                url: "/upTreeGrid",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (result) {
                }
            });

            var data2 = {
                "id": node.id,
                "name": 'type',
                "value": type
            };

            $.ajax({
                type: "POST",
                url: "/upTreeGrid",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data2),
                success: function (result) {
                    $('#tg').treegrid('update', {
                        id: nameId,
                        row: {
                            name: 'name',
                            value: type
                        }
                    });
                }
            });

            /*
            *   截取子串的后半段，与现有数组对比。
            */
            var arr = type.split("_");
            var value = arr[1];
            var a = [];
            for (i = 0; i < adpArr.length; i++) {
                if (adpArr[i].indexOf(value) != -1) {
                    a.push(adpArr[i]);
                }
            }
            /*
            *   将a排序并去重。
            */
            a.sort();
            var res = [a[0]];
            for (var j = 0; j < a.length; j++) {
                if (a[j] !== res[res.length - 1]) {
                    res.push(a[j]);
                }
            }

            for (var k = 0; k < res.length; k++) {

                var j = '[' + k + ']';

                var data = {"configid": configid, "_parentId": includeId, "name": j};
                var maxId = insTreeGrid(data);
                $('#tg').treegrid('append', {
                    parent: includeId,
                    data: [{
                        id: maxId,
                        name: j
                    }]
                })

                var data1 = {"configid": configid, "_parentId": maxId, "name": "name", "value": res[k]};
                var maxId2 = insTreeGrid(data1);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId2,
                        name: 'name',
                        value: res[k]
                    }]
                })

                var data2 = {"configid": configid, "_parentId": maxId, "name": "weight"};
                var maxId3 = insTreeGrid(data2);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId3,
                        name: 'weight'
                    }]
                })

                var data3 = {"configid": configid, "_parentId": maxId, "name": "random_delay"};
                var maxId4 = insTreeGrid(data3);
                $('#tg').treegrid('append', {
                    parent: maxId,
                    data: [{
                        id: maxId4,
                        name: 'random_delay'
                    }]
                })

                var data4 = {"configid": configid, "_parentId": maxId4, "name": "before"};
                var maxId5 = insTreeGrid(data4);
                $('#tg').treegrid('append', {
                    parent: maxId4,
                    data: [{
                        id: maxId5,
                        name: 'before'
                    }]
                })

                var data5 = {"configid": configid, "_parentId": maxId4, "name": "enable"};
                var maxId6 = insTreeGrid(data5);
                $('#tg').treegrid('append', {
                    parent: maxId4,
                    data: [{
                        id: maxId6,
                        name: 'enable',
                        value: '<select onchange="insTF(this.value)"><option value="None">None</option><option value="False">False</option><option value="True">True</option></select>'
                    }]
                })

                var data6 = {"configid": configid, "_parentId": maxId4, "name": "from"};
                var maxId7 = insTreeGrid(data6);
                $('#tg').treegrid('append', {
                    parent: maxId4,
                    data: [{
                        id: maxId7,
                        name: 'from'
                    }]
                })

                var data7 = {"configid": configid, "_parentId": maxId4, "name": "to"};
                var maxId8 = insTreeGrid(data7);
                $('#tg').treegrid('append', {
                    parent: maxId4,
                    data: [{
                        id: maxId8,
                        name: 'to'
                    }]
                })


            }
        }

        /************************************************************************************************************/

    </script>
</head>

<body>
<div id="cc" class="easyui-layout" data-options="fit:true">

    <div data-options="region:'west',title:'First',split:true" style="width:264px;">

        <div id="app_use_ad_type_mode">
            <table border="" cellspacing="" cellpadding="">
                <tr>
                    <th style="text-align: center">app_use_ad_type_mode</th>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="facebook_full_screen"/>1、facebook_full_screen<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_full_screen"/>2、admob_full_screen<br/>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="facebook_banner"/>3、facebook_banner<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="facebook_native2full_screen"/>4、facebook_native2full_screen<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="facebook_native2banner"/>5、facebook_native2banner<br/>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="facebook_native"/>6、facebook_native<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_native2full_screen"/>7、admob_native2full_screen<br/>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="admob_native2banner"/>8、admob_native2banner<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_native"/>9、admob_native<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_banner"/>10、admob_banner<br/>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="admob_banner2native"/>11、admob_banner2native<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_video"/>12、admob_video<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="vungle_video"/>13、vungle_video<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="unity_video"/>14、unity_video<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="admob_news"/>15、admob_news<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="facebook_news"/>16、facebook_news<br/>
                        <input type="checkbox" name="app_use_ad_type_mode"
                               value="recommend_full"/>17、recommend_full<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="recommend_native"/>18、recommend_native<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="upgrade"/>19、upgrade<br/>
                        <input type="checkbox" name="app_use_ad_type_mode" value="discard"/>20、discard<br/>
                        <input type="button" value="全选" onclick="choose('all')"/>
                        <input type="button" value="反选" onclick="choose('fx')"/>
                        <input type="button" value="全否" onclick="choose('no')"/>
                        <input type="button" name="" id="" value="提 交" onclick="app_use_ad_type_mode()"/>
                    </td>
                </tr>
            </table>
        </div>
        <br>
        switchs[]:
        <select onchange="switchs(this.value,1)">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>
        <br><br>
        positions[]:
        <select onchange="positions(this.value)">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <br><br>
        chances[]:
        <select onchange="switchs(this.value,2)">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>

    </div>
    <%--*****************************************************************************************************************--%>
    <div data-options="region:'center',title:'Center'" style="width:320px;">
        <div class="easyui-panel" fit="true">
            <div class="easyui-layout" fit="true" title="Complex Panel Layout" iconCls="icon-reload" collapsible="true">

                <div region="south">
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">Edit</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">Cancel</a>
                    <a href="/app" class="easyui-linkbutton">Back</a>
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
                            url:'/selTreeGrid',
                            loader:myloader,
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

                        var editingId = undefined;

                        /**
                         *  edit编辑按钮
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
                         *  save保存按钮
                         */
                        function save() {
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
                                url: "/upTreeGrid",
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                success: function (result) {
                                    alert("更新成功！！！");
                                }
                            });
                        }

                        /**
                         * cancel取消编辑状态按钮
                         */
                        function cancel() {
                            if (editingId != undefined) {
                                $('#tg').treegrid('cancelEdit', editingId);
                                editingId = undefined;
                            }
                        }

                        /******************************************************************/


                        /**
                         * 右键菜单定义
                         * @param e
                         * @param row
                         */
                        function onContextMenu(e, row) {
                            e.preventDefault();
                            $(this).treegrid('select', row.id);
                            $('#mm').menu('show', {
                                left: e.pageX,
                                top: e.pageY
                            });
                        }

                        // 生成节点ID


                        /**
                         *  查询最大的id，并返回
                         * @returns {*}
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
                         *  添加节点
                         */
                        function append() {

                            if (editingId != null) {
                                $.messager.alert("提示信息", "请先保存");
                                return;
                            }

                            var node = $('#tg').treegrid('getSelected');
                            expand();
                            // alert(node.id);
                            var data1 = {"configid": configid, "_parentId": node.id};

                            $.ajax({
                                type: "POST",
                                url: "/insTreeGrid",
                                async: false,
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify(data1),
                                success: function (result) {
                                    // alert("good");
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

                        /**
                         *  删除节点方法
                         * @param id
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
                         *  移除节点
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
                         *  展开节点
                         */
                        function expand() {
                            var node = $('#tg').treegrid('getSelected');
                            if (node) {
                                $('#tg').treegrid('expand', node.id);
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
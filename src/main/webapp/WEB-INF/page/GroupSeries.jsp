<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AppConfig</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/bird.ico"/>
    <!--WebStorm只有相对路径，没有绝对路径。-->
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.5.1/themes/icon.css">
    <script type="text/javascript" src="js/jquery-easyui-1.5.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-easyui-1.5.5.1/jquery.easyui.min.js"></script>

    <script>
        /**
         * 单击gId&gName去查询campaignId及其adId
         * @param index
         */
        function onClickRow() {
            var row = $('#gId').datagrid('getSelected');
            var campaignId = row.campaignId;
            var adId = row.adId;

            // alert(adId);

            var datacampaignId = $.parseJSON(campaignId);
            $('#campaignId').datagrid('loadData', datacampaignId);

            var datafInterId = $.parseJSON(adId).fInterId;
            $('#fInterId').datagrid('loadData', datafInterId);

            var datafNativeId = $.parseJSON(adId).fNativeId;
            $('#fNativeId').datagrid('loadData', datafNativeId);

            var datafBannerId = $.parseJSON(adId).fBannerId;
            $('#fBannerId').datagrid('loadData', datafBannerId);

            var datagInterId = $.parseJSON(adId).gInterId;
            $('#gInterId').datagrid('loadData', datagInterId);

            var datagNativeId = $.parseJSON(adId).gNativeId;
            $('#gNativeId').datagrid('loadData', datagNativeId);

            var datagBannerId = $.parseJSON(adId).gBannerId;
            $('#gBannerId').datagrid('loadData', datagBannerId);
        }

    </script>
</head>

<body>
<div class="easyui-layout" fit="true">
    <%--**********************************************************************--%>
    <div data-options="region:'west',title:'gId&gName',split:true" style="width:20%;">
        <div class="easyui-layout" fit="true" title="Complex Panel Layout" iconCls="icon-reload" collapsible="true">

            <div region="center" border="false">
                <table id="gId" class="easyui-datagrid"
                       data-options="
                fit:true,
                rownumbers: true,
                collapsible: true,
				singleSelect: true,
				url: '/selgIdgName',
				method: 'get',
				onClickRow: onClickRow
         ">
                    <thead>
                    <tr>
                        <th data-options="field:'gId'">gId</th>
                        <th data-options="field:'gName'">gName</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div region="south">
                <a href="/app" class="easyui-linkbutton" style="float: right">app.jsp</a>
            </div>
        </div>

    </div>
    <!--**********************************************************************************-->
    <div data-options="region:'center',title:'campaignId'" style="width:15%">
        <table id="campaignId" class="easyui-datagrid">
            <thead>
            <tr>
                <th data-options="field:'id'">id</th>
                <th data-options="field:'name'">name</th>
            </tr>
            </thead>
        </table>
    </div>
    <!--**********************************************************************************-->
    <div data-options="region:'east',title:'adId',split:true" style="width:65%;">
        <div class="easyui-layout" fit="true">
            <div region="west" style="width:50%;">
                <div class="easyui-layout" fit="true">
                    <div region="west" style="width:33%;">
                        <table id="fInterId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">fInterId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div region="center" style="width:34%;">
                        <table id="fNativeId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">fNativeId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div region="east" style="width:33%;">
                        <table id="fBannerId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">fBannerId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <%---------------------------------------------------------------------%>
            <div region="east" style="width:50%;">
                <div class="easyui-layout" fit="true">
                    <div region="west" style="width:33%;">
                        <table id="gInterId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">gInterId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div region="center" style="width:34%;">
                        <table id="gNativeId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">gNativeId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div region="east" style="width:33%;">
                        <table id="gBannerId" class="easyui-datagrid">
                            <thead>
                            <tr>
                                <th data-options="field:'id'">gBannerId</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
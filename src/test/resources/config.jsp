<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>配置文件</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/bird.ico"/>

    <script type="text/javascript" src="/js/j.js"></script>
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
    <script>
        function choose0(flag) {
            var ms = document.getElementsByName('ad_type');
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

        function switchs(number) {
            $("#switchs").empty();
            var trNum = number;
            html = '<tr id="tr"><th>name</th><th>value</th></tr>';
            for (var i = 0; i < trNum; i++) {
                html += '<tr><th width="50%"><input type="text" name="switchsList[' + i + '].name" value="auto_ctrl" /></th><th><select name="switchsList[' + i + '].value"><option value="False">False</option><option value="True">True</option></select></th></tr>';
            }
            $('#switchs').append($(html));
        }

        function switchs1(number, row) {
            $("#switchs" + row).empty();
            var trNum = number;
            html = '<tr id="tr"><th>name' + row + '</th><th>value' + row + '</th></tr>';
            for (var i = 0; i < trNum; i++) {
                html += '<tr><th width="50%"><input type="text" name="switchsList2[' + i + '].name" id="" value="auto_ctrl" /></th><th><select name="switchsList2[' + i + '].value"><option value="0">False</option><option value="1">True</option></select></th></tr>';
            }
            $("#switchs" + row).append($(html));
        }

        function change(number, row) {
            $("#chancesList" + row).empty();
            var trNum = number;
            html = '<tr id="tr"><th>name' + row + '</th><th>use' + row + '</th></tr>';
            for (var i = 0; i < trNum; i++) {
                html += '<tr><th width="50%"><input type="text" name="" id="" value="auto_ctrl" /></th><th><select name="value"><option value="False">False</option><option value="True">True</option></select></th></tr>';
            }
            $("#chancesList" + row).append($(html));
        }

        function app_use_ad_type_mode() {
            var c = $("input[type='checkbox']:checked"); //length    value
            $("#use_ad_type_mode").empty();
            var trNum = c.length;
            html = '<tr><th width="25%">name</th><th width="25%">ad_type</th><th width="25%">desc</th><th width="25%">ids</th></tr>';
            for (var i = 0; i < trNum; i++) {
                switch (c[i].value) {
                    case "facebook_full_screen":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_full" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_full_screen":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_full" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "facebook_banner":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_banner" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "facebook_native2full_screen":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "facebook_native2banner":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "facebook_native":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_native2full_screen":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_native2banner":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_native":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_banner":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_banner" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_banner2native":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_banner" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_video":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_video" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "vungle_video":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_vungle_video" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "unity_video":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_unity_video" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "admob_news":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_admob_news" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "facebook_news":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_facebook_news" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "recommend_full":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_recommend_full" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "recommend_native":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_recommend_native" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "upgrade":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_upgrade" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                    case "discard":
                        html += '<tr><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].name" id="" value="adt_discard" class="ad_type"/></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].ad_type" id="" value="' + c[i].value + '" /></td><td align="middle"><input type="text" name="use_ad_type_modeList[' + i + '].desc" id="" value="" /></td><td align="middle"><select name="use_ad_type_modeList[' + i + '].ids"><option value=""></option></select></td></tr>';
                        break;
                }
                //html += '<tr><td align="middle"><input type="text" name="" id="" value="" /></td><td align="middle">' + c[i].value + '</td><td align="middle"><input type="text" name="" id="" value="" /></td><td align="middle"><select name=""><option value=""></option></select></td></tr>';
            }
            $("#use_ad_type_mode").append($(html));
        }

        function positionsList(number) {
            makeSwitchTable(number);
            makeChancesTable(number);
            makeIncludeTable(number);
            //include_use_ad_type(number);
            $("#positionsList").empty();
            var trNum = number;
            html = '<tr><th>name</th><th>type</th><th>ad_delay</th><th>home_delay</th><th>t_silent</th><th>auto_seq</th><th>switchs</th><th>play_chance_control</th><th>include_use_ad_type_mode</th></tr>';
            for (var i = 1; i <= trNum; i++) {
                var j = i - 1;
                html += '<tr><td><input type="text" name="positionsList[' + j + '].name" id="" value="" /></td><td><select name="positionsList[' + j + '].type" onchange="include_use_ad_type_mode(this.value,this,' + i + ');"><option value="none">none</option><option value="apt_native">apt_native</option><option value="apt_full">apt_full</option><option value="apt_video">apt_video</option><option value="apt_banner">apt_banner</option><option value="apt_news">apt_news</option></select></td></td><td><input type="text" name="positionsList[' + j + '].ad_delay" id="" value="" /></td><td><input type="text" name="positionsList[' + j + '].home_delay" id="" value="" /></td><td><input type="text" name="positionsList[' + j + '].t_silent" id="" value="" /></td><td></td><td><select name="positionsList[' + j + '].switchs" id="selectSwitch" onchange="switchs1(this.value,' + i + ');"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option></select></td><td width="320px">play_space:<input type="text" name="" id="" value="" /><select name="selectChange" onchange="change(this.value,' + i + ');"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option></select></td><td></td><tr>';
            }
            $("#positionsList").append($(html));
        }

        function makeSwitchTable(num) {
            $("#switchs1Div").empty();
            var html = '';
            for (var i = 1; i <= num; i++) {
                html += '<table id="switchs' + i + '" border="" cellspacing="" cellpadding="" width="50%"><tr id="tr"><th width="50%">name[' + i + ']</th><th width="50%">value[' + i + ']</th></tr></table><hr/>';
            }
            $("#switchs1Div").append(html);
        }

        function makeChancesTable(num) {
            $("#chancesDiv").empty();
            var html = '';
            for (var i = 1; i <= num; i++) {
                html += '<table id="chancesList' + i + '" border="" cellspacing="" cellpadding="" width="50%"><tr><th width="50%">name[' + i + ']</th><th width="50%">use[' + i + ']</th></tr></table><hr/>';
            }
            $("#chancesDiv").append(html);
        }

        function makeIncludeTable(num) {
            $("#includeDiv0").empty();
            var html = '';
            for (var i = 1; i <= num; i++) {
                html += '<div id="includeDiv' + i + '"><table border="1px" cellspacing="0" cellpadding="3px"><tr>	<th>name</th><th>weight</th><th colspan="4">random_delay</th></tr><tr><td>name:<input type="text" name="" id="" value="" /></td><td>weight:<input type="text" name="" id="" value="" size="15px" /></td><td>before:<input type="text" name="" id="" value="" size="15px" /></td><td>enable:<select name="">	<option value="0">False</option><option value="1">True</option>	</select></td><td>from:<input type="text" name="" id="" value="" size="15px" /></td><td>to:<input type="text" name="" id="" value="" size="15px" /></td></tr></table></div><hr color="blue" size="3px" />';
            }
            $("#includeDiv0").append(html);
        }

        function include_use_ad_type_mode(val, td, row) {
            var arr = val.split("_");
            var value = arr[1];
            $(td).parent().prev().children().val(val);
            //alert(typeof td);
            var a = [];
            var d = $("input[class='ad_type']"); //length    value
            for (i = 0; i < d.length; i++) {
                if (d[i].value.indexOf(value) != -1) {
                    a.push(d[i].value);
                    //						alert(d[i].value);
                    //						alert(typeof d[i].value);
                }
            }
            //				alert(a.length);
            a.sort();
            var res = [a[0]];
            for (var j = 0; j < a.length; j++) {
                if (a[j] !== res[res.length - 1]) {
                    res.push(a[j]);
                }
            }
            //				for (var k = 0; k < res.length; k++) {
            //					alert(res[k]);
            //				}
            $("#includeDiv" + row).empty();
            var html = '';
            for (var k = 0; k < res.length; k++) {
                html += '<table border="1px" cellspacing="0" cellpadding="3px"><tr><th>name' + row + '</th><th>weight</th><th colspan="4">random_delay</th></tr><tr><td>name:<input type="text" name="" id="" value="' + res[k] + '" /></td><td>weight:<input type="text" name="" id="" value="" size="15px"/></td><td>before:<input type="text" name="" id="" value="" size="15px"/></td><td>enable:<select name=""><option value="0">False</option><option value="1">True</option></select></td><td>from:<input type="text" name="" id="" value="" size="15px"/></td><td>to:<input type="text" name="" id="" value="" size="15px"/></td></tr></table><br/>';
            }
            $("#includeDiv" + row).append(html);
        }
    </script>

</head>

<body>
<div id="app_use_ad_type_mode">
    <table border="" cellspacing="" cellpadding="">
        <tr>
            <th>app_use_ad_type_mode</th>
        </tr>
        <tr>
            <td>
                <input type="checkbox" name="app_use_ad_type_mode"
                       value="facebook_full_screen"/>1、facebook_full_screen<br/>
                <input type="checkbox" name="app_use_ad_type_mode" value="admob_full_screen"/>2、admob_full_screen<br/>
                <input type="checkbox" name="app_use_ad_type_mode" value="facebook_banner"/>3、facebook_banner<br/>
                <input type="checkbox" name="app_use_ad_type_mode" value="facebook_native2full_screen"/>4、facebook_native2full_screen<br/>
                <input type="checkbox" name="app_use_ad_type_mode" value="facebook_native2banner"/>5、facebook_native2banner<br/>
                <input type="checkbox" name="app_use_ad_type_mode" value="facebook_native"/>6、facebook_native<br/>
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
                <input type="checkbox" name="app_use_ad_type_mode" value="recommend_full"/>17、recommend_full<br/>
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

    <hr/>
    <table border="1px" cellspacing="0" cellpadding="1px">
        <tr>
            <td>app_id:</td>
            <td><input type="text" name="app_id" id="app_id" value=""/></td>
        </tr>
        <tr>
            <td>latest_version_code:</td>
            <td></td>
        </tr>
        <tr>
            <td>discard_version_code[]:</td>
            <td></td>
        </tr>
        <tr>
            <td>for_app_version_code[]:</td>
            <td></td>
        </tr>
        <tr>
            <td>from_series:</td>
            <td></td>
        </tr>
    </table>
</div>
<hr size="5px" color="black"/>
<!--*********************************************************************************************-->
<form action="/configBuild" method="post">

    <h2 align="middle">configs</h2> user_class:&nbsp;
    <select name="user_class">
        <option value="common">common</option>
        <option value="newer">newer</option>
        <option value="normal">normal</option>
        <option value="older">older</option>
        <option value="fans">fans</option>
    </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;switchs:
    <select onchange="switchs(this.value)">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    auto_load:&nbsp;<input type="text" name="auto_load"/>
    <hr/>
    <table id="switchs" border="" cellspacing="" cellpadding="" width="50%">
        <tr id="tr">
            <th width="50%">name</th>
            <th width="50%">value</th>
        </tr>
    </table>

    <h3 style="display: inline-block;">use_ad_type_mode:</h3>
    <table id="use_ad_type_mode" border="" cellspacing="" cellpadding="" width="100%">
        <tr>
            <th width="25%">name</th>
            <th width="25%">ad_type</th>
            <th width="25%">desc</th>
            <th width="25%">ids</th>
        </tr>
    </table>

    <h3 style="display: inline-block;">positions:</h3>
    <select name="number1" onchange="positionsList(this.value)">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <table id="positionsList" border="1px" cellspacing="0" cellpadding="4" width="2000px">
        <tr>
            <th>name</th>
            <th>type</th>
            <th>ad_delay</th>
            <th>home_delay</th>
            <th>t_silent</th>
            <th>auto_seq</th>
            <th>switchs</th>
            <th width="320px">play_chance_control</th>
            <th>include_use_ad_type_mode</th>
        </tr>
    </table>
    <hr color="blue" size="3px"/>
    <div id="switchs1Div">


    </div>
    <hr color="blue" size="3px"/>
    <div id="chancesDiv">

    </div>
    <hr color="blue" size="3px"/>
    <div id="includeDiv0">


    </div>

    <br/>
    <br/>
    <br/>
    <br/>
    <button type="submit">提 交</button>
</form>

</body>
</html>
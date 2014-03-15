<!--
 ____________________________________________________________
|                                                            |
|    DESIGN + Pat Heard { http://fullahead.org }             |
|      DATE + 2006.09.12                                     |
| COPYRIGHT + Free use if this notice is kept in place.      |
|____________________________________________________________|

-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<#include "/lib/header.ftl">

    <title>当前活动</title>

    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8"/>
    <meta name="author" content="fullahead.org"/>
    <meta name="keywords" content="XHTML, CSS, template, FullAhead"/>
    <meta name="description" content="A valid, XHTML 1.0 template"/>
    <meta name="robots" content="index, follow, noarchive"/>
    <meta name="googlebot" content="noarchive"/>

    <link rel="stylesheet" type="text/css" href="/css/action/html.css" media="screen, projection, tv "/>
    <link rel="stylesheet" type="text/css" href="/css/action/layout.css" media="screen, projection, tv"/>
    <link rel="stylesheet" type="text/css" href="/css/action/print.css" media="print"/>

    <!-- Conditional comment to apply opacity fix for IE #content background.
         Invalid CSS, but can be removed without harming design -->
    <!--[if gt IE 5]>
    <link rel="stylesheet" type="text/css" href="/css/action/ie.css" media="screen, projection, tv "/>
    <![endif]-->
<#include "/lib/css_lib.ftl">


</head>


<body>
<#include "/lib/js_lib.ftl">
<!-- #wrapper: centers the content and sets the width -->
<div id="wrapper">

    <!-- #content: applies the white, dropshadow background -->
    <div id="content">

        <!-- #header: holds site title and subtitle -->
        <div id="header">
            <h1><span class="big darkBrown">当前活动</span></h1>

            <h2><span class="highlight">欢迎你的参与</span></h2>
        </div>


        <!-- #menu: topbar menu of the site.  Use the helper classes .two, .three, .four and .five to set
                    the widths for 2, 3, 4 and 5 item menus. -->
        <ul id="menu" class="four">
            <li><a href="/action" title="An intro to Simple Life" class="here"><span class="big">当前活动</span></a></li>
            <li><a href="/action/history" title="See the tags in action"><span class="big">历史活动</span></a></li>
        </ul>

        <!-- #page: holds all page content, as well as footer -->
        <div id="page">
            <table id="history-table">
                <thead>
                <tr>
                    <th>活动名称</th>
                    <th>活动时间</th>
                    <th>活动场地</th>
                    <th>活动结束时间</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                    <th>活动描述</th>
                    <th>参加</th>
                </tr>
                </thead>
                <tbody>
                <#list doing_list as doing>
                <tr>
                    <td>${doing.doing_name}</td>
                    <td>${doing.start_time}</td>
                    <td>${doing.address}</td>
                    <td>${doing.end_time}</td>
                    <td>${doing.waiter.user.name}</td>
                    <td>${doing.create_time}</td>
                    <td>${doing.doing_desc!}</td>
                    <td>
                        <a class="join" ask="/action/isJoin/${doing.id}" href="/action/join/${doing.id}">参与</a>
                    </td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="application/javascript">
    $(function () {
        $("#history-table").dataTable();
        $.get($(".join").attr("ask"), function (result) {
            if (result.success) {
                $(".join").replaceWith("你已参加");
            }
        }, "json");
        $(document).on("click", ".join", function () {
            var that = this;
            $.get(that.href, function (result) {
                $.Zebra_Dialog(result.reason, {
                    "type": "information",
                    "title": result.success ? "成功了" : "(⊙o⊙)哦失败了"
                });
                $(that).replaceWith("你已参加");
            }, "json");
            return false;
        });
    })
    ;
</script>
</body>
</html>
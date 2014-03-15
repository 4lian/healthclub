<html>
<head>
    <title>经理页面</title>
<#include "/lib/js_lib.ftl">
<#include "/lib/css_lib.ftl">
<#include "/lib/header.ftl">
    <link rel="stylesheet" href="/css/manager/main.css"/>
</head>
<body style="background-image:url(/images/manager/body.jpg)">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header col-md-offset-2 col-md-2">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/index">Splosh</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse col-md-offset-4" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active">
                <a href="#/manager/user">用户情况</a>
            </li>
            <li>
                <a href="#/manager/club">俱乐部使用</a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
<div id="back-main">
    <#include "user.ftl">
</div>
</body>
</html>
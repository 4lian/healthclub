<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>服务员管理资料</title>
<#include "/lib/js_lib.ftl">
<#include "/lib/header.ftl">
<#include "/lib/css_lib.ftl">
    <link rel="stylesheet" href="/css/waiter/main.css"/>
</head>
<body>
<div class="page">
    <div class="admin-panel clearfix">
        <div class="slidebar">
            <div class="logo">
                <a href="/index"></a>
            </div>
            <ul>
                <li><a href="#/waiter/card">会员卡</a></li>
                <li><a href="#/waiter/bankCard">银行卡</a></li>
                <li><a href="#/waiter/userList">用户列表</a></li>
                <li><a href="#/waiter/payLog">付费记录</a></li>
                <li><a href="#/waiter/action">活动</a></li>
            </ul>
        </div>
        <div class="main">
            <ul class="topbar clearfix">
                <li><a href="#">q</a></li>
                <li><a href="#">p</a></li>
                <li><a href="#">o</a></li>
                <li><a href="#">f</a></li>
                <li><a href="#">n</a></li>
            </ul>
            <div class="mainContent clearfix" id="back-main">
            </div>
        </div>
    </div>
</body>
</html>
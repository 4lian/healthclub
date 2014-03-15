<link rel="stylesheet" href="/css/client/profile/bankCard/style.css">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link href="/css/client/profile/bankCard/bdsstyle.css" rel="stylesheet" type="text/css"></head>
<table id="univer-table">
    <thead>
    <tr>
        <th>银行卡</th>
        <th>用户</th>
    </tr>
    </thead>
    <tbody>
    <#list bankCards as card>
    <tr>
        <td>${card.id}</td>
        <td><a href="#/waiter/profile/${card.user_id}">${card.user_id}</a></td>
    </tr>
    </#list>
    </tbody>
</table>

<script type="application/javascript">
    $(function () {
        $("#univer-table").dataTable();
        $(document).on("submit", "#bankCard-form", function () {
            var that = this;
            $.post(that.action, $(that).serialize());
            return false;
        })
    })
</script>
<link rel="stylesheet" href="/css/client/profile/bankCard/style.css">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link href="/css/client/profile/bankCard/bdsstyle.css" rel="stylesheet" type="text/css"></head>
<table id="univer-table">
    <thead>
    <tr>
        <th>银行卡</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody>
    <#list bankCards as card>
    <tr>
        <td>
        ${card.id}
        </td>
        <td>
            <a href="#/profile/doDeleteCard/${card.id}">删除银行卡</a>
        </td>
    </tr>
    </#list>
    </tbody>
</table>
<div id="bankCard-content">
    <form action="/profile/doAddCard" class="bankCard" method="post" id="bankCard-form">
        <fieldset class="bankCard-inner">
            <p class="bankCard-input">
                <input type="text" disabled="disabled" value="添加绑定">
            </p>

            <p class="bankCard-input">
                <input name="cardId" placeholder="请输入你的银行卡号"></textarea>
            </p>

            <p class="bankCard-submit">
                <input type="submit" value="Send">
            </p>
        </fieldset>
    </form>
</div>

<script type="application/javascript">
    $(function () {
        $("#univer-table").dataTable();
        $(document).on("submit","#bankCard-form",function(){
            var that = this;
            $.post(that.action,$(that).serialize());
            return false;
        })
    })
</script>
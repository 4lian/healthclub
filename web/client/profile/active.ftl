<link rel="stylesheet" href="/css/client/profile/active/active.css"/>
<link rel="stylesheet" href="/css/client/profile/active/style.css">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link href="/css/client/profile/active/bdsstyle.css" rel="stylesheet" type="text/css"></head>
<label id="active-main">
<#if !isActive>
    你还没有<a href="#" class="active">激活</a>
<#else>
    你已激活
</#if>

</label>
<div id="active-content" style="display: none">
    <form action="/profile/doActive" class="active" method="post" id="active-form">
        <fieldset class="active-inner">
            <p class="active-input">
                <label for="select" class="select">
                    <select name="id_type" id="select">
                        <option value="private" <#if idType>selected="selected"</#if>>私人卡</option>
                        <option value="family" <#if !idType>selected="selected"</#if>>家庭卡</option>
                    </select>
                </label>
            </p>

            <p class="active-input">
            <#if cardList.isEmpty()>
                <input type="text" name="card_id" placeholder="你还没有绑定任何卡"/>
            <#else>
                <label for="select" class="select">
                    <select name="bank_card" id="select">
                        <#list cardList as card>
                            <option value="${card.id}" selected="">${card.id}</option>
                        </#list>
                    </select>
                </label>
            </#if>
            </p>

            <p class="active-input">
                <textarea name="message" placeholder="备注"></textarea>
            </p>

            <p class="active-submit">
                <input type="submit" value="Send Message">
            </p>
        </fieldset>
    </form>
</div>
<script type="application/javascript">
    $(function () {
        $(document).on("click", "#active-main>a", function () {
            $(this).parent().hide();
            $("#active-content").show();
            return false;
        });

        $(document).on("submit", "#active-form", function () {
            var that = this;
            $.post(that.action, $(that).serialize(), function (result) {
                $.Zebra_Dialog("恭喜你，已经激活了", {
                    "type": "information",
                    "title": "成功了"
                });
                $("#active-main").html("你已经激活");
            }, "json")
            return false;
        })
    })
</script>
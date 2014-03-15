<div style="width:500px;margin: 0 auto" id="status-top">
    <form method="post" action="/profile/pay" class="form-horizontal" id="profile-form">
        <div class="form-item">
            <label for="user_status">用户状态：</label>

            <div class="form-field">
                <input disabled type="text" class="form-text" id="user_status" name="user_status"
                       value="${user_status}"></div>
        </div>
        <div class="form-item">
            <label>用户类型：</label>

            <div class="form-field form-id-num-wrap">
                <select disabled name="id_type" size="1" id="id_type" class="inline-ele">
                    <option value="private" <#if idType>selected="selected"</#if>>私人卡</option>
                    <option value="family" <#if !idType>selected="selected"</#if>>家庭卡</option>
                </select>
            </div>
        </div>
        <div class="form-item">
            <label>选择银行卡：</label>

            <div class="form-field form-id-num-wrap">
            <#if cardList.isEmpty()>
                <input type="text" name="card_id" placeholder="你还没有绑定任何卡"/>
            <#else>
                <select name="card_id" id="select">
                    <#list cardList as card>
                        <option value="${card.id}">${card.id}</option>
                    </#list>
                </select>
            </#if>
            </div>
        </div>
        <div class="form-item">
            <label>备注：</label>

            <div class="form-field"><textarea id="message" name="message"></textarea>

                <p class="form-des">说明注释文字可以放在这里啊</p></div>
        </div>

        <div class="form-action">
            <input type="submit" class="inputbtn lightgreybtn" value="付费">
        </div>
    </form>
</div>
<div style="width:500px;margin: 0 auto" id="status-bottom">
    <form method="post" action="/profile/logout" class="form-horizontal">
        <div class="form-action">
            <input type="submit" class="inputbtn lightgreybtn" value="通知俱乐部注销">
        </div>
    </form>
</div>

<script type="application/javascript">
    $(function () {
        $(document).on("submit", "#profile-form", function () {
            var that = this;
            $.post(that.action, $(that).serialize(), function (result) {
                $("#status-top").html(result);
            });
            return false;
        });
    })
</script>
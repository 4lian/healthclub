<div style="width:500px;margin: 0 auto" id="profile-top">
    <form method="post" action="/waiter/saveProfile" class="form-horizontal" id="login_form">
        <input type="hidden" name="user_id" value="${user.id}"/>
        <div class="form-item">
            <label for="username">用户名：</label>

            <div class="form-field">
                <input disabled type="text" class="form-text" id="username" name="username" value="${user.name}">
            </div>
        </div>
        <div class="form-item">
            <label for="full_name">全名：</label>

            <div class="form-field"><input disabled type="text" class="form-text" id="full_name" name="full_name"
                                           value="${profile.full_name!}"></div>
        </div>
        <div class="form-item">
            <label for="email">邮箱：</label>

            <div class="form-field"><input disabled type="text" class="form-text" id="email" name="email"
                                           value="${user.email!}"></div>
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
            <label for="telephone">电话：</label>

            <div class="form-field"><input disabled type="text" class="form-text" id="telephone" name="telephone"
                                           value="${profile.telephone!}"></div>
        </div>
        <div class="form-item">
            <label for="mobile_phone">手机：</label>

            <div class="form-field"><input disabled type="text" class="form-text" id="mobile_phone" name="mobile_phone"
                                           value="${profile.mobile_phone!}"></div>
        </div>
        <div class="form-item">
            <label for="address">地址：</label>

            <div class="form-field"><input disabled type="text" class="form-text" id="address" name="address"
                                           value="${profile.address!}"></div>
        </div>
        <div class="form-item">
            <label for="brith">生日：</label>

            <div class="form-field"><input disabled type="date" class="form-text" id="brith" name="brith"
                                           value="${profile.brith!}"></div>
        </div>

        <div class="form-item">
            <label>性别：</label>

            <div class="form-field form-id-num-wrap">
                <select disabled name="gender" size="1" id="gender" class="inline-ele">
                    <option value="male" <#if profile.isMale()>selected="selected"</#if>>男</option>
                    <option value="female" <#if !profile.isMale()>selected="selected"</#if>>女</option>
                </select>
            </div>
        </div>
        <div class="form-action">
            <input type="button" class="inputbtn lightgreybtn" value="编辑" id="profile-edit">
            <input disabled type="submit" class="inputbtn lightgreybtn" value="保存">
        </div>

        <div>

    </form>
</div>
<script type="application/javascript">
    $(function () {
        $(document).on("click", "#profile-edit", function () {
            this.remove();
            $("[disabled]").removeAttr("disabled");
        });

        $(document).on("submit","#login_form",function(){
            var that = this;
            $.post(that.action,$(that).serialize(),function(result){
                $("#profile-top").replaceWith(result);
            })
            return false;
        });
    });
</script>
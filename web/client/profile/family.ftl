<div style="width:500px;margin: 0 auto" id="family-top">
    <form method="post" action="/profile/saveFamily" class="form-horizontal" id="profile-form">
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
            <label for="child_count">你的孩子个数：</label>

            <div class="form-field">
                <input disabled type="text" class="form-text" id="child_count" name="child_count"
                       value="${child_count}">
            </div>
        </div>
        <div class="form-action">
            <input type="button" class="inputbtn lightgreybtn" value="编辑" id="profile-edit">
            <input disabled type="submit" class="inputbtn lightgreybtn" value="保存">
        </div>
    </form>
</div>

<script type="application/javascript">
    $(function () {
        $(document).on("click", "#profile-edit", function () {
            this.remove();
            $("[disabled]").removeAttr("disabled");
            if ($("#id_type").val() == "private") {
                $("#child_count").attr("disabled", "disabled");
            }
        });

        $(document).on("submit", "#profile-form", function () {
            var that = this;
            $.post(that.action, $(that).serialize(), function (result) {
                $("#family-top").replaceWith(result);
            })
            return false;
        });

        $(document).on("change", "#id_type", function () {
            if ($("#id_type").val() == "private") {
                $("#child_count").attr("disabled", "disabled");
            }else{
                $("#child_count").removeAttr("disabled");
            }
        });
    })
</script>
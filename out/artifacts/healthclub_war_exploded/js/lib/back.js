/**
 * Created by shenshijun on 14-3-11.
 */
$(function () {
    var getContent = function (action, query_string) {
        action = action || 'dashboard';
        if (action[0] == "/") {
            //请求其他module的页面
            var url = action;
        } else {
            //请求本module的页面
            url = window.location.pathname.replace(/\/+$/, "") + '/' + action + "?" + query_string;
        }
        $.ajax({
            type: 'GET',
            url: url,
            success: function (response) {
                $('#back-main').html(response);
            }
        });
    };
    $(document).on("click", "a[href^=#]", function () {
        $("a").parent().removeClass("active");
        $(this).parent().addClass("active");
        var herf = this.href;
        var parts = herf.split("#")[1];
        if (parts == "" || $(this).attr("clear_back")) {
            return true;
        }
        parts = parts.split("?");
        var action = parts[0];
        var query = parts[1];
        getContent(action, query);
        return false;
    });

    $(document).on("click", "a[href^=#][role~=submit]", function () {
        var $form = $("#ajax-form");
        $.post($form.get(0).action, $form.serialize(), function (result) {
            $('#back-main').html(result);
        });
        return false;
    });
})

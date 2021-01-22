$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();

        var login = $("#user_email").val();

        var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达式
        if (!reg.test(login)) {
            $("#errorBox").show();
            $("#user_email").val("").focus();
        } else {
            $("#signup-form").submit();
        }

    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })
})
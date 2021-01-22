$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();
        $("#submitButton").attr("value", "Signing in...").attr("disabled", "true");

        var login = $("#user_login").val();
        var password = $("#user_password").val();

        var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达式
        if (!reg.test(login)) { //正则验证不通过，格式不对
            alert("邮箱格式不正确！");
        } else {
            alert("邮箱格式正确！");
        }

        // 这个下面是错误信息显示
        $("#errorBox").show();
        $("#user_password").val("").focus();
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
        // 下面这个可以用来更改这个错误提示框显示的内容
        $("#info").text("hello");
    })
})
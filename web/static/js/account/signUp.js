var usernameCheck = true;
var emailCheck = true;
var passwordCheck = true;
var confirmCheck = true;
var verifyCheck = true;

$.fn.drag = function(options) {
    var x, drag = this, isMove = false, defaults = {
    };
    var options = $.extend(defaults, options);
    var handler = drag.find('.handler');
    var drag_bg = drag.find('.drag_bg');
    var text = drag.find('.drag_text');
    var maxWidth = drag.width() - handler.width();  //能滑动的最大间距

    //鼠标按下时候的x轴的位置
    handler.mousedown(function(e) {
        isMove = true;
        x = e.pageX - parseInt(handler.css('left'), 10);
    });

    //鼠标指针在上下文移动时，移动距离大于0小于最大间距，滑块x轴位置等于鼠标移动距离
    $(document).mousemove(function(e) {
        var _x = e.pageX - x;// _x = e.pageX - (e.pageX - parseInt(handler.css('left'), 10)) = x
        if (isMove) {
            if (_x > 0 && _x <= maxWidth) {
                handler.css({'left': _x});
                drag_bg.css({'width': _x});
            } else if (_x > maxWidth) {  //鼠标指针移动距离达到最大时清空事件
                dragOk();
            }
        }
    }).mouseup(function(e) {
        isMove = false;
        var _x = e.pageX - x;
        if (_x < maxWidth) { //鼠标松开时，如果没有达到最大距离位置，滑块就返回初始位置
            handler.css({'left': 0});
            drag_bg.css({'width': 0});
        }
    });

    //清空事件
    function dragOk() {
        handler.removeClass('handler_bg').addClass('handler_ok_bg');
        text.removeClass('slidetounlock').text('Verification passed').css({'color':'#fff'});       //modify
        // drag.css({'color': '#fff !important'});

        handler.css({'left': maxWidth});                   // add
        drag_bg.css({'width': maxWidth});                  // add

        handler.unbind('mousedown');
        $(document).unbind('mousemove');
        $(document).unbind('mouseup');

        verifyCheck = false;



        if (usernameCheck) return;
        if (emailCheck) return;
        if (passwordCheck) return;
        if (confirmCheck) return;
        if (verifyCheck) return;

        console.log("usernameCheck: " + usernameCheck);
        console.log("emailCheck: " + emailCheck);
        console.log("passwordCheck: " + passwordCheck);
        console.log("confirmCheck: " + confirmCheck);
        console.log("verifyCheck: " + verifyCheck);

        $("#signup_button").removeAttr("disabled");
    }
};


$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();
        $("#errorBox").hide();

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "signUpForm",
            timeout: 2000,
            data: $('#signup-form').serialize(),
            beforeSend: function() {
                $("#signup_button").attr("value", "Creating...").attr("disabled", "true");
            },
            success: function (data) {
                var state = data["state"];

                if (state == "success") {
                    window.location.href = "main";
                }
                else {
                    $("#info").text("Error, please try again.");
                    $("#errorBox").show();
                    $("#signup_button").attr("value", "Create account").removeAttr("disabled");
                }
            },
            error : function() {
                $("#info").text("Error, please try again.");
                $("#errorBox").show();
                $("#signup_button").attr("value", "Create account").removeAttr("disabled");
            }
        });
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })

    $("#user_login").bind("blur", function () {
        var username = $(this).val();

        if (username == "") return;

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ajaxCheckUsername",
            timeout: 2000,
            data: {
                username: username
            },
            success: function (data) {
                var state = data['state'];

                $("#zlun-js-username-input-validation").removeClass("d-none");
                if (state == "available") {
                    $("#zlun-js-username-input-validation").addClass("success");
                    $("#zlun-js-sign-up-username").addClass("successed");
                    $("#zlun-js-username-input-validation").text(username + " is available");

                    usernameCheck = false;
                    if (usernameCheck) return;
                    if (emailCheck) return;
                    if (passwordCheck) return;
                    if (confirmCheck) return;
                    if (verifyCheck) return;

                    $("#signup_button").removeAttr("disabled");
                }
                else {
                    usernameCheck = true;
                    $("#signup_button").attr("disabled", "disabled");

                    $("#zlun-js-username-input-validation").addClass("error");
                    $("#zlun-js-sign-up-username").addClass("errored");
                    $("#zlun-js-username-input-validation").text(username + " is not available");
                }
            }
        });
    })

    $("#user_login").bind("input propertychange", function () {
        usernameCheck = true;
        $("#signup_button").attr("disabled", "disabled");

        $("#zlun-js-sign-up-username").removeClass("successed");
        $("#zlun-js-sign-up-username").removeClass("errored");
        $("#zlun-js-username-input-validation").addClass("d-none");
        $("#zlun-js-username-input-validation").removeClass("success");
        $("#zlun-js-username-input-validation").removeClass("error");
    })

    $("#user_email").bind("blur", function () {
        var email = $(this).val();

        if (email == "") return;

        var reg = /^[A-Za-zd0-9]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/; //正则表达式
        if (!reg.test(email)) {
            $("#zlun-js-email-input-validation").removeClass("d-none");
            $("#zlun-js-email-input-validation").addClass("error");
            $("#zlun-js-sign-up-email").addClass("errored");
            $("#zlun-js-email-input-validation").text(email + " is not a correct email address");

            emailCheck = true;
            $("#signup_button").attr("disabled", "disabled");
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ajaxCheckEmail",
            timeout: 2000,
            data: {
                email: email
            },
            success: function (data) {
                var state = data['state'];

                $("#zlun-js-email-input-validation").removeClass("d-none");
                if (state == "available") {
                    emailCheck = false;

                    $("#zlun-js-email-input-validation").addClass("success");
                    $("#zlun-js-sign-up-email").addClass("successed");
                    $("#zlun-js-email-input-validation").text(email + " is available");

                    if (usernameCheck) return;
                    if (emailCheck) return;
                    if (passwordCheck) return;
                    if (confirmCheck) return;
                    if (verifyCheck) return;

                    $("#signup_button").removeAttr("disabled");
                }
                else {
                    emailCheck = true;
                    $("#signup_button").attr("disabled", "disabled");

                    $("#zlun-js-email-input-validation").addClass("error");
                    $("#zlun-js-sign-up-email").addClass("errored");
                    $("#zlun-js-email-input-validation").text(email + " is not available");
                }
            }
        });
    })

    $("#user_email").bind("input propertychange", function () {
        emailCheck = true;
        $("#signup_button").attr("disabled", "ture");

        $("#zlun-js-sign-up-email").removeClass("successed");
        $("#zlun-js-sign-up-email").removeClass("errored");
        $("#zlun-js-email-input-validation").addClass("d-none");
        $("#zlun-js-email-input-validation").removeClass("success");
        $("#zlun-js-email-input-validation").removeClass("error");
    })

    var passwordFocused = false;
    $("#user_password").bind("blur", function () {
        if (passwordFocused) return;
        passwordFocused = true;

        var password = $(this).val();
        if (password.length < 8) {
            $("#zlun-js-sign-up-password").addClass("errored");
        }
        else if (password.length < 15) {
            var num = password.match(/[a-z]/g);
            var letter = password.match(/[0-9]/g);
            var countNum = !num ? 0 : num.length;
            var countLetter = !letter ? 0 : letter.length;

            if (countNum == 0 || countLetter == 0) {
                $("#zlun-js-sign-up-password").removeClass("successed");
                $("#zlun-js-sign-up-password").addClass("errored");
            }
            else {
                $("#user_confirm").removeAttr("disabled");
                $("#zlun-js-sign-up-password").addClass("successed");

                passwordCheck = false;
                if (usernameCheck) return;
                if (emailCheck) return;
                if (passwordCheck) return;
                if (confirmCheck) return;
                if (verifyCheck) return;

                $("#signup_button").removeAttr("disabled");
            }
        }
        else {
            $("#user_confirm").removeAttr("disabled");
            $("#zlun-js-sign-up-password").addClass("successed");

            passwordCheck = false;
            if (usernameCheck) return;
            if (emailCheck) return;
            if (passwordCheck) return;
            if (confirmCheck) return;
            if (verifyCheck) return;

            $("#signup_button").removeAttr("disabled");
        }
    })

    $("#user_password").bind("input propertychange", function () {
        if (!passwordFocused) return;

        var password = $(this).val();
        if (password.length < 8) {
            $("#user_confirm").val("");
            $("#user_confirm").attr("disabled", "true");

            $("#zlun-js-sign-up-password").removeClass("successed");
            $("#zlun-js-sign-up-password").addClass("errored");

            passwordCheck = true;
            $("#signup_button").attr("disabled", "disabled");
        }
        else if (password.length < 15) {
            var num = password.match(/[a-z]/g);
            var letter = password.match(/[0-9]/g);
            var countNum = !num ? 0 : num.length;
            var countLetter = !letter ? 0 : letter.length;

            if (countNum == 0 || countLetter == 0) {
                $("#user_confirm").val("");
                $("#user_confirm").attr("disabled", "true");

                $("#zlun-js-sign-up-password").removeClass("successed");
                $("#zlun-js-sign-up-password").addClass("errored");

                passwordCheck = true;
                $("#signup_button").attr("disabled", "disabled");
            }
            else {
                $("#user_confirm").removeAttr("disabled");

                $("#zlun-js-sign-up-password").removeClass("errored");
                $("#zlun-js-sign-up-password").addClass("successed");

                passwordCheck = false;
                if (usernameCheck) return;
                if (emailCheck) return;
                if (passwordCheck) return;
                if (confirmCheck) return;
                if (verifyCheck) return;

                $("#signup_button").removeAttr("disabled");
            }
        }
        else {
            $("#user_confirm").removeAttr("disabled");

            $("#zlun-js-sign-up-password").removeClass("errored");
            $("#zlun-js-sign-up-password").addClass("successed");

            passwordCheck = false;
            if (usernameCheck) return;
            if (emailCheck) return;
            if (passwordCheck) return;
            if (confirmCheck) return;
            if (verifyCheck) return;

            $("#signup_button").removeAttr("disabled");
        }
    })

    $("#user_confirm").bind("focus", function () {
        $("#zlun-js-sign-up-confirm").removeClass("successed");
        $("#zlun-js-sign-up-confirm").removeClass("errored");
    })

    $("#user_confirm").bind("blur", function () {
        var confirm = $(this).val();
        if (confirm == "") {
            $("#zlun-js-sign-up-confirm").removeClass("successed");
            $("#zlun-js-sign-up-confirm").addClass("errored");

            confirmCheck = true;
            $("#signup_button").attr("disabled", "disabled");
            return;
        }

        var password = $("#user_password").val();
        if (confirm == password) {
            $("#zlun-js-sign-up-confirm").removeClass("errored");
            $("#zlun-js-sign-up-confirm").addClass("successed");

            confirmCheck = false;

            if (usernameCheck) return;
            if (emailCheck) return;
            if (passwordCheck) return;
            if (confirmCheck) return;
            if (verifyCheck) return;

            $("#signup_button").removeAttr("disabled");
        }
        else {
            $("#zlun-js-sign-up-confirm").removeClass("successed");
            $("#zlun-js-sign-up-confirm").addClass("errored");

            confirmCheck = true;
            $("#signup_button").attr("disabled", "disabled");
        }
    })

    $('#drag').drag();
})
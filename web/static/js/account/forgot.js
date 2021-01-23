$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();

        var login = $("#user_email").val();

        var reg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达式
        if (!reg.test(login)) {
            $("#errorBox").show();
            $("#info").html("That address is not a <a href=''>verified primary email</a> or is not associated with a <a href=''>personal user account</a>. Organization <a href=''>billing emails</a> are only for notifications\n");
            $("#user_email").val("").focus();
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "forgotForm",
            timeout: 2000,
            data: $('#signup-form').serialize(),
            beforeSend: function() {
                $("#submitButton").attr("value", "Sending...").attr("disabled", "true");
            },
            success: function (date) {
                console.log("reset email sending success");

                var state = date["state"];
                if (state == "wrong") {
                    $("#info").text("Incorrect email");
                    $("#user_email").val("").focus();
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Send password reset email").removeAttr("disabled");
                }
                else {
                    window.location.href = "reset";
                }
            },
            error: function () {
                $("#info").text("Error, please try again.");
                $("#errorBox").show();
                $("#submitButton").attr("value", "Send password reset email").removeAttr("disabled");
            }
        })
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })
})
$(document).ready(function () {
    var boxState = $("#boxState").val();
    console.log(boxState);
    if (boxState == "show") {
        $("#noticeBox").show();
    }
    else {
        $("#noticeBox").hide();
    }

    $("#signup-form").on("submit", function (e) {
        e.preventDefault();
        $("#errorBox").hide();
        $("#noticeBox").hide();

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "signInForm",
            timeout: 2000,
            data: $('#signup-form').serialize(),
            beforeSend: function() {
                $("#submitButton").attr("value", "Signing in...").attr("disabled", "true");
            },
            success: function (data) {
                var state = data["state"];
                if (state == "correct") {
                    console.log("correct");

                    window.location.href = "main";
                }
                else if (state == "psdwrong") {
                    console.log("password wrong");

                    $("#info").text("Incorrect password.");
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Sign in").removeAttr("disabled");
                    $("#user_password").val("").focus();
                }
                else if (state == "namewrong") {
                    console.log("username or email wrong");

                    $("#info").text("Incorrect username or email.");
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Sign in").removeAttr("disabled");
                    $("#user_password").val("");
                    $("#user_login").val("").focus();
                }
            },
            error : function() {
                $("#info").text("Error, please try again.");
                $("#errorBox").show();
                $("#submitButton").attr("value", "Sign in").removeAttr("disabled");
            }
        });
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })
    $("#notice_button").on("click", function () {
        $("#noticeBox").hide();
    })
})
$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();

        var password = $("#user_password").val();
        var confirm = $("#user_confirm").val();

        if (password == confirm) {
            var username = $("#username").val();

            $.ajax({
                type: "POST",
                url: "resetForm",
                dataType: "json",
                timeout: 2000,
                data: {
                    username: username,
                    password: password
                },
                beforeSend: function() {
                    $("#submitButton").attr("value", "Changing...").attr("disabled", "true");
                },
                success: function (data) {
                    var state = data["state"];
                    if (state == "success") {
                        window.location.href = "signIn";
                    }
                    else {
                        $("#info").text("Error, please try again.");
                        $("#errorBox").show();
                        $("#submitButton").attr("value", "Change password").removeAttr("disabled");
                    }
                },
                error : function() {
                    $("#info").text("Error, please try again.");
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Change password").removeAttr("disabled");
                }
            });

        }
        else {
            $("#info").text("Password confirmation doesn't match the password.");
            $("#errorBox").show();
            $("#user_confirm").val("");
            $("#user_password").val("").focus();
        }

        var username = $("#username").val();
        console.log("resetjs: " + username);
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })
})
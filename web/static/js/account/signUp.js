$(document).ready(function () {
    $("#signup-form").on("submit", function (e) {
        e.preventDefault();
        $("#errorBox").hide();

        var email = $("#user_email").val();
        console.log(email);

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "signUpForm",
            timeout: 2000,
            data: $('#signup-form').serialize(),
            beforeSend: function() {
                $("#submitButton").attr("value", "Creating...").attr("disabled", "true");
            },
            success: function (data) {
                var state = data["state"];

                if (state == "success") {
                    window.location.href = "main";
                }
                else {
                    $("#info").text("Error, please try again.");
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Create account").removeAttr("disabled");
                }
            },
            error : function() {
                $("#info").text("Error, please try again.");
                $("#errorBox").show();
                $("#submitButton").attr("value", "Create account").removeAttr("disabled");
            }
        });
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })
})
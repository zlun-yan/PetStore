$(document).ready(function () {
    var boxHolder = $("#visible-zlun-box");
    var visibleBottom = window.scrollY + document.documentElement.clientHeight;
    var visibleTop = window.scrollY;
    var centerY = boxHolder.offset().top;

    if (centerY > visibleTop && centerY < visibleBottom) {
        $("#checkBar").removeClass("zlun-bottom-box");
    } else {
        $("#checkBar").addClass("zlun-bottom-box");
    }

    document.addEventListener('scroll', function () {
        var visibleBottom = window.scrollY + document.documentElement.clientHeight;
        var visibleTop = window.scrollY;
        var centerY = boxHolder.offset().top;

        if (centerY > visibleTop && centerY < visibleBottom) {
            $("#checkBar").removeClass("zlun-bottom-box");
        } else {
            $("#checkBar").addClass("zlun-bottom-box");
        }
    })

    var orderId = parseInt($("#orderId").val())
    $("#orderInfo_pay").on("click", function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "pay",
            timeout: 2000,
            data: {
                orderId: orderId
            },
            success: function() {
                $("#orderInfo_pay").attr("disabled", "disabled");
                $("#orderInfo_deliver").removeAttr("disabled");
                console.log("pay success");
            },
            error : function() {

            }
        });
    })
    $("#orderInfo_deliver").on("click", function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "deliver",
            timeout: 2000,
            data: {
                orderId: orderId
            },
            success: function(date) {
                var state = date['state'];
                if (state != "fail") {
                    $("#orderInfo_deliver").attr("disabled", "disabled");
                    console.log(state);
                }
            },
            error : function() {

            }
        });
    })
    $("#orderInfo_return").on("click", function () {
        window.location.href = "info?need=orders";
    })
})
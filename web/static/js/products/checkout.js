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

    var totItem = 0;
    var totPrice = 0;
    var ids = [];
    $(".zlun-checkout-num").each(function () {
        var id = this.id;
        id = id.split("_");
        id = id[1];

        var num = parseInt($(this).text());
        var tot = parseFloat($("#tot_" + id).text());

        ids.push(id);
        totItem += num;
        totPrice += tot;
    })

    ids.join(";");
    if (totItem > 1) {
        $("#order_num").text(totItem + " items");
    }
    else {
        $("#order_num").text(totItem + " item");
    }
    $("#order_price").text(totPrice);

    var default_addr = parseInt($("#default_addr").val());
    $(".zlun-js-address-box").on("click", function () {
        var id = this.id;
        id = id.split("_");
        id = id[1];
        $("#address_" + default_addr).addClass("zlun-hover-box");
        default_addr = id;
        $("#default_addr").val(default_addr);
        $(this).removeClass("zlun-hover-box");
    })

    $("#confirm").on("click", function () {

        // 还要选地址
        // var temp = $("<form action='doCheckout' method='post'></form>");
        // var param = $("<input type='hidden' name='ids' value='" + ids + "'>")
        // temp.append(param);
        // $("body").append(temp);
        // temp.submit();
        // temp.remove();
    })
})
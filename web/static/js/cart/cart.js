$(document).ready(function () {
    var empty = parseInt($("#zlun-js-cart-empty").val());  // 代表条目信息  购物车中有几个条目

    if (empty != 0) {
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

        var checked = 0;  // 选中的条目数量
        var subTot = 0;  // 选中商品的总价
        var itemNum = 0;  // 选中商品的数量
        $("input[type=checkbox]").each(function () {
            var temp = this.id;

            temp = temp.split("_");
            if (temp[0] == "check") {
                if ($(this).prop('checked')) {
                    var num = parseInt($("#num_" + temp[1]).val());
                    var tot = parseFloat($("#tot_" + temp[1]).text());
                    checked ++;
                    itemNum += num;
                    subTot += tot;
                }
            }
        })

        if (itemNum > 1) {
            $("#order_num").text(itemNum + " items");
        }
        else {
            $("#order_num").text(itemNum + " item");
        }

        $("#order_price").text(subTot);

        if (checked >= 1) {
            $("#checkout").removeAttr("disabled");
        }
        else {
            $("#checkout").attr("disabled", "true");
        }

        if (checked != 0 && checked == empty) {
            $("#all_select").prop("checked", true);
        }
        else {
            $("#all_select").prop("checked", false);
        }

        $("input[type=checkbox]").on("click", function (e) {
            var id = this.id;
            if (id == "all_select") {
                if ($(this).prop('checked')) {
                    $("input[type=checkbox]").prop("checked", true);

                    checked = 0;
                    subTot = 0;
                    itemNum = 0;
                    $("input[type=checkbox]").each(function () {
                        var temp = this.id;

                        temp = temp.split("_");
                        if (temp[0] == "check") {
                            var num = parseInt($("#num_" + temp[1]).val());
                            var tot = parseFloat($("#tot_" + temp[1]).text());
                            checked ++;
                            itemNum += num;
                            subTot += tot;

                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: "cartCheck",
                                timeout: 2000,
                                data: {
                                    id: temp[1],
                                    state: 1
                                },
                                error : function() {

                                }
                            });
                        }
                    })
                }
                else {
                    $("input[type=checkbox]").prop("checked", false);
                    checked = 0;
                    itemNum = 0;
                    subTot = 0;

                    $("input[type=checkbox]").each(function () {
                        var temp = this.id;

                        temp = temp.split("_");
                        if (temp[0] == "check") {
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: "cartCheck",
                                timeout: 2000,
                                data: {
                                    id: temp[1],
                                    state: 0
                                },
                                error : function() {

                                }
                            });
                        }
                    })
                }
            }
            else {
                id = id.split("_");
                var num = parseInt($("#num_" + id[1]).val());
                var tot = parseFloat($("#tot_" + id[1]).text());
                if ($(this).prop('checked')) {
                    checked ++;
                    itemNum += num;
                    subTot += tot;

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "cartCheck",
                        timeout: 2000,
                        data: {
                            id: id[1],
                            state: 1
                        },
                        error : function() {

                        }
                    });
                }
                else {
                    checked --;
                    itemNum -= num;
                    subTot -= tot;

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "cartCheck",
                        timeout: 2000,
                        data: {
                            id: id[1],
                            state: 0
                        },
                        error : function() {

                        }
                    });
                }

                if (checked != 0 && checked == empty) {
                    $("#all_select").prop("checked", true);
                }
                else {
                    $("#all_select").prop("checked", false);
                }
            }

            if (itemNum > 1) {
                $("#order_num").text(itemNum + " items");
            }
            else {
                $("#order_num").text(itemNum + " item");
            }

            $("#order_price").text(subTot);

            if (checked >= 1) {
                $("#checkout").removeAttr("disabled");
            }
            else {
                $("#checkout").attr("disabled", "true");
            }
        })

        $(".zlun-js-add-button").on("click", function () {
            var id = this.id;
            id = id.split("_");

            var numInput = $("#num_" + id[1]);
            var totSpan = $("#tot_" + id[1]);

            var price = parseFloat($("#price_" + id[1]).text());
            var num = parseInt(numInput.val());
            var maxNum = parseInt($("#maxNum_" + id[1]).text());
            num++;

            if (num == maxNum) {
                $(this).attr("disabled", "true");
            }
            if (num != 1) {
                $("#sub_" + id[1]).removeAttr("disabled");
            }

            numInput.val(num);
            totSpan.text(num * price);

            if ($("#check_" + id[1]).prop('checked')) {
                itemNum ++;
                subTot += price;

                if (itemNum > 1) {
                    $("#order_num").text(itemNum + " items");
                }
                else {
                    $("#order_num").text(itemNum + " item");
                }

                $("#order_price").text(subTot);
            }

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "emptyChange",
                timeout: 2000,
                data: {
                    id: id[1],
                    num: num
                },
                error : function() {

                }
            });
        })

        $(".zlun-js-sub-button").on("click", function () {
            var id = this.id;
            id = id.split("_");

            var numInput = $("#num_" + id[1]);
            var totSpan = $("#tot_" + id[1]);

            var price = parseFloat($("#price_" + id[1]).text());
            var num = parseInt(numInput.val());
            var maxNum = parseInt($("#maxNum_" + id[1]).text());
            num--;

            if (num == 1) {
                $(this).attr("disabled", "true");
            }
            if (num != maxNum) {
                $("#add_" + id[1]).removeAttr("disabled");
            }

            numInput.val(num);
            totSpan.text(num * price);

            if ($("#check_" + id[1]).prop('checked')) {
                itemNum --;
                subTot -= price;

                if (itemNum > 1) {
                    $("#order_num").text(itemNum + " items");
                }
                else {
                    $("#order_num").text(itemNum + " item");
                }

                $("#order_price").text(subTot);
            }

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "cartNumChange",
                timeout: 2000,
                data: {
                    id: id[1],
                    num: num
                },
                error : function() {

                }
            });
        })

        $("input[type=text]").bind("input propertychange", function () {
            var id = this.id;
            id = id.split("_");

            if (id[0] == "num") {
                var totSpan = $("#tot_" + id[1]);

                var price = parseFloat($("#price_" + id[1]).text());
                var num = parseInt($(this).val());
                var maxNum = parseInt($("#maxNum_" + id[1]).text());

                if (num >= maxNum) {
                    if (num > maxNum) {
                        num = maxNum;
                        $(this).val(num);
                    }

                    $("#add_" + id[1]).attr("disabled", "true");
                }
                else {
                    $("#add_" + id[1]).removeAttr("disabled");
                }
                if (num <= 1) {
                    if (num < 1) {
                        num = 1;
                        $(this).val(num);
                    }

                    $("#sub_" + id[1]).attr("disabled", "true");
                }
                else {
                    $("#sub_" + id[1]).removeAttr("disabled");
                }

                totSpan.text(num * price);

                if ($("#check_" + id[1]).prop('checked')) {
                    subTot = 0;
                    itemNum = 0;
                    $("input[type=checkbox]").each(function () {
                        var temp = this.id;

                        temp = temp.split("_");
                        if (temp[0] == "check") {
                            var num = parseInt($("#num_" + temp[1]).val());
                            var tot = parseFloat($("#tot_" + temp[1]).text());
                            itemNum += num;
                            subTot += tot;
                        }
                    })

                    if (itemNum > 1) {
                        $("#order_num").text(itemNum + " items");
                    }
                    else {
                        $("#order_num").text(itemNum + " item");
                    }

                    $("#order_price").text(subTot);
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "cartNumChange",
                    timeout: 2000,
                    data: {
                        id: id[1],
                        num: num
                    },
                    error : function() {

                    }
                });
            }
        })

        $("#checkout").on("click", function (e) {
            var cartIds = [];

            $("input[type=checkbox]").each(function () {
                var temp = this.id;

                temp = temp.split("_");
                if (temp[0] == "check") {
                    if ($(this).prop("checked")) {
                        cartIds.push(temp[1]);
                    }
                }
            })

            var ids = cartIds.join(";");
            var temp = $("<form action='checkout' method='post'></form>");
            var param = $("<input type='hidden' name='ids' value='" + ids + "'>")
            temp.append(param);
            $("body").append(temp);
            temp.submit();
            temp.remove();
        })

        $(".zlun-cart-delete").on("click", function () {
            var id = this.id;
            id = id.split("_");
            id = id[1];

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "deleteCart",
                timeout: 2000,
                data: {
                    cartId: id
                },
                success: function () {
                    if ($("#check_" + id).prop('checked')) {
                        subTot -= parseFloat($("#tot_" + id).text());
                        itemNum -= parseInt($("#num_" + id).val());
                        checked--;
                    }

                    $("#item_" + id).remove();
                    empty--;
                    if (empty == 0) {
                        $("#zlun-js-cart-body").empty();
                        $("#zlun-js-cart-body").append($('<div m-3 id="zlun-js-cart-body">\n' +
                            '            <div class="my-3">\n' +
                            '                <div class="box-shadow-medium p-3">\n' +
                            '                    <strong>Cart</strong>\n' +
                            '                </div>\n' +
                            '\n' +
                            '                <div class="blankslate">\n' +
                            '                    <img src="https://ghicons.github.com/assets/images/blue/png/Pull%20request.png" alt="" class="mb-3" />\n' +
                            '                    <h3 class="mb-1">Your cart don’t seem to have any items.</h3>\n' +
                            '                    <p>Come and find a partner to take home.</p>\n' +
                            '                    <button class="btn btn-primary my-3" type="button" id="zlun-js-cart-explore">Explore</button>\n' +
                            '                </div>\n' +
                            '            </div>\n' +
                            '        </div>'));

                        $("#zlun-js-cart-explore").on("click", function () {
                            console.log("cart-explore");
                            window.location.href = "explore?need=dog";
                        })
                    }
                    else {
                        if (itemNum > 1) {
                            $("#order_num").text(itemNum + " items");
                        }
                        else {
                            $("#order_num").text(itemNum + " item");
                        }

                        $("#order_price").text(subTot);

                        if (checked >= 1) {
                            $("#checkout").removeAttr("disabled");
                        }
                        else {
                            $("#checkout").attr("disabled", "true");
                        }

                        if (checked != 0 && checked == empty) {
                            $("#all_select").prop("checked", true);
                        }
                        else {
                            $("#all_select").prop("checked", false);
                        }
                    }
                }
            });
        })
    }
    else {
        $("#zlun-js-cart-explore").on("click", function () {
            console.log("cart-explore");
            window.location.href = "explore?need=dog";
        })
    }
})
$(document).ready(function () {
    var empty = parseInt($("#zlun-js-order-empty").val());

    if (empty == 0) {
        $("#zlun-js-orders-explore").on("click", function () {
            window.location.href = "explore?need=dog";
        })
    }
    else {
        $(".zlun-js-order-delete").on("click", function () {
            var id = this.id;
            id = id.split("_");
            id = id[1];

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "deleteOrder",
                timeout: 2000,
                data: {
                    orderId: id
                },
                success: function () {
                    $("#item_" + id).remove();
                    empty--;
                    if (empty == 0) {
                        $("#zlun-js-order-body").empty();
                        $("#zlun-js-order-body").append($('<div class="blankslate">\n' +
                            '                <img src="https://ghicons.github.com/assets/images/blue/png/Pull%20request.png" alt="" class="mb-3" />\n' +
                            '                <h3 class="mb-1">You don’t seem to have bought any items.</h3>\n' +
                            '                <p>Come and find a partner to take home.</p>\n' +
                            '                <button class="btn btn-primary my-3" type="button" id="zlun-js-orders-explore">Explore</button>\n' +
                            '            </div>'));
                        $("#zlun-js-orders-explore").on("click", function () {
                            window.location.href = "explore?need=dog";
                        })
                    }
                }
            });
        })
    }
})
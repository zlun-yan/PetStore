$(document).ready(function () {
    var toast_id = 0;

    $(".zlun-js-explore-side").on("click", function () {
        var id = this.id;
        if (id == 'parrot') {
            window.location.href="explore?need=" + id;
            return;
        }
        else if (id == 'dog') {
            window.location.href="explore?need=" + id;
            return;
        }
        else if (id == 'cat') {
            window.location.href="explore?need=" + id;
            return;
        }
    })

    $(".zlun-js-add-to-cart").on("click", function () {
        var id = this.id;
        id = id.split('_');

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "addToCart",
            timeout: 2000,
            data: {
                itemId: id[1]
            },
            beforeSend: function() {
                $(this).attr("value", "Adding...").attr("disabled", "true");
            },
            success: function (data) {
                var state = data["state"];
                if (state == "success") {
                    toast_id++;
                    $("#alert").append($('<div class="Toast Toast--animateIn Toast--success" id="toast' + toast_id + '">\n' +
                        '            <span class="Toast-icon">\n' +
                        '                <svg width="12" height="16" viewBox="0 0 12 16" class="octicon">\n' +
                        '                    <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z" />\n' +
                        '                </svg>\n' +
                        '            </span>\n' +
                        '        <span class="Toast-content">\n' +
                        '            Success.\n' +
                        '        </span>\n' +
                        '    </div>'));

                    var id = "#toast" + toast_id;
                    setTimeout(function () {
                        $(id).addClass("Toast--animateOut");
                    }, 2000);
                    setTimeout(function () {
                        $(id).remove();
                    }, 2180);
                }
                else {
                    toast_id++;
                    $("#alert").append($('<div class="Toast Toast--animateIn Toast--error" id="toast' + toast_id + '">\n' +
                        '            <span class="Toast-icon">\n' +
                        '                <svg width="14" height="16" viewBox="0 0 14 16" class="octicon">\n' +
                        '                    <path fill-rule="evenodd" d="M10 1H4L0 5v6l4 4h6l4-4V5l-4-4zm3 9.5L9.5 14h-5L1 10.5v-5L4.5 2h5L13 5.5v5zM6 4h2v5H6V4zm0 6h2v2H6v-2z"/>\n' +
                        '                </svg>\n' +
                        '            </span>\n' +
                        '        <span class="Toast-content">\n' +
                        '            Sorry, please try again.\n' +
                        '        </span>\n' +
                        '    </div>'));

                    var id = "#toast" + toast_id;
                    setTimeout(function () {
                        $(id).addClass("Toast--animateOut");
                    }, 2000);
                    setTimeout(function () {
                        $(id).remove();
                    }, 2180);
                }
            },
            error: function() {
                toast_id++;
                $("#alert").append($('<div class="Toast Toast--animateIn Toast--error" id="toast' + toast_id + '">\n' +
                    '            <span class="Toast-icon">\n' +
                    '                <svg width="14" height="16" viewBox="0 0 14 16" class="octicon">\n' +
                    '                    <path fill-rule="evenodd" d="M10 1H4L0 5v6l4 4h6l4-4V5l-4-4zm3 9.5L9.5 14h-5L1 10.5v-5L4.5 2h5L13 5.5v5zM6 4h2v5H6V4zm0 6h2v2H6v-2z"/>\n' +
                    '                </svg>\n' +
                    '            </span>\n' +
                    '        <span class="Toast-content">\n' +
                    '            Sorry, please try again.\n' +
                    '        </span>\n' +
                    '    </div>'));

                var id = "#toast" + toast_id;
                setTimeout(function () {
                    $(id).addClass("Toast--animateOut");
                }, 2000);
                setTimeout(function () {
                    $(id).remove();
                }, 2180);
            },
            complete: function () {
                $(this).attr("value", "Add to Cart").removeAttr("disabled");
            }
        });
    })

    $("a").on("click", function () {
        var id = this.id;
        id = id.split('_');
        if (id[0] == 'info') {
            console.log('info ' + id[1]);
        }

    })
})
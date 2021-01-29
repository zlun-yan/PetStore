$(document).ready(function () {

    $("#search_input").focus(function () {
        $(this).addClass("input-block");
        $(this).removeClass("input-dark");
        $("#search_div").attr("style", "max-width: 544px");
        $("#search_list").removeClass("d-none");

        var keyword = $(this).val();

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ajaxSearchItems",
            timeout: 2000,
            data: {
                keyword: keyword
            },
            beforeSend: function() {
                var itemUl = $("#zlun-js-search-ul");
                var load = $("<li class=\"zlun-autocomplete-item\" style=\"pointer-events: none;\">\n" +
                    "                                        <div class=\"m-5 text-center anim-pulse\">\n" +
                    "                                            <svg height=\"24\" class=\"octicon octicon-mark-github \" viewBox=\"0 0 24 24\" version=\"1.1\" width=\"24\" aria-hidden=\"true\">\n" +
                    "                                                <path d=\"M7.75 11c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5C9 11.56 8.44 11 7.75 11zm1.27 4.5a.469.469 0 01.48-.5h5a.47.47 0 01.48.5c-.116 1.316-.759 2.5-2.98 2.5s-2.864-1.184-2.98-2.5zm7.23-4.5c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5c0-.69-.56-1.25-1.25-1.25z\"></path><path fill-rule=\"evenodd\" d=\"M21.255 3.82a1.725 1.725 0 00-2.141-1.195c-.557.16-1.406.44-2.264.866-.78.386-1.647.93-2.293 1.677A18.442 18.442 0 0012 5c-.93 0-1.784.059-2.569.17-.645-.74-1.505-1.28-2.28-1.664a13.876 13.876 0 00-2.265-.866 1.725 1.725 0 00-2.141 1.196 23.645 23.645 0 00-.69 3.292c-.125.97-.191 2.07-.066 3.112C1.254 11.882 1 13.734 1 15.527 1 19.915 3.13 23 12 23c8.87 0 11-3.053 11-7.473 0-1.794-.255-3.647-.99-5.29.127-1.046.06-2.15-.066-3.125a23.652 23.652 0 00-.689-3.292zM20.5 14c.5 3.5-1.5 6.5-8.5 6.5s-9-3-8.5-6.5c.583-4 3-6 8.5-6s7.928 2 8.5 6z\"></path>\n" +
                    "                                            </svg>\n" +
                    "                                            <h3><span>Loading</span><span class=\"AnimatedEllipsis\"></span></h3>\n" +
                    "                                        </div>\n" +
                    "                                    </li>");

                itemUl.empty();
                itemUl.append(load);
            },
            success: function(data) {
                var itemUl = $("#zlun-js-search-ul");
                itemUl.empty();
                var load = $('<li class="zlun-autocomplete-item zlun-js-top-search" aria-selected="true">\n' +
                    '                                        <a href="index" class="no-underline ">\n' +
                    '                                            ' + keyword + '\n' +
                    '                                            <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-inline-block float-right text-gray-dark">\n' +
                    '                                            <span class="">\n' +
                    '                                                All Petsotre\n' +
                    '                                            </span>\n' +
                    '                                                <span class="d-inline-block ml-1 v-align-middle">↵</span>\n' +
                    '                                            </div>\n' +
                    '                                        </a>\n' +
                    '                                    </li>');
                itemUl.append(load);

                var info = JSON.parse(data['info']);

                for (var item in info) {
                    // console.log(info[item].name);
                    load = $('<li class="zlun-autocomplete-item zlun-js-top-search">\n' +
                        '                                        <a href="explore?need=dog" class="no-underline ">\n' +
                        '                                            ' + info[item].name + '\n' +
                        '                                            <div class=" border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none float-right text-gray-dark">\n' +
                        '                                            <span class="">\n' +
                        '                                                Jump to\n' +
                        '                                            </span>\n' +
                        '                                                <span class="d-inline-block ml-1 v-align-middle">↵</span>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>');
                    itemUl.append(load);
                }
            },
            error : function() {

            }
        });
    })

    $("#search_input").blur(function () {
        $(this).removeClass("input-block");
        $(this).addClass("input-dark");
        $("#search_div").removeAttr("style", "max-width: 544px");
        $("#search_list").addClass("d-none");

        $("#zlun-js-search-ul").empty();
    })

    $("#sign_info").click(function () {
        window.location.href="info?need=profile";
    })

    $("#profile").click(function () {
        window.location.href="info?need=profile";
    })

    $("#address").click(function () {
        window.location.href="info?need=address";
    })

    $("#orders").click(function () {
        window.location.href="info?need=orders";
    })

    $("#cart").click(function () {
        window.location.href="cart";
    })

    $("#zlun-js-top-signin").on("click", function () {
        window.location.href = "signIn";
    })

    $("#zlun-js-top-signup").on("click", function () {
        window.location.href = "signUp";
    })

    $("#search_input").bind("input propertychange", function () {
        var keyword = $(this).val();

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "ajaxSearchItems",
            timeout: 2000,
            data: {
                keyword: keyword
            },
            beforeSend: function() {
                var itemUl = $("#zlun-js-search-ul");
                var load = $("<li class=\"zlun-autocomplete-item\" style=\"pointer-events: none;\">\n" +
                    "                                        <div class=\"m-5 text-center anim-pulse\">\n" +
                    "                                            <svg height=\"24\" class=\"octicon octicon-mark-github \" viewBox=\"0 0 24 24\" version=\"1.1\" width=\"24\" aria-hidden=\"true\">\n" +
                    "                                                <path d=\"M7.75 11c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5C9 11.56 8.44 11 7.75 11zm1.27 4.5a.469.469 0 01.48-.5h5a.47.47 0 01.48.5c-.116 1.316-.759 2.5-2.98 2.5s-2.864-1.184-2.98-2.5zm7.23-4.5c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5c0-.69-.56-1.25-1.25-1.25z\"></path><path fill-rule=\"evenodd\" d=\"M21.255 3.82a1.725 1.725 0 00-2.141-1.195c-.557.16-1.406.44-2.264.866-.78.386-1.647.93-2.293 1.677A18.442 18.442 0 0012 5c-.93 0-1.784.059-2.569.17-.645-.74-1.505-1.28-2.28-1.664a13.876 13.876 0 00-2.265-.866 1.725 1.725 0 00-2.141 1.196 23.645 23.645 0 00-.69 3.292c-.125.97-.191 2.07-.066 3.112C1.254 11.882 1 13.734 1 15.527 1 19.915 3.13 23 12 23c8.87 0 11-3.053 11-7.473 0-1.794-.255-3.647-.99-5.29.127-1.046.06-2.15-.066-3.125a23.652 23.652 0 00-.689-3.292zM20.5 14c.5 3.5-1.5 6.5-8.5 6.5s-9-3-8.5-6.5c.583-4 3-6 8.5-6s7.928 2 8.5 6z\"></path>\n" +
                    "                                            </svg>\n" +
                    "                                            <h3><span>Loading</span><span class=\"AnimatedEllipsis\"></span></h3>\n" +
                    "                                        </div>\n" +
                    "                                    </li>");

                itemUl.empty();
                itemUl.append(load);
            },
            success: function(data) {
                var itemUl = $("#zlun-js-search-ul");
                itemUl.empty();
                var load = $('<li class="zlun-autocomplete-item zlun-js-top-search" aria-selected="true">\n' +
                    '                                        <a href="index" class="no-underline ">\n' +
                    '                                            ' + keyword + '\n' +
                    '                                            <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-inline-block float-right text-gray-dark">\n' +
                    '                                            <span class="">\n' +
                    '                                                All Petsotre\n' +
                    '                                            </span>\n' +
                    '                                                <span class="d-inline-block ml-1 v-align-middle">↵</span>\n' +
                    '                                            </div>\n' +
                    '                                        </a>\n' +
                    '                                    </li>');
                itemUl.append(load);

                var info = JSON.parse(data['info']);

                for (var item in info) {
                    // console.log(info[item].name);
                    load = $('<li class="zlun-autocomplete-item zlun-js-top-search">\n' +
                        '                                        <a href="explore?need=dog" class="no-underline ">\n' +
                        '                                            ' + info[item].name + '\n' +
                        '                                            <div class=" border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none float-right text-gray-dark">\n' +
                        '                                            <span class="">\n' +
                        '                                                Jump to\n' +
                        '                                            </span>\n' +
                        '                                                <span class="d-inline-block ml-1 v-align-middle">↵</span>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>');
                    itemUl.append(load);
                }
            },
            error : function() {

            }
        });
    })

    $(".zlun-js-top-search").bind("click", function () {
        var href = $(this).attr("href");
        console.log("href");
    })
    //
    // $("#zlun-js-search-form").on("submit", function () {
    //     var keyword = $("#search_input").val();
    //     console.log(keyword);
    // })
})
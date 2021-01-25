$(document).ready(function () {

    $("#search_input").focus(function () {
        $(this).addClass("input-block");
        $(this).removeClass("input-dark");
        $("#search_div").attr("style", "max-width: 544px");
        $("#search_list").show();

        // var item = '<li class="autocomplete-item" aria-selected="true">Option 1</li>';
        // $("#search_list").append(item);
    })

    $("#search_input").blur(function () {
        $(this).removeClass("input-block");
        $(this).addClass("input-dark");
        $("#search_div").removeAttr("style", "max-width: 544px");
        $("#search_list").hide();
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
})
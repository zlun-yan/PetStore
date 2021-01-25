$(document).ready(function () {
    $("button").on("click", function () {
        var id = this.id;
        window.location.href="info?need=" + id;
    })
})
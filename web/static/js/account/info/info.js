$(document).ready(function () {
    $("button").on("click", function () {
        var id = this.id;
        if (id == 'profile') {
            window.location.href="info?need=" + id;
            return;
        }
        else if (id == 'address') {
            window.location.href="info?need=" + id;
            return;
        }
        else if (id == 'orders') {
            window.location.href="info?need=" + id;
            return;
        }

    })
})
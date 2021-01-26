$(document).ready(function () {
    $("button").on("click", function () {
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
})
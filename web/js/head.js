$(document).ready(function() {
    $(".head_menus").click(function() {
        $(".head_menus").each(function() {
            $(this).css({ "color": "white"});
        });
        $(this).css({ "color": "aqua"});
    });
});
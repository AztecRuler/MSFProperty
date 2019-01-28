$(document).ready(function () {
    setNavMenu();

    $("#privacyCheck").click(function () {
        console.log($("#sendMessage").checked == true);
        if ($("#privacyCheck").is(':checked')) {
            $("#sendMessage").prop('disabled', false);
                } else {
            $("#sendMessage").prop('disabled', true);
        }
    });

   });

function setNavMenu() {
    var ele = $('#menu-main-menu').find('a');

    $('#menu-main-menu').children().removeClass("current-menu-item");

    ele.each(function () {

        if ($(this).attr('href').indexOf(pagePath) > -1) {
            $(this.parentNode).addClass("current-menu-item");
        }
    });


}


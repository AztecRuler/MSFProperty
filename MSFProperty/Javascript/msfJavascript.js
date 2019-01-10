$(document).ready(function () {
    setNavMenu();
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
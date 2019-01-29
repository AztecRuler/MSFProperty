$(document).ready(function() {
    setNavMenu();

    $("#privacyCheck").click(function() {
        if ($("#privacyCheck").is(":checked")) {
            $("#sendMessage").prop("disabled", false);
        } else {
            $("#sendMessage").prop("disabled", true);
        }
    });

    $("#searchSubmitButton").click(function (e) {
        e.preventDefault();
        const searchCriteria = $("#searchInput").val();
        if (searchCriteria != "") {
            const dates = $("#flexDates").is(":checked");
            const smoking = $("#smokingSearch").is(":checked");
            const pets = $("#petSearch").is(":checked");
            window.location=
                `SearchResults.aspx?query=${searchCriteria}&dates=${dates}&Smoking=${smoking}&Pets=${pets}`;
        }

    });

});

function setNavMenu() {
    const ele = $("#menu-main-menu").find("a");

    $("#menu-main-menu").children().removeClass("current-menu-item");

    ele.each(function() {

        if ($(this).attr("href").indexOf(pagePath) > -1) {
            $(this.parentNode).addClass("current-menu-item");
        }
    });


}


$(document).ready(function() {
    setNavMenu();
    document.onkeydown = function(e) {
        var keycode;
        if (e === null) { // ie 
            keycode = event.keyCode;
        } else { // mozilla 
            keycode = e.which;
        }
        if (keycode === 27) {
            // Go back one page
            document.location.href = "/admin/admin.aspx";
        }
    };

    $("#privacyCheck").click(function() {
        if ($("#privacyCheck").is(":checked")) {
            $("#sendMessage").prop("disabled", false);
        } else {
            $("#sendMessage").prop("disabled", true);
        }
    });

    $("#searchSubmitButton").click(function(e) {
        e.preventDefault();
        const searchCriteria = $("#searchInput").val();
        if (searchCriteria !== "") {
            const dates = $("#flexDates").is(":checked");
            const smoking = $("#smokingSearch").is(":checked");
            const pets = $("#petSearch").is(":checked");
            window.location =
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

function HideBackPagination(value) {
    if (value) {
        $("#pagerBack").css("visibility", "hidden");
    } else {
        $("#pagerBack").css("visibility", "visible");
    }
}

function HideForwardsPagination(value) {
    if (value) {
        $("#pagerForwards").css("visibility", "hidden");
    } else {
        $("#pagerForwards").css("visibility", "visible");
    }
}

function setActivePagination(number) {
    $(".paginationNumber").each(function(index) {
        $(this).removeClass("active");
    });
    $(`#pagination_${number}`).addClass("active");
}

//document.addEventListener("DOMContentLoaded",
//    function() {
//        var lazyLoadImages;

//        var lazyLoadThrottleTimeout;
//        if ("IntersectionObserver" in window) {
//            lazyLoadImages = document.querySelectorAll(".lazy");
//            var imageObserver = new IntersectionObserver(function(entries, observer) {
//                entries.forEach(function(entry) {
//                    if (entry.isIntersecting) {
//                        const image = entry.target;
//                        image.classList.remove("lazy");
//                        imageObserver.unobserve(image);
//                    }
//                });
//            });

//            lazyLoadImages.forEach(function(image) {
//                imageObserver.observe(image);
//            });
//        } else {
//            lazyLoadImages = document.querySelectorAll(".lazy");
//        }

//        function lazyLoad() {
//            if (lazyLoadThrottleTimeout) {
//                clearTimeout(lazyLoadThrottleTimeout);
//            }

//            lazyLoadThrottleTimeout = setTimeout(function() {
//                    var scrollTop = window.pageYOffset;
//                    lazyLoadImages.forEach(function(img) {
//                        if (img.offsetTop < (window.innerHeight + scrollTop)) {
//                            img.src = img.dataset.src;
//                            img.classList.remove("lazy");
//                        }
//                    });
//                    if (lazyLoadImages.length === 0) {
//                        document.removeEventListener("scroll", lazyLoad);
//                        window.removeEventListener("resize", lazyLoad);
//                        window.removeEventListener("orientationChange", lazyLoad);
//                    }
//                },
//                20);
//        }

//        document.addEventListener("scroll", lazyLoad);
//        window.addEventListener("resize", lazyLoad);
//        window.addEventListener("orientationChange", lazyLoad);
//    });
        
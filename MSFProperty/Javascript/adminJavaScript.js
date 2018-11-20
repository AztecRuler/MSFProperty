$(document).ready(function () {

    $('#showUploadImages').click(function () {
        $('#useUploadedFile').css("display", "block");
     
        event.preventDefault();
    });


    $(".imageButtonUpload").click(function (index) {
        $('#uploadedImageUrl').val($(this).attr('src'));
        event.preventDefault();
        $("#imagePreview").css("background-image", "url(" + $('#uploadedImageUrl').val() + ")");
          });

    $('iframe').load(function () {
        $('iframe').contents().find("head")
            .append($("<style type='text/css'>  #footer,#wpg-bar{display:none;} .editable{ box-shadow: none;} .editable:hover {box-shadow: 0 0 25px red;  inset 0 0 10px white;}</style>"));
        var allTextElements = $(this).contents().find(".editable").not('div[class*="bgimg"]');
        var allImageElements = $(this).contents().find('div[class*="bgimg"]');


        $(this).contents().find(".editable").on('click', function (event) {

            $('#ImageChangePanel, #TextChangePanel').css({ 'display': 'none' });
            if (this.tagName === "A") {
                event.preventDefault();
                event.stopPropagation();
            }
            $('#AdminPanel').css({ 'display': 'block' });
            var editableElement = $(this).get(0);
            highlighElement(event, editableElement);

            if ($.inArray(this, allTextElements) > -1) {
                loadTextAdminPanel(allTextElements, editableElement);
            }
            else {
                loadImageAdminPanel(allImageElements, editableElement);

            }

        });
    });

    setAccordians();

});

function highlighElement(event, element) {

    event.stopPropagation();
    $(element).mouseover(function (event) {
        $(this).css({ border: 'groove red 10px;' });

    }).mouseout(function () {

    });
}

function loadImageAdminPanel(allImageElements, selectedElement) {

    $('#ImageChangePanel').css({ 'display': 'block' });

    var EditableEllement = {
     
        ImageID: 0,
        ImageName: "",
        ImageUrl: "", 
        PageName: "",
        PageId: 0
    };

    allImageElements.each(function (i, obj) {
        if (obj === selectedElement) {

            EditableEllement.ImageID = i+1;

            EditableEllement.ImageUrl = $(selectedElement).css("background-image");
            EditableEllement.ImageUrl = EditableEllement.ImageUrl.replace(/.*\s?url\([\'\"]?/, '').replace(/[\'\"]?\).*/, '');

            EditableEllement.ImageName = $(obj).ImageName;

            EditableEllement.PageName = "Home";
            EditableEllement.PageId = "1";
         
            return false;
        }
    });

    


    $("#imagePreview").css("background-image", "url(" + EditableEllement.ImageUrl+")");
    $("#FileUpload1").val(EditableEllement.pageId);
    $("#imageName").val(EditableEllement.ImageName);

    $("#ImageID").val(EditableEllement.ImageID);
    $("#ImageName").val(EditableEllement.ImageName);
    $("#ImageUrl").val(EditableEllement.ImageUrl);
    $("#ImagePageName").val(EditableEllement.PageName);
    $("#ImagePageId").val(EditableEllement.PageId);
   
}

function loadTextAdminPanel(allTextElements, selectedElement) {
   
    $('#TextChangePanel').css({ 'display': 'block' });

    var EditableEllement = {
        id: 1,
        pageName: "",
        pageId: 1,
        elementText: "",
        elementNumber: 0,
        elementType: "",
        elemenetLink: ""
    };

    allTextElements.each(function (i, obj) {
        if (obj === selectedElement) {

            EditableEllement.elementNumber = i;

            EditableEllement.pageName = "Home";
            EditableEllement.pageId = 1;

            EditableEllement.elementText = $(obj).text();
            EditableEllement.elementType = obj.tagName;
            if (obj.tagName === "A") {
                EditableEllement.elemenetLink = $(obj).attr('href');
            }
            return false;
        }
    });

    $("#pageName").val(EditableEllement.pageName);
    $("#pageId").val(EditableEllement.pageId);
    $("#elementText").val(EditableEllement.elementText);
    $("#elementNumber").val(EditableEllement.elementNumber);
    $("#elementType").val(EditableEllement.elementType);
    $("#elemenetLink").val(EditableEllement.elemenetLink);
}

function clearIframe() {
    $('#iframe1').attr('src', function (i, val) { return val; });
}
function setAccordians() {
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }


}

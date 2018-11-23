$(document).ready(function () {
    var oldPanel; 

    $(".imageButtonUpload").click(function (index) {
        $('#uploadedImageUrl').val($(this).attr('src'));
        event.preventDefault();
        $("#imagePreview").css("background-image", "url(" + $('#uploadedImageUrl').val() + ")");
          });

    $('iframe').load(function () {
        $('iframe').contents().find("head")
            .append($("<style type='text/css'>  #footer,#wpg-bar{display:none;} .editable{ box-shadow: none;} .editable:hover {box-shadow: 0 0 25px red;  inset 0 0 10px white;}  div[class*='bgimg'] {width: 99%; margin: auto;}</style>"));
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

    //$("#FileUpload1").change(function () {
    //    var newImage = "../Images/" + document.getElementById("FileUpload1").files[0].name;;
    //    $("#imagePreview").css("background-image", "url(" + newImage + ")");

    //});


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

            EditableEllement.PageName = "";
            var hdnfldVariable = document.getElementById('hdnfldVariable');
           
            EditableEllement.PageId = hdnfldVariable.value;
         
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

function clearIframe(num) {
    $('#iframe' + num).attr('src', function (i, val) { return val; });
}
function setAccordians() {
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            var classList = this.className.split(' ');
            classList = classList.filter(function (item) {
                return item.indexOf("accordion") !== 0;
            });
            if ($(this).data('id')) {
                var hdnfldVariable = document.getElementById('hdnfldVariable');
                hdnfldVariable.value = $(this).attr("data-id");
            }
            closeRelatedAccordians(classList);
            var panel = this.nextElementSibling;
            if (this.classList.contains("active")) {
                panel.style.maxHeight = null;
               
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
                removeAllActive(classList);
            }
            this.classList.toggle("active");
            oldPanel = this; 
        });
    }


}

function removeAllActive(Aval) {
    var acc = document.getElementsByClassName(Aval[0]);
    for (var i = 0; i < acc.length; i++) {
        acc[i].classList.remove("active");
    }
}

function closeRelatedAccordians(Aval) {

    var acc = document.getElementsByClassName(Aval[0]);
    for (var i = 0; i < acc.length; i++) {
       
        var panel = acc[i].nextElementSibling;
        panel.style.maxHeight = null;
       
    }
}



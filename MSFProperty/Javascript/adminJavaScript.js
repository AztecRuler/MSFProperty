$(document).ready(function () {
    $('iframe').load(function () {
        $('iframe').contents().find("head")
            .append($("<style type='text/css'>  #footer,#wpg-bar{display:none;} .editable{ box-shadow: none;} .editable:hover {box-shadow: 0 0 25px red;  inset 0 0 10px white;}</style>"));
        var allElements = $(this).contents().find(".editable").not('div[class*="bgimg"]');
        $(this).contents().find(".editable").on('click', function (event) {
            if (this.tagName === "A") {
                event.preventDefault();
                event.stopPropagation();
            }
            var editableElement = $(this).get(0);
            console.log(allElements.length);
            
            highlighElement(event, editableElement);
            loadAdminPanel(allElements, editableElement);
        
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

function loadAdminPanel(allElements, selectedElement)
{
    $('#AdminPanel').css({ 'display': 'block' }); 
    $('#TextChangePanel').css({ 'display': 'block' }); 

    var EditableEllement = {
         id : 1,
         pageName : "",
         pageId : 1,
         elementText : "",
         elementNumber : 0,
         elementType : "",
         elemenetLink : "",
    }

    allElements.each(function (i, obj) {
        if (obj === selectedElement) {
            console.log(i);
            EditableEllement.elementNumber = i;

            EditableEllement.pageName = "test";
            EditableEllement.pageId = 1;

            EditableEllement.elementText = $(obj).text();
            EditableEllement.elementType = obj.tagName;
            if (obj.tagName === "A") {
                EditableEllement.elemenetLink = $(obj).attr('href');
            }
        }
    });



    $("#pageName").val( EditableEllement.pageName);
    $("#pageId").val( EditableEllement.pageId);
    $("#elementText").val( EditableEllement.elementText);
    $("#elementNumber").val(EditableEllement.elementNumber);
    $("#elementType").val( EditableEllement.elementType);
    $("#elemenetLink").val( EditableEllement.elemenetLink);


    console.dir(EditableEllement);

   
        //things = JSON.stringify({
        //    'things': EditableEllement
        //});

        //$.ajax({
        //    contentType: 'application/json; charset=utf-8',
        //    dataType: 'json',
        //    type: 'POST',
        //    url: 'admin.aspx/PassThings',
        //    data: things,
        //    success: function () {
        //        alert("success");
        //    },
        //    error: function (response) {
        //        alert(JSON.stringify(response));
        //    }
        //});
}

function clearIframe(FrameID) {
    alert(1);
    document.getElementById(FrameID).contentDocument.location.reload(true);
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

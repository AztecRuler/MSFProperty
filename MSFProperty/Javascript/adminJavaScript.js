var oldPanel = null;

function pageLoad() {
    $(document).ready(function () {

        setBlogEditClick();
        SetForDeleteBlog();
        setUserEditClick();
        if ($("#createNewAbout_Us").length) {
            setAboutUsEditClick();
            setCancelDeleteClick();
        }

        if ($("#datepicker1").length) {
            $(function() {
                $("#datepicker2").datepicker();
                $("#datepicker1").datepicker();

            });

            $("#datepicker1").datepicker({
                onSelect: function(dateText, inst) {
                    $('#datepicker1Value').val(dateText);
                }
            });
            $("#datepicker2").datepicker({
                onSelect: function(dateText, inst) {
                    $('#datepicker2Value').val(dateText);
                }
            });
        }
        $(".imageButtonUpload").on('click', function (event) {
            event.stopPropagation();
            event.stopImmediatePropagation();
            event.preventDefault();
            UploadComplete();
            $('#uploadedImageUrl').val($(this).attr('src'));
            $("#imagePreview").css("background-image", "url(" + $('#uploadedImageUrl').val() + ")");
        
        });
        if ($('iframe').length) {
            $('iframe').load(function() {
                $('iframe').contents().find("head")
                    .append($(
                        "<style type='text/css'>  #footer,#msf-nav-bar{display:none;} .editable{ box-shadow: none;} .editable:hover {box-shadow: 0 0 25px red;  inset 0 0 10px white;}  div[class*='bgimg'] {width: 99%; margin: auto;}</style>"));
                var allTextElements = $(this).contents().find(".editable").not('div[class*="bgimg"]');
                var allImageElements = $(this).contents().find('div[class*="bgimg"]');
                $(this).contents().find(".editable").each(function () {
                    if ($(this).text() === "") {
                        $(this).text("This is an empty box but can be edited");
                    }
                });

                $(this).contents().find(".editable").on('click',
                    function(event) {

                        $('#ImageChangePanel, #TextChangePanel').css({ 'display': 'none' });
                        if (this.tagName === "A") {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        $('#AdminPanel').css({ 'display': 'block' });
                        var editableElement = $(this).get(0);
                        highlightElement(event, editableElement);

                        if ($.inArray(this, allTextElements) > -1) {
                            loadTextAdminPanel(allTextElements, editableElement);
                        } else {
                            loadImageAdminPanel(allImageElements, editableElement);

                        }

                    });
            });
        }
        setAccordians();
        function readUrl(input,preview) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                   $(preview).attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(".uploaders").change(function () {
            readUrl(this, this.previousElementSibling);

        });
      
      
    });
}



function setUserEditClick() {
    $(".userViewContainer").on('click', function (event) {
        var arrayCapture = $(this).map(function () {
            return [$.map($(this).data(), function (v) {
                return v;
            })];
        }).get();
        var usersArray = arrayCapture[0];
        $(".userViewContainer").not(this).toggleClass("hidden");

        $("#passwordConfirmPanel, #CancelEditUser").toggleClass("hidden");

        $("#editUserId").val(usersArray[0]);
    });
}


function setCancelDeleteClick() {
    $("#CancelDelete").on("click", function (event) {
        $(".aboutUsInfoSection").removeClass("hidden");
    });
}
function setAboutUsEditClick() {

    $(".aboutUsInfoSection").on('click',
        function(event) {
            const arrayCapture = $(this).map(function() {
                return [
                    $.map($(this).data(),
                        function(v) {
                            return v;
                        })
                ];
            }).get();
            const blogArray = arrayCapture[0];
            const deleteSelection = blogArray[0];
            if (deleteSelection !== "False") {
                $(".aboutUsInfoSection").not(this).toggleClass("hidden");
                $(".About_UsDeletePanel").toggleClass("hidden");
                $("html, body").animate({ scrollTop: $(document).height() }, "slow");

            } else {
                $("#About_UsEditTextBox1").attr("readonly", false).val(blogArray[4]);
                $("#About_UsEditTextBox2").attr("readonly", false).val(blogArray[3]);
                $("#About_UsEditTextBox3").attr("readonly", false).val(blogArray[2]);

                $("#imagePreview").attr("readonly", false)
                    .css("background-image", "url(../images/" + blogArray[1] + ")");

                $(".About_UsEditSelect, .About_UsEditPanel").toggleClass("hidden");
            }
            $("#editAbout_UsId").val(blogArray[5]);

        });
}

function resetAboutUsTabs() {
    $(" .About_UsEditPanel, .About_UsDeletePanel").addClass("hidden");
    $(".aboutUsInfoSection, .About_UsEditSelect").removeClass("hidden");
}
function setBlogEditClick() {
    $(".blogEditSelect .blogCard").on('click', function (event) {
        var arrayCapture = $(this).map(function () {
            return [$.map($(this).data(), function (v) {
                return v;
            })];
        }).get();

        //0: "True"
        //1: "MSF-rent-3.jpg"
        //2: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Neque egestas congue quisque egestas diam in. Nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur. Id aliquet risus feugiat in ante. Velit euismod in pellentesque massa placerat duis ultricies. Nec feugiat nisl pretium fusce id velit. Vulputate ut pharetra sit amet aliquam id diam. Lorem mollis aliquam ut porttitor leo. Et ligula ullamcorper malesuada proin libero nunc consequat. Eget aliquet nibh praesent tristique magna sit amet purus gravida.↵↵Id neque aliquam vestibulum morbi blandit. Hac habitasse platea dictumst quisque sagittis purus sit amet volutpat. Convallis posuere morbi leo urna. Accumsan tortor posuere ac ut consequat semper. Leo vel orci porta non pulvinar. At urna condimentum mattis pellentesque id nibh. Egestas diam in arcu cursus euismod quis viverra. Ornare lectus sit amet est placerat in egestas. Gravida quis blandit turpis cursus. Eleifend mi in nulla posuere sollicitudin aliquam ultrices. Eget aliquet nibh praesent tristique magna sit.↵↵Condimentum lacinia quis vel eros donec ac odio. Tortor id aliquet lectus proin nibh nisl condimentum. Et magnis dis parturient montes nascetur ridiculus mus mauris. Quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Nunc pulvinar sapien et ligula ullamcorper malesuada. Urna nec tincidunt praesent semper feugiat nibh sed pulvinar. Lobortis feugiat vivamus at augue eget arcu dictum varius. Tincidunt augue interdum velit euismod in pellentesque massa. Dui nunc mattis enim ut tellus elementum. Integer vitae justo eget magna fermentum.↵↵Iaculis urna id volutpat lacus laoreet non. Tortor dignissim convallis aenean et tortor at risus. Nisl tincidunt eget nullam non nisi est. Fringilla phasellus faucibus scelerisque eleifend. Risus in hendrerit gravida rutrum quisque non tellus. Sed viverra tellus in hac. Sed blandit libero volutpat sed cras ornare. Amet consectetur adipiscing elit ut aliquam purus sit amet luctus. Ipsum a arcu cursus vitae congue mauris rhoncus. Ac tortor dignissim convallis aenean et tortor at risus viverra. Quam viverra orci sagittis eu volutpat odio facilisis. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Sit amet mauris commodo quis imperdiet massa tincidunt.↵↵Ultrices neque ornare aenean euismod elementum nisi. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Fringilla urna porttitor rhoncus dolor purus non enim praesent elementum. Velit sed ullamcorper morbi tincidunt. Sed faucibus turpis in eu mi bibendum. Mattis rhoncus urna neque viverra justo nec. Integer quis auctor elit sed vulputate mi. Morbi quis commodo odio aenean sed adipiscing. Eget aliquet nibh praesent tristique magna sit. Vitae semper quis lectus nulla at volutpat diam. Sed egestas egestas fringilla phasellus faucibus. Consequat semper viverra nam libero. Feugiat in fermentum posuere urna nec tincidunt praesent semper feugiat. Proin libero nunc consequat interdum. Mollis nunc sed id semper risus in hendrerit gravida. Senectus et netus et malesuada fames ac turpis egestas. Eu consequat ac felis donec et odio pellentesque. Elementum tempus egestas sed sed risus pretium. Et pharetra pharetra massa massa."
        //3: "Lorem ipsum                                                                                         "
        //4: "27/11/2018 00:00:00"
        //5: "test1                                                                                               "
        //6: 1
        var blogArray = arrayCapture[0];
        $("#blogEditTextBox1").attr("readonly", false).val(blogArray[5] );
        $("#blogEditTextBox2").attr("readonly", false).val(blogArray[3]);
        $("#imagePreview").attr("readonly", false).css("background-image", "url(../images/" + blogArray[1] + ")");
        $("#blogEditCheckBox1").attr("readonly", false).prop('checked', blogArray[0]);
        $("#textBoxPrevious").text(blogArray[2]);
        $("#blogEditFreeTextBox2").val(blogArray[2]);
        $(".blogEditSelect, .blogEditPanel").toggleClass("hidden");

        $("#editBlogId").val(blogArray[6]);
    });

}

function SetForDeleteBlog(){

    $(".blogEditSelect .blogDeleteButton").on('click', function (event) {

        var arrayCapture = $(this).parent().parent().map(function () {
            return [$.map($(this).data(), function (v) {
                return v;
            })];
        }).get();

        var blogArray = arrayCapture[0];
        $("#delteHiddenField1").val(blogArray[6]);

    });


}

function highlightElement(event, element) {

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
    window.scrollTo(0, 0);
}

function loadTextAdminPanel(allTextElements, selectedElement) {
   
    $('#TextChangePanel').css({ 'display': 'block' });

    var editableEllement = {
        id: 1,
        pageName: "",
        pageId: 1,
        elementText: "",
        elementNumber: 0,
        elementType: "",
        elemenetLink: "",
        elementColor:""
    };

    allTextElements.each(function (i, obj) {
        if (obj === selectedElement) {

            editableEllement.elementNumber = i;

            editableEllement.pageName = "Home";
            editableEllement.pageId = 1;
            editableEllement.elementColor = (rgb2hex($(this).css('color')));
            editableEllement.elementText = $(obj).text();
            editableEllement.elementType = obj.tagName;
            if (obj.tagName === "A") {
                editableEllement.elemenetLink = $(obj).attr('href');
            }
            return false;
        }
    });

    $("#pageName").val(editableEllement.pageName);
    $("#pageId").val(editableEllement.pageId);
    $("#elementText").val(editableEllement.elementText);
    $('#textColor').val(editableEllement.elementColor);
    $("#elementNumber").val(editableEllement.elementNumber);
    $("#elementType").val(editableEllement.elementType);
    $("#elemenetLink").val(editableEllement.elemenetLink);
    window.scrollTo(0,0);

}

function rgb2hex(rgb) {
    if (rgb.search("rgb") == -1) {
        return rgb;
    } else {
        rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
        function hex(x) {
            return ("0" + parseInt(x).toString(16)).slice(-2);
        }
        return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
    }
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
            removeAllActive(classList);
            if (oldPanel !== this) {
                var panel = this.nextElementSibling;
                this.classList.toggle("active");
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
            oldPanel = this;
        });
    }


}

function removeAllActive(aval) {
    var acc = document.getElementsByClassName(aval[0]);
    for (var i = 0; i < acc.length; i++) {
        acc[i].classList.remove("active");
        acc[i].nextElementSibling.style.maxHeight = null;
    }
}

//tabs 

function OpenAdminTab(evt, tabName, tabId) {
    evt.preventDefault();
    evt.stopPropagation();
    if (!$(".blogEditPanel").hasClass("hidden")) {
        $(".blogEditSelect, .blogEditPanel").toggleClass("hidden");
    }

    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "table";
    evt.currentTarget.className += " active";
    if ($("#createNewAbout_Us").length) {
        resetAboutUsTabs();
    }
}

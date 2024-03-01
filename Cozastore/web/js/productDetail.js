var selectImages = document.querySelectorAll('.img-area');
var inputFiles = document.querySelectorAll('.file-input');
var imgAreas = document.querySelectorAll('.img-area');
selectImages.forEach((selectImage, index) => {
    selectImage.addEventListener('click', function () {
        inputFiles[index].click();
    });

    inputFiles[index].addEventListener('change', function () {
        console.log(inputFiles[index].value);
        const image = this.files[0];
        if (image.size < 2000000) {
            const reader = new FileReader();
            reader.onload = () => {
                const allImg = imgAreas[index].querySelectorAll('img');
                allImg.forEach(item => item.remove());
                const imgUrl = reader.result;
                const img = document.createElement('img');
                img.src = imgUrl;
                imgAreas[index].appendChild(img);
                imgAreas[index].classList.add('active');
                imgAreas[index].dataset.img = "Choose another Image";
            };
            reader.readAsDataURL(image);
        } else {
            alert("Image size more than 2MB");
        }
    });
});


function color(element1) {
    event.preventDefault();
//    var inputColor = document.querySelector(".input-color");
    var moreColor = element1.parentElement;
    var icon = element1.firstElementChild;
    var inputColor = element1.previousElementSibling;
    var select2 = element1.parentElement.previousElementSibling;

    select2.classList.toggle("not-allowed");

    inputColor.style.display = (inputColor.style.display === "none" || inputColor.style.display === "") ? "inline-block" : "none";
    moreColor.classList.toggle("slide");
    icon.classList.toggle("fa-plus");
    if (icon.classList.contains("fa-minus")) {
        inputColor.value = "";
    }
    icon.classList.toggle("fa-minus");
}

var numberInput = document.getElementById('numberInput');
numberInput.addEventListener('invalid', function (event) {
    event.target.setCustomValidity('Quantity must be a natural number.');
});
numberInput.addEventListener('input', function (event) {
    event.target.setCustomValidity('');
});

var checkbox = document.querySelectorAll(".checkbox");
for (let item of checkbox) {
    let input = item.parentElement.nextElementSibling;
    if (item.checked) {
        input.style.display = "inline-block";
        input.required = true;

    } else {
        input.style.display = "none";
        input.required = false;
    }
}
function log(checkbox2) {
    var input2 = checkbox2.parentElement.nextElementSibling;
    if (checkbox2.checked) {
        input2.style.display = "inline-block";
        input2.required = true;
    } else {
        input2.style.display = "none";
        input2.required = false;
        input2.value = "";
    }
}


function removeCharacters(str, value) {
    var regex = new RegExp(value, "g");
    return str.replace(regex, "");
}
function deleteRecord(btn) {
    var record = btn.closest('.record');
    record.style.display = 'none';
}

function checkedImage(currentInput) {
    var otherInputs = document.getElementsByClassName("checkedImage");
    for (var i = 0; i < otherInputs.length; i++) {
        if (otherInputs[i] !== currentInput) {
            otherInputs[i].checked = false;
        } else {
            otherInputs[i].checked = true;
        }
    }

}
var sizeInput1 = document.querySelectorAll(".size-input");
for (let i = 0; i < sizeInput1.length; i++) {
    let temp1 = sizeInput1[i].querySelectorAll(".checkbox");
    for (let j = 0; j < temp1.length; j++) {
        temp1[j].addEventListener("change", function () {
            // Xóa dấu "#" của các giá trị cũ
            for (let k = 0; k < temp1.length; k++) {
                temp1[k].value = temp1[k].value.replace("#", "");
            }

            let elementLastValue;
            let elementLast;
            for (let j = 0; j < temp1.length; j++) {
                if (temp1[j].checked) {
                    elementLast = temp1[j];
                    elementLastValue = temp1[j].value;
                }
            }
            // Thêm dấu "#" vào giá trị mới ở cuối cùng
            elementLast.value = "#" + elementLastValue;
        });
    }
}
var sizeInput = document.querySelectorAll(".size-input");
for (let i = 0; i < sizeInput.length; i++) {
    let temp1 = sizeInput[i].querySelectorAll(".checkbox");
    let elementLastValue;
    let elementLast;
    for (let j = 0; j < temp1.length; j++) {
        if (temp1[j].checked) {
            elementLast = temp1[j];
            elementLastValue = temp1[j].value;
        }
    }
    elementLast.value = "#" + elementLastValue;
}
function changeValueDefault(color) {
    let defaultImage = color.parentElement.parentElement.parentElement.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;
    defaultImage.value = color.value;
}
var color1 = document.getElementsByClassName("color");
var checkedImage1 = document.getElementsByClassName("checkedImage");
for (let i = 0, max = 10; i < color1.length; i++) {
    checkedImage1[i].value = color1[i].value;
}
$(document).ready(function () {




    // Bootstrap Date Picker
    $('#simple-date1 .input-group.date').datepicker({
        format: 'dd/mm/yyyy',
        todayBtn: 'linked',
        todayHighlight: true,
        autoclose: true,
    });

    $('#simple-date2 .input-group.date').datepicker({
        startView: 1,
        format: 'dd/mm/yyyy',
        autoclose: true,
        todayHighlight: true,
        todayBtn: 'linked',
    });

    $('#simple-date3 .input-group.date').datepicker({
        startView: 2,
        format: 'dd/mm/yyyy',
        autoclose: true,
        todayHighlight: true,
        todayBtn: 'linked',
    });

    $('#simple-date4 .input-daterange').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        todayHighlight: true,
        todayBtn: 'linked',
    });

    // TouchSpin

    $('#touchSpin1').TouchSpin({
        min: 0,
        max: 100,
        boostat: 5,
        maxboostedstep: 10,
        initval: 0
    });

    $('#touchSpin2').TouchSpin({
        min: 0,
        max: 100,
        decimals: 2,
        step: 0.1,
        postfix: '%',
        initval: 0,
        boostat: 5,
        maxboostedstep: 10
    });

    $('#touchSpin3').TouchSpin({
        min: 0,
        max: 100,
        initval: 0,
        boostat: 5,
        maxboostedstep: 10,
        verticalbuttons: true,
    });

    $('#clockPicker1').clockpicker({
        donetext: 'Done'
    });

    $('#clockPicker2').clockpicker({
        autoclose: true
    });

    let input = $('#clockPicker3').clockpicker({
        autoclose: true,
        'default': 'now',
        placement: 'top',
        align: 'left',
    });

    $('#check-minutes').click(function (e) {
        e.stopPropagation();
        input.clockpicker('show').clockpicker('toggleView', 'minutes');
    });

});
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let button = document.getElementById("fdsaf-get-all");
// Get all the checkbox elements by their name attribute
let checkboxes = document.getElementsByClassName("check-box-list");
// Declare a variable to store the state of the checkboxes
let count = 0;
function checkAll() {
    count = 0;
    // Loop through all the checkboxes and set them to checked or unchecked based on the variable
    if (button.checked) {
        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].getAttribute("disabled")) {

            } else {
                checkboxes[i].checked = true;
                count++;
            }
        }
    } else {
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = false;
        }
    }
    if (!button.checked)
        count = 0;
    //document.getElementById("choose-all-title").innerHTML = "Choose all (" + count + ")";
    document.getElementById("fdsa-number-of-selected").innerHTML = "Total of " + count + " product(s):";
    calallbuy();
    count = 0;
}

function checkOne(cId) {
    button.checked = false;
    count = 0;
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            count++;
        }
    }
    document.getElementById("fdsa-number-of-selected").innerHTML = "Total of " + count + " product(s):";
    calallbuy(); //total price
}

function handleSubmitCart(event) { //there'is alot input that just not need for check out , so disable them
    event.preventDefault();
    let temp = document.getElementsByClassName("btn-temp-coza");
    for (let i = 0; i < temp.length; i++) {
        temp[i].setAttribute("disabled", "true");
    }
    let n = 0;
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked)
            n++;
    }
    if (n == 0)
        swal("You didn't select anything", "You cannot check out with nothing", "error");
    else {
        document.getElementById("form-master-check-out").submit(); //if everything okay , submit
    }
}
function calallbuy() {
    var sum = 0;
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            sum = sum + Number(checkboxes[i].getAttribute("price"));
        }
    }
    document.getElementById("dsavcx-sumary-price").innerHTML = "$" + Number(sum).toLocaleString("en-US");
}

//update price of an item base on current info
function updatePrice(cId) {
    let unitprice = document.getElementById("price-info-" + cId).getAttribute("unitprice");
    let discount = document.getElementById("price-info-" + cId).getAttribute("discount");
    let quantity = document.getElementById("quantity-" + cId).value;
    let oldPriceField = document.getElementById("cart-old-price-" + cId);
    let newPriceField = document.getElementById("cart-new-price-" + cId);
    let checkBoxOpt = document.getElementById("check-box-opt-" + cId);
    if (discount > 0) {
        oldPriceField.innerHTML = "$" + (unitprice * quantity).toFixed(2);
    }
    let priceopt = (quantity * unitprice * (100 - discount) / 100).toFixed(2);
    newPriceField.innerHTML = "$" + priceopt;
    checkBoxOpt.setAttribute("price", priceopt);
    //calallbuy();
}
//cId : unchanged id , scpId is always updated
function decrease(cId, scpId) {
    let quantity = document.getElementById("quantity-" + cId);
    if (quantity.value > 1) {
        quantity.value--;
    }
    updatePrice(cId);
    var xhttp;
    xhttp = new XMLHttpRequest();
    let data = "getMethod=quantity&cId=" + scpId + "&quantity=" + quantity.value;
    xhttp.open("post", "cartAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(data);
    calallbuy();
}

function increase(cId, scpId) {
    let quantity = document.getElementById("quantity-" + cId);
    if (quantity.value < 10) {
        quantity.value++;
    }
    updatePrice(cId);
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let status = Number(this.responseText);
            if (status < 0) {
                --quantity.value;
                updatePrice(cId);
                calallbuy();
                //window.alert("This item are only " + (-1 * status) + " left in stock");
                swal("Update failed", "This item are only " + (-1 * status) + " left in stock", "error");
            } else
                updatePrice(cId);
        }
    };
    let data = "getMethod=quantity&cId=" + scpId + "&quantity=" + quantity.value;
    xhttp.open("post", "cartAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(data);
    calallbuy();
}

function openVariantBox(id) {
    let vBox = document.getElementById(id);
    if (vBox.style.display === "none") {
        vBox.style.display = "block";
    } else {
        vBox.style.display = "none";
    }
}

function chooseColor(color, cId, proId) { //choosing color in variant box
    let variantSumary = document.getElementById("variantSumary-" + cId);
    variantSumary.setAttribute("color", color);
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("size-list-" + cId).innerHTML = this.responseText;
        }
    };
    xhttp.open("get", "cartAjax?proId=" + proId + "&getMethod=size&color=" + color + "&cId=" + cId, true);
    xhttp.send();
}

function chooseSize(size, cId) { //choosing size in variant box
    let variantSumary = document.getElementById("variantSumary-" + cId);
    variantSumary.setAttribute("size", size);
}

function confirmChange(fixedId, cId, proId) {
    let informButton = document.getElementById("variantSumary-" + cId);
    let color = informButton.getAttribute("color");
    let size = informButton.getAttribute("size");

    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.responseText;
            if (response == -1) {
                swal("Can not change", "You have this item in cart before", "error");
            } else{
                document.getElementById("cart-item-bound-master-" + fixedId).innerHTML = response;
                calallbuy();
            }
        }
    };
    let data = "getMethod=scp&fixedId=" + fixedId + "&cId=" + cId + "&proId=" + proId + "&color=" + color + "&size=" + size;
    xhttp.open("post", "cartAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(data);
    calallbuy();
}

function refreshCart(fixedId, cId) {
    console.log("good");
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.responseText;
            document.getElementById("cart-item-bound-master-" + fixedId).innerHTML = response;
        }
    };
    let data = "getMethod=refresh&fixedId=" + fixedId + "&cId=" + cId;
    xhttp.open("post", "cartAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(data);
    calallbuy();
}

function deleteCart(fixedId, cId) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    let data = "getMethod=delete&cId=" + cId;
    xhttp.open("post", "cartAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(data);
    document.getElementById("cart-item-bound-master-" + fixedId).remove(); // remove the cart item on DOM
    let cartInfo = document.getElementById("item-quantity");
    cartInfo.innerHTML = Number(cartInfo.innerHTML) -1;
    updateNumberOfTotalItem();
    calallbuy();
}
//update number of total item
function updateNumberOfTotalItem() {
    document.getElementById("choose-all-title").innerHTML = "Choose all (" + getNumberOfItem() + ")";
}

function getNumberOfItem() { //get number of item that available
    let checkboxes = document.getElementsByClassName("check-box-list");
    let num = 0;
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].getAttribute("disabled")) {

        } else {
            num++;
        }
    }
    return num;
}
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function searchLive_header_hzdf(key) {  // show suggestions when user typing keys
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("products-result").innerHTML = this.responseText;
        }
    };
    xhttp.open("post", "home", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("key=" + key);
}
// When the user scrolls down, add a class to the navbar
window.onload = function () {
    changeColor();
};
window.onscroll = function () {
    changeColor();
};
function changeColor() {
    let navbar = document.getElementById("top-bar-bound");
    if (window.pageYOffset > navbar.offsetTop) {
        navbar.classList.add("sticky");
        navbar.classList.remove("sticky-disappear");
    } else {
        navbar.classList.remove("sticky");
        navbar.classList.add("sticky-disappear");
    }
}


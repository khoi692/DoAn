/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function disappearAll() {   //change display of all product item to none
    document.querySelectorAll(".newpro").forEach(function (element) {
        element.style.display = "none";
    });
    document.querySelectorAll(".man").forEach(function (element) {
        element.style.display = "none";
    });
    document.querySelectorAll(".women").forEach(function (element) {
        element.style.display = "none";
    });
    document.querySelectorAll(".unisex").forEach(function (element) {
        element.style.display = "none";
    });
}
function removeAll() { //remove class how-active1 of all elements on nav bar
    document.getElementById("newpro-but").classList.remove("how-active1");
    document.getElementById("women-but").classList.remove("how-active1");
    document.getElementById("men-but").classList.remove("how-active1");
    document.getElementById("unisex-but").classList.remove("how-active1");
}
// display product on click of users 
function newpro() {
    disappearAll();
    document.querySelectorAll(".newpro").forEach(function (element) {
        element.style.display = "block";
    });
    removeAll();
    document.getElementById("newpro-but").classList.add("how-active1");
}
function men() {
    disappearAll();
    document.querySelectorAll(".man").forEach(function (element) {
        element.style.display = "block";
    });
    removeAll();
    document.getElementById("men-but").classList.add("how-active1");
}
function women() {
    disappearAll();
    document.querySelectorAll(".women").forEach(function (element) {
        element.style.display = "block";
    });
    removeAll();
    document.getElementById("women-but").classList.add("how-active1");
}
function unisex() {
    disappearAll();
    document.querySelectorAll(".unisex").forEach(function (element) {
        element.style.display = "block";
    });
    removeAll();
    document.getElementById("unisex-but").classList.add("how-active1");
}

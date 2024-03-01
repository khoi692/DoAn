/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function showQueryBlog(page, cateId, orderby, search) {
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("show-blog-list").innerHTML = this.responseText;
            let row = document.getElementById("blog-row").innerHTML;
            let category = document.getElementById("cate-name-response").innerHTML;
            let orderby = document.getElementById("orderby-response").innerHTML;
            let search = document.getElementById("search-response").innerHTML;
            let title = "";
            document.getElementById("page-number-"+page).className += " active-pagination1";
            if (orderby == "desc") {
                title += "Latest";
            }
            if (orderby == "asc") {
                title += "Earliest";
            }
            if (category != "") {
                title += " " + category;
            }
            title += " posts";
            if (search != "") {
                title += " related to \"" + search + "\"";
            }
            document.getElementById("h2-title-blog").innerHTML = title;
            document.getElementById("row-show-text").innerHTML = "Display 1-5 out of " + row + " results";
        }
    };
    xhttp.open("get", "bloglistAjax?cateId=" + cateId + "&orderby=" + orderby + "&search=" + search + "&page=" + page, true);
    xhttp.send();
}

//this function below is not uesd
function searchLive(key) {  // show suggestions when user typing keys
    var xhttp;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("pre-result").innerHTML = this.responseText;
        }
    };
    xhttp.open("post", "bloglistAjax", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("key=" + key);
}
// not uesd
function replaceHash() {
    var input = document.getElementById("inputField-search");
    if (input.value.startsWith("#")) {
        input.value = "%23" + input.value.substring(1);
    }
}
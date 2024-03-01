/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function placeOrder(event) {
    event.preventDefault();
    let validated = true;

    let cusname = document.getElementById("user-name").innerHTML.trim();
    let cusphone = document.getElementById("user-phone").innerHTML.trim();
    let cusaddress = document.getElementById("user-address").innerHTML.trim();
    document.getElementById("name-input-master").value = cusname;
    document.getElementById("phone-input-master").value = cusphone;
    document.getElementById("address-input-master").value = cusaddress;
    if (cusname == '') {
        swal("Name field is empty", "Please provide your name by clicking Update Information", "error");
        validated = false;
    } else if (cusphone == '') {
        swal("Phone filed is empty", "Please provide your phone by clicking Update Information", "error");
        validated = false;
    }
    if(fault){
        swal("Please update your information", "Click Update information", "error");
       validated = false;
    }
    if (validated) {
        document.getElementById("form-master-place-order").submit();
    }
}

var fault = true;

function saveChangeInfo() { //save the change info
    fault = false;
    //
    let cusname_e = document.getElementById("fullname-input");
    let cusphone_e = document.getElementById("phone-input");
    let country_e = document.getElementById("country-input");
    let city_e = document.getElementById("locality-input");
    let stateProvince_e = document.getElementById("administrative_area_level_1-input");
    let postal_e = document.getElementById("postal_code-input");
    let location_e = document.getElementById("location-input");
    //
    let cusname = cusname_e.value;
    let cusphone = cusphone_e.value;
    let country = country_e.value;
    let city = city_e.value;
    let stateProvince = stateProvince_e.value;
    let postal = postal_e.value;
    let location = location_e.value;
    //
    let coor = document.getElementById("coordinate").innerHTML;
    // validation     
    let address = "";
    if (postal !== "") {
        address += "Zip/Postal: " + postal + ", ";
    }
    //location
    if (location !== "") {
        location_e.classList.remove("is-invalid");
        location_e.classList.add("is-valid");
        address += location + ", ";
    } else {
        location_e.classList.add("is-invalid");
        fault = true;
    }
    if (city !== "") {
        city_e.classList.remove("is-invalid");
        city_e.classList.add("is-valid");
        address += city + ", ";
    } else {
        city_e.classList.add("is-invalid");
        fault = true;
    }
    if (stateProvince !== "") {
        stateProvince_e.classList.remove("is-invalid");
        stateProvince_e.classList.add("is-valid");
        address += stateProvince + ", ";
    } else {
        stateProvince_e.classList.add("is-invalid");
        fault = true;
    }
    if (country !== "") {
        country_e.classList.remove("is-invalid");
        country_e.classList.add("is-valid");
        address += country;
    } else {
        country_e.classList.add("is-invalid");
        fault = true;
    }
    if (coor !== "") {
        address += (", " + coor);
    }
    //name
    if (cusname === "") {
        cusname_e.classList.add("is-invalid");
        fault = true;
    } else {
        cusname_e.classList.remove("is-invalid");
        cusname_e.classList.add("is-valid");
    }
    if (cusphone === "") {
        cusphone_e.classList.add("is-invalid");
        fault = true;
    } else {
        cusphone_e.classList.add("is-valid");
        cusphone_e.classList.remove("is-invalid");
    }
    if (fault === false) {
        document.getElementById("user-name").innerHTML = cusname;
        document.getElementById("user-phone").innerHTML = cusphone;
        document.getElementById("user-address").innerHTML = address;
    }
}

function applyVoucher(code, min_condition) {
    if (min_condition > totalPrice()) {
        swal("Your order subtotal does not meet the voucher's requirement", "you must buy $" + (min_condition - totalPrice()) + " more", "error");
    } else {
        let xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                let discount = this.responseText;
                document.getElementById("coza-voucher").setAttribute("price", discount);
                document.getElementById("coza-voucher").innerHTML = "-$" + Number(discount).toFixed(2);
                totalPayment();
                document.getElementById("voucher-input-master").value = code;
                swal("Voucher applied", "", "success");
            }
        };
        xhttp.open("get", "CartContact?getMethod=voucher&code=" + code, true);
        xhttp.send();
    }
}
//map
(g => {
    var h, a, k, p = "The Google Maps JavaScript API", c = "google", l = "importLibrary", q = "__ib__", m = document, b = window;
    b = b[c] || (b[c] = {});
    var d = b.maps || (b.maps = {}), r = new Set, e = new URLSearchParams, u = () => h || (h = new Promise(async(f, n) => {
            await (a = m.createElement("script"));
            e.set("libraries", [...r] + "");
            for (k in g)
                e.set(k.replace(/[A-Z]/g, t => "_" + t[0].toLowerCase()), g[k]);
            e.set("callback", c + ".maps." + q);
            a.src = `https://maps.${c}apis.com/maps/api/js?` + e;
            d[q] = f;
            a.onerror = () => h = n(Error(p + " could not load."));
            a.nonce = m.querySelector("script[nonce]")?.nonce || "";
            m.head.append(a)
        }));
    d[l] ? console.warn(p + " only loads once. Ignoring:", g) : d[l] = (f, ...n) => r.add(f) && u().then(() => d[l](f, ...n))
})({
    key: "AIzaSyDTGF5LI-zG9SYr-djHl_R7zd3Ouiyyrys",
    v: "weekly"
            // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
            // Add other bootstrap parameters as needed, using camel case.
});
let map;

async function initMap() {
// create map
//=============================================================================
//
    const {Map} = await google.maps.importLibrary("maps");
    const {AdvancedMarkerElement} = await google.maps.importLibrary("marker");
    const {Places} = await google.maps.importLibrary("places");
    map = new Map(document.getElementById("coza-map"), {
        center: {lat: 21.030653, lng: 105.847130},
        zoom: 12,
        mapId: 'd8119b3e96c5a98b',
        disableDefaultUI: true, // start customize your map
        zoomControl: false
    });
//  create marker
//===========================================================================
//
    var marker = new AdvancedMarkerElement({
        map,
        position: {lat: 21.030653, lng: 105.847130}
    });
// current location 
//==========================================================================
//
    infoWindow = new google.maps.InfoWindow();
    const locationButton = document.getElementById("current-location");
    //locationButton.classList.add("custom-map-control-button");
    //map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
    locationButton.addEventListener("click", () => {
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                    (position) => {
                const pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                infoWindow.setPosition(pos);
                map.setCenter(pos);
                map.set("zoom", 17);
                marker.position = pos;
                updateCoorPos(pos);
            },
                    () => {
                handleLocationError(true, infoWindow, map.getCenter());
            }
            );
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    });
//search box 
////==========================================================================
// Create the search box and link it to the UI element.
    const input = document.getElementById("place-search");
    const searchBox = new google.maps.places.SearchBox(input);
    //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
    // Bias the SearchBox results towards current map's viewport.
    map.addListener("bounds_changed", () => {
        searchBox.setBounds(map.getBounds());
    });
    let markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener("places_changed", () => {
        const places = searchBox.getPlaces();
        if (places.length == 0) {
            return;
        }
        // Clear out the old markers.
        markers.forEach((marker) => {
            marker.setMap(null);
        });
        markers = [];
        // For each place, get the icon, name and location.
        const bounds = new google.maps.LatLngBounds();
        places.forEach((place) => {
            if (!place.geometry || !place.geometry.location) {
                console.log("Returned place contains no geometry");
                return;
            }
            // Create a marker for each place.
            markers.push(
                    new google.maps.Marker({
                        map,
                        title: place.name,
                        position: place.geometry.location,
                    })
                    );
            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });

// click map event handler 
// =========================================================================
//
    map.addListener('click', function (e) {
        var pos = {lat: e.latLng.lat(), lng: e.latLng.lng()}; //get onclick coordinate
        marker.position = pos;
        updateCoorPos(pos);
    });
}
function updateCoorPos(pos) { //update coordinate on page
    let latConvert = ConvertDDToDMS(pos.lat);
    let lngConvert = ConvertDDToDMS(pos.lng);
    document.getElementById("coordinate").innerHTML = "Coordinate: " + (latConvert + "N " + lngConvert + "E");
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(
            browserHasGeolocation
            ? "Error: The Geolocation service failed."
            : "Error: Your browser doesn't support geolocation."
            );
    infoWindow.open(map);
}

// auto complete form
//===============================================================
//
initMap();
//function ConvertDDToDMS(DD)
function ConvertDDToDMS(DD) {
    var deg = DD | 0; // truncate dd to get degrees
    var frac = Math.abs(DD - deg); // get fractional part
    var min = (frac * 60) | 0; // multiply fraction by 60 and truncate
    var sec = (frac * 3600 - min * 60) | 0; // get remainder after subtracting minutes and multiply fraction by 3600 and truncate
    return deg + "° " + min + "' " + sec + "''";
}

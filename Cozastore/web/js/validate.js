const inputAlert = document.querySelector('#blankAlert');
const form = document.querySelector('form');

function validatePassword(input) {
    var passwordError = document.getElementById("passwordError");
    console.log(input);
    if (!input.match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()-_=+{};:,<.>])(?!.*\s).{8,}$/)) {
        passwordError.innerHTML = "Password must include both letters and numbers, special character and be at least 8 characters";
        return false;
    } else {
        passwordError.innerHTML = "";
        return true;
    }
}

function blankAlert(input) {
    if (input.includes(' ')) {
        inputAlert.style.display = 'block';
    } else {
        inputAlert.style.display = 'none';
    }
}

form.addEventListener('submit', function (event) {
    const password = document.querySelector('input[name="password"]').value;
    if (!validatePassword(password)) {
        event.preventDefault();
    }
});

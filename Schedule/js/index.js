var inputID = document.getElementById("id_value");
var inputPW = document.getElementById("pw_value");
var maxLength = input.getAttribute("maxlength");

inputID.addEventListener("input", function() {

    var textID = inputID.value

    if (textID.length > maxLength) {
        inputID.value = text.slice(0, maxLength);
    }
});

inputPW.addEventListener("input", function() {

    var textPW = inputPW.value

    if (textPW.length > maxLength) {
        inputPW.value = text.slice(0, maxLength);
    }
});
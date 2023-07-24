// 전역변수
var inputID = document.getElementById("id_value");
var inputPW = document.getElementById("pw_value");
var maxLengthID = inputID.getAttribute("maxlength");
var maxLengthPW = inputPW.getAttribute("maxlength");
var btnLogin = document.getElementById("btn_login");
var messageBox = null;

// 길이
inputID.addEventListener("input", function() {

    var textID = inputID.value;

    if (textID.length > maxLengthID) {

        inputID.value = textID.slice(0, maxLengthID);

    }

});

inputPW.addEventListener("input", function() {

    var textPW = inputPW.value;

    if (textPW.length > maxLengthPW) {

        inputPW.value = textPW.slice(0, maxLengthPW);

    }

});

// 함수 - 경고 문구 출력
function displayMessage(message) {
  
    var messageBox = document.getElementById("error_message_box");
    messageBox.innerText = message;

};

// 함수 - 다른 경고 문구 출력을 위해 기존 경고 문구 삭제
function removeMessage(message) {

    if (messageBox !== null) {
        messageBox.removeChild(message);
        messageBox = null;
    };

};

// 함수 - 이메일 유효성
function checkingEmail(email) {

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 정규표현식 고치기 // 정규표현식 뜯어서 분석해보기
    return emailPattern.test(email);

};

// 함수 - 경고 시, 테두리 빨간 색으로
function borderChangingRed() {
    inputID.style.border = "1px solid red";
    inputPW.style.border = "1px solid red";
};

// 로그인 버튼 클릭 시 예외 처리에 대해서
btnLogin.addEventListener("click", function() {

    event.preventDefault();

    var idValue = inputID.value.trim();
    var pwValue = inputPW.value.trim();

    removeMessage(message);
  
    if (idValue === "" && pwValue === "") {
        var message = "아이디와 비밀번호를 입력해 주세요";
        displayMessage(message);
        borderChangingRed();
    } else if (idValue === "") {
        var message = "아이디를 입력해 주세요";
        displayMessage(message);
        borderChangingRed();
    } else if (pwValue === "") {
        var message = "비밀번호를 입력해 주세요";
        displayMessage(message);
        borderChangingRed();
    } else if (!checkingEmail(idValue)) {
        var message = "올바른 이메일 형식을 입력해 주세요";
        displayMessage(message);
        borderChangingRed();
    }

});
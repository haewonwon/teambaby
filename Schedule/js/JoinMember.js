// 취소 클릭 시, 로그인 창으로 이동
var btnCancel = document.getElementById("btn_cancel");
btnCancel.addEventListener("click", function() {
    window.location.href = "../index.html";
});

// 이름 입력 시 예외처리
// 한글, 영어만
function checkKoreanEnglish(str) {
    var pattern = /^[가-힣a-zA-Z]+$/;
    return pattern.test(str);
};
var inputName = document.getElementById("name_value");
var errorName = document.getElementById("error_name");
inputName.addEventListener("blur", function() {

    event.preventDefault();
    var name = inputName.value.trim();

    if (name === "") {
        errorName.innerText = "이름을 입력해 주세요."
        inputName.style.border = "1px solid red";
    } else if (!checkKoreanEnglish(name)) {
        errorName.innerText = "이름은 한글과 영어만 입력 가능합니다."
        inputName.style.border = "1px solid red";
    } else if (name.length < 2 || name.length > 7) {
        // 길이 제한 (2~7)
        errorName.innerText = "이름은 2자에서 7자 사이로 입력해 주세요."
        inputName.style.border = "1px solid red";
    } else if (name.includes(" ")) {
        errorName.innerText = "이름에는 공백이 포함될 수 없습니다."
        inputName.style.border = "1px solid red";
    } else {
        errorName.innerText = "";
        inputName.style.border = "";
    }

});

// 이메일 입력 시 예외처리
// 이메일 유효성
function checkValidEmail(email) {
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
};
var inputEmail = document.getElementById("email_value");
var errorEmail = document.getElementById("error_email");
inputEmail.addEventListener("blur", function() {

    event.preventDefault();
    var email = inputEmail.value.trim();

    if (email === "") {
        errorEmail.innerText = "이메일을 입력해 주세요"
        inputEmail.style.border = "1px solid red";
    } else if (!checkValidEmail(email)) {
        errorEmail.innerText = "올바른 이메일 양식을 입력해 주세요."
        inputEmail.style.border = "1px solid red";
    } else if (email.length > 320) {
        errorEmail.innerText = "이메일은 최대 320자까지 입력 가능합니다."
        inputEmail.style.border = "1px solid red";
    } else if (email.includes(" ")) {
        errorEmail.innerText = "이메일에는 공백이 포함될 수 없습니다."
        inputEmail.style.border = "1px solid red";
    } else {
        errorEmail.innerText = "";
        inputEmail.style.border = "";
    }

});
// 이메일 중복 체크
var isEmailCheckClicked = false;
function openCheckEmail() {
    var email = document.getElementById("email_value").value.trim();
    if (email === "" || !checkValidEmail(email) || email.length > 320 || email.includes(" ")) {
        alert("올바른 이메일을 입력해 주세요.")
    } else {
        var url = "../jsp (action)/checkEmailAction.jsp";
        var target = "checkEmail";

        window.open(url, target);
        isEmailCheckClicked = true;
    }
}

// 비밀번호 입력 시 예외처리
// 비밀번호 유효성
function checkValidPW(password) {
    // 영문 (대소문자), 숫자, 특수문자가 포함되어 있는지 확인하는 정규식
    var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/;
    return pattern.test(password);
};
var inputPW = document.getElementById("pw_value");
var errorPW = document.getElementById("error_pw");
inputPW.addEventListener("blur", function() {

    event.preventDefault();
    var password = inputPW.value;

    if (password === "") {
        errorPW.innerText = "비밀번호를 입력해 주세요."
        inputPW.style.border = "1px solid red";
    } else if (!checkValidPW(password)) {
        errorPW.innerText = "비밀번호는 영문 (대소문자), 숫자, 특수문자를 포함해야 합니다."
        inputPW.style.border = "1px solid red";
    } else if (password.length < 8 || password.length > 20) {
        errorPW.innerText = "비밀번호는 8자에서 20자 사이로 입력해 주세요."
        inputPW.style.border = "1px solid red";
    } else if (password.includes(" ")) {
        errorPW.innerText = "비밀번호에는 공백이 포함될 수 없습니다."
        inputPW.style.border = "1px solid red";
    } else {
        errorPW.innerText = "";
        inputPW.style.border = "";
    }

});

// 비밀번호 확인 예외처리
var inputCheckingPW = document.getElementById("pwCheck_value");
var errorPwCheck = document.getElementById("error_pw_check");
inputCheckingPW.addEventListener("blur", function() {

    event.preventDefault();
    var password = inputPW.value;
    var passwordCheck = inputCheckingPW.value;

    if (passwordCheck === "") {
        errorPwCheck.innerText = "한 번 더 비밀번호를 입력해 주세요."
        inputCheckingPW.style.border = "1px solid red";
    } else if (passwordCheck !== password) {
        errorPwCheck.innerText = "비밀번호가 일치하지 않습니다."
        inputCheckingPW.style.border = "1px solid red";
    } else {
        inputCheckingPW.style.border = "";
        errorPwCheck.innerText = "";
    }

});

// 생년월일 예외처리
// 오늘 날짜 이후로 선택 불가
var inputBirthday = document.getElementById("birthday_value");
var errorBday = document.getElementById("error_birthday");
var today = new Date().toISOString().split("T")[0];
inputBirthday.setAttribute("max", today);
inputBirthday.addEventListener("blur", function() {

    event.preventDefault();
    var birthday = inputBirthday.value;

    if (birthday === "") {
        errorBday.innerText = "생년월일을 선택해 주세요";
        inputBirthday.style.border = "1px solid red";
    } else {
        errorBday.innerText = "";
        inputBirthday.style.border = "";
    }

});

// 전화번호 예외처리
// 전화번호 유효성
function checkValidNumber(number) {
    // 하이픈을 제외한 전화번호
    var pattern = /^\+?\d{1,3}?\d{3,14}$/;
    return pattern.test(number);
};
// 이벤트 함수 (전화번호)
var inputNumber = document.getElementById("phonenumber_value");
var errorNumber = document.getElementById("error_number");
inputNumber.addEventListener("blur", function() {

    event.preventDefault();
    var number = inputNumber.value;

    if (number === "") {
        errorNumber.innerText = "전화번호를 입력해 주세요."
        inputNumber.style.border = "1px solid red";
    } else if (!checkValidNumber(number)) {
        errorNumber.innerText = "유효한 전화번호를 입력해 주세요."
        inputNumber.style.border = "1px solid red";
    } else if (number.length > 11) {
        errorNumber.innerText = "전화번호는 최대 11자까지 입력 가능합니다."
        inputNumber.style.border = "1px solid red";
    } else if (number.includes(" ")) {
        errorNumber.innerText = "전화번호에는 공백이 포함될 수 없습니다."
        inputNumber.style.border = "1px solid red";
    } else {
        errorNumber.innerText = "";
        inputNumber.style.border = "";
    }

});
// 이벤트 함수 (전화번호) - 오로지 숫자만 입력 받을 수 있게
inputNumber.addEventListener("input", function() {
    var phoneNumber = inputNumber.value;
    phoneNumber = phoneNumber.replace(/\D/g, ""); // 숫자 이외의 문자 제거
    inputNumber.value = phoneNumber;
});
// 전화번호 중복 체크
var isNumberCheckClicked = false;
function openCheckNumber() {
    var number = document.getElementById("phonenumber_value").value.trim();
    if (number ==="" || !checkValidNumber(number) || number.length > 11 || number.includes(" ")) {
        alert("올바른 전화번호를 입력해 주세요.")
    } else {
        var url = "../jsp (action)/checkPhoneAction.jsp";
        var target = "checkNumber";

        window.open(url, target);
        isNumberCheckClicked = true;
    }
}
// form action 예외처리 함수
function submitChecking() {

    console.log("들어와짐")

    var name = document.getElementById("name_value").value.trim()
    var email = document.getElementById("email_value").value.trim()
    var password = document.getElementById("pw_value").value.trim()
    var passwordCheck = document.getElementById("pwCheck_value").value.trim()
    var birthday = document.getElementById("birthday_value").value
    var number = document.getElementById("phonenumber_value").value

    if (name === "" || !checkKoreanEnglish(name) || name.length < 2 || name.length > 7 || name.includes(" ")) {
        alert("올바른 이름을 입력해 주세요.")
    }
    
    else if (email === "" || !checkValidEmail(email) || email.length > 320 || email.includes(" ")) {
        alert("올바른 이메일을 입력해 주세요.")
    }

    else if (!isEmailCheckClicked) {
        alert("이메일 중복 체크를 해 주세요.")
    }

    else if (password === "" || !checkValidPW(password) || password.length < 8 || password.length > 20 || password.includes(" ")) {
        alert("올바른 비밀번호를 입력해 주세요.")
    }

    else if (passwordCheck === "" || passwordCheck !== password) {
        alert("올바른 비밀번호 확인을 입력해 주세요.")
    }
    
    else if (birthday === "") {
        alert("생일을 선택해 주세요.")
    }
    
    else if (number === "" || !checkValidNumber(number) || number.length > 11 || number.includes(" ")) {
        alert("올바른 전화번호를 입력해 주세요.")
    }

    else if (!isNumberCheckClicked) {
        alert("전화번호 중복 체크를 해 주세요.")
    }

    else {
        document.getElementById("join_mamber_form").submit()
    }
}

function btnClickEvent() {
    alert("로그인 후 이용 가능한 서비스입니다.")
}
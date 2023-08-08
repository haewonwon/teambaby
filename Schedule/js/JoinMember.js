var btnCancel = document.getElementById("btn_cancel");
var btnJoin = document.getElementById("btn_join");

// 버튼 클릭 시, 페이지 이동
// 확인 (가입) 클릭 후, 결격사항 존재할 시 경고 모달창 출력 후, 경고 모달창의 확인 클릭 시 모달창 사라짐
// 결격사항 없이 모든 입력창 통과 시, 회원가입 진행 (form action)
// 취소 클릭 시, 로그인 창으로 이동
btnCancel.addEventListener("click", function() {
    window.location.href = "../index.html";
});

// 이름 입력 시 예외처리
// 한글, 영어만
function checkKoreanEnglish(str) {
    var pattern = /^[가-힣a-zA-Z]+$/;
    return pattern.test(str);
};
// 경고 문구 출력 (이름)
function displayErrorMessageName(message) {
    var errorName = document.getElementById("error_name");
    errorName.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (이름)
function hideErrorName() {
    var errorName = document.getElementById("error_name");
    errorName.innerText = "";
};
// 테두리 빨간색 (이름)
function NameBorderChangingRed() {
    var inputName = document.getElementById("name_value");
    inputName.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (이름)
function nameBorderReset() {
    var inputName = document.getElementById("name_value");
    inputName.style.border = "";
};
// 이벤트 함수 (이름)
var inputName = document.getElementById("name_value");
inputName.addEventListener("blur", function() {

    event.preventDefault();
    var name = inputName.value.trim();

    if (name === "") {
        displayErrorMessageName("이름을 입력해 주세요.");
        NameBorderChangingRed();
    } else if (!checkKoreanEnglish(name)) {
        displayErrorMessageName("이름은 한글과 영어만 입력 가능합니다.");
        NameBorderChangingRed();
    } else if (name.length < 2 || name.length > 7) {
        // 길이 제한 (2~7)
        displayErrorMessageName("이름은 2자에서 7자 사이로 입력해 주세요.");
        NameBorderChangingRed();
    } else if (name.includes(" ")) {
        displayErrorMessageName("이름에는 공백이 포함될 수 없습니다.");
        NameBorderChangingRed();
    } else {
        hideErrorName();
        nameBorderReset();
    }

});

// 이메일 입력 시 예외처리
// 이메일 유효성
function checkValidEmail(email) {
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
};
// 경고 문구 출력 (이메일)
function displayErrorMessageEmail(message) {
    var errorEmail = document.getElementById("error_email");
    errorEmail.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (이메일)
function hideErrorEmail() {
    var errorEmail = document.getElementById("error_email");
    errorEmail.innerText = "";
};
// 테두리 빨간색 (이메일)
function EmailBorderChangingRed() {
    var inputEmail = document.getElementById("email_value");
    inputEmail.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (이메일)
function emailBorderReset() {
    var inputEmail = document.getElementById("email_value");
    inputEmail.style.border = "";
};
// 이벤트 함수 (이메일)
var inputEmail = document.getElementById("email_value");
inputEmail.addEventListener("blur", function() {

    event.preventDefault();
    var email = inputEmail.value.trim();

    if (email === "") {
        displayErrorMessageEmail("이메일을 입력해 주세요");
        EmailBorderChangingRed();
    } else if (!checkValidEmail(email)) {
        displayErrorMessageEmail("올바른 이메일 양식을 입력해 주세요.");
        EmailBorderChangingRed();
    } else if (email.length > 320) {
        // 길이 제한 (최대 320)
        displayErrorMessageEmail("이메일은 최대 320자까지 입력 가능합니다.");
        EmailBorderChangingRed();
    } else if (email.includes(" ")) {
        displayErrorMessageEmail("이메일에는 공백이 포함될 수 없습니다.");
        EmailBorderChangingRed();
    } else {
        hideErrorEmail();
        emailBorderReset();
    }

});

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
// 경고 문구 출력 (비밀번호)
function displayErrorMessagePW(message) {
    var errorPW = document.getElementById("error_pw");
    errorPW.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (비밀번호)
function hideErrorPW() {
    var errorPW = document.getElementById("error_pw");
    errorPW.innerText = "";
};
// 테두리 빨간색 (비밀번호)
function PWBorderChangingRed() {
    var inputPW = document.getElementById("pw_value");
    inputPW.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (비밀번호)
function pwBorderReset() {
    var inputPW = document.getElementById("pw_value");
    inputPW.style.border = "";
};
// 이벤트 함수 (비밀번호)
var inputPW = document.getElementById("pw_value");
inputPW.addEventListener("blur", function() {

    event.preventDefault();
    var password = inputPW.value;

    if (password === "") {
        displayErrorMessagePW("비밀번호를 입력해 주세요.");
        PWBorderChangingRed();
    } else if (!checkValidPW(password)) {
        displayErrorMessagePW("비밀번호는 영문 (대소문자), 숫자, 특수문자를 포함해야 합니다.");
        PWBorderChangingRed();
    } else if (password.length < 8 || password.length > 20) {
        // 길이 제한 (8~20)
        displayErrorMessagePW("비밀번호는 8자에서 20자 사이로 입력해 주세요.");
        PWBorderChangingRed();
    } else if (password.includes(" ")) {
        displayErrorMessagePW("비밀번호에는 공백이 포함될 수 없습니다.");
        PWBorderChangingRed();
    } else {
        hideErrorPW();
        pwBorderReset();
    }

});

// 비밀번호 확인 예외처리
// 경고 문구 출력 (비밀번호 확인)
function displayErrorMessagePwCheck(message) {
    var errorPwCheck = document.getElementById("error_pw_check");
    errorPwCheck.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (비밀번호 확인)
function hideErrorPwCheck() {
    var errorPwCheck = document.getElementById("error_pw_check");
    errorPwCheck.innerText = "";
};
// 테두리 빨간색 (비밀번호 확인)
function PwCheckBorderChangingRed() {
    var inputCheckingPW = document.getElementById("pwCheck_value");
    inputCheckingPW.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (비밀번호 확인)
function pwCheckBorderReset() {
    var inputCheckingPW = document.getElementById("pwCheck_value");
    inputCheckingPW.style.border = "";
};
// 이벤트 함수 (비밀번호 확인)
var inputCheckingPW = document.getElementById("pwCheck_value");
inputCheckingPW.addEventListener("blur", function() {

    event.preventDefault();
    var password = inputPW.value;
    var passwordCheck = inputCheckingPW.value;

    if (passwordCheck === "") {
        displayErrorMessagePwCheck("한 번 더 비밀번호를 입력해 주세요.");
        PwCheckBorderChangingRed();
    } else if (passwordCheck !== password) {
        displayErrorMessagePwCheck("비밀번호가 일치하지 않습니다.");
        PwCheckBorderChangingRed();
    } else {
        hideErrorPwCheck();
        pwCheckBorderReset();
    }

});

// 직급 예외처리 (팀원, 팀장이 아닐 때의 예외처리 하지만 팀원 디폴트에 팀원, 팀장 외에는 다른 select option이 없음 필요하다면 추후에 추가하기)

// 생년월일 예외처리
// 오늘 날짜 이후로 선택 불가
var inputBirthday = document.getElementById("birthday_value");
var today = new Date().toISOString().split("T")[0];
inputBirthday.setAttribute("max", today);
// 경고 문구 출력 (생년월일)
function displayErrorMessageBday(message) {
    var errorBday = document.getElementById("error_birthday");
    errorBday.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (생년월일)
function hideErrorBday() {
    var errorBday = document.getElementById("error_birthday");
    errorBday.innerText = "";
};
// 테두리 빨간색 (생년월일)
function BdayBorderChangingRed() {
    var inputBirthday = document.getElementById("birthday_value");
    inputBirthday.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (생년월일)
function BdayBorderReset() {
    var inputBirthday = document.getElementById("birthday_value");
    inputBirthday.style.border = "";
};
// 이벤트 함수 (생년월일)
inputBirthday.addEventListener("blur", function() {

    event.preventDefault();
    var birthday = inputBirthday.value;

    if (birthday === "") {
        displayErrorMessageBday("생년월일을 선택해 주세요");
        BdayBorderChangingRed();
    } else {
        hideErrorBday();
        BdayBorderReset();
    }

});

// 전화번호 예외처리
// 전화번호 유효성
function checkValidNumber(number) {
    // 하이픈을 제외한 전화번호
    var pattern = /^\+?\d{1,3}?\d{3,14}$/;
    return pattern.test(number);
};
// 경고 문구 출력 (전화번호)
function displayErrorMessageNumber(message) {
    var errorNumber = document.getElementById("error_number");
    errorNumber.innerText = message;
};
// 조건 충족 시, 경고 문구 삭제 (전화번호)
function hideErrorNumber() {
    var errorNumber = document.getElementById("error_number");
    errorNumber.innerText = "";
};
// 테두리 빨간색 (전화번호)
function numberBorderChangingRed() {
    var inputNumber = document.getElementById("phonenumber_value");
    inputNumber.style.border = "1px solid red";
};
// 조건 충족 시, 테두리 원상복구 (전화번호)
function numberBorderReset() {
    var inputNumber = document.getElementById("phonenumber_value");
    inputNumber.style.border = "";
};
// 이벤트 함수 (전화번호)
var inputNumber = document.getElementById("phonenumber_value");
inputNumber.addEventListener("blur", function() {

    event.preventDefault();
    var number = inputNumber.value;

    if (number === "") {
        displayErrorMessageNumber("전화번호를 입력해 주세요.");
        numberBorderChangingRed();
    } else if (!checkValidNumber(number)) {
        displayErrorMessageNumber("유효한 전화번호를 입력해 주세요.");
        numberBorderChangingRed();
    } else if (number.length > 11) {
        // 길이 제한 (최대 11)
        displayErrorMessageNumber("전화번호는 최대 11자까지 입력 가능합니다.");
        numberBorderChangingRed();
    } else if (number.includes(" ")) {
        displayErrorMessageNumber("전화번호에는 공백이 포함될 수 없습니다.");
        numberBorderChangingRed();
    } else {
        hideErrorNumber();
        numberBorderReset();
    }

});
// 이벤트 함수 (전화번호) - 오로지 숫자만 입력 받을 수 있게
inputNumber.addEventListener("input", function() {
    var phoneNumber = inputNumber.value;
    phoneNumber = phoneNumber.replace(/\D/g, ""); // 숫자 이외의 문자 제거
    inputNumber.value = phoneNumber;
});

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
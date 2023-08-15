var inputName = document.getElementById("name_value");
var inputNumber = document.getElementById("phonenumber_value");
var inputEmail = document.getElementById("email_value");
var errorName = document.getElementById("error_name_find_pw");
var errorNumber = document.getElementById("error_number_find_pw");
var errorEmail = document.getElementById("error_email_find_pw");
var btnCancel = document.getElementById("btn_cancel");
var btnFindPw = document.getElementById("btn_find_pw");

// 버튼 클릭 시, 페이지 이동
// 확인 (비밀번호 찾기) 클릭 후, 결격사항 존재할 시 경고 문구 출력 (아래의 예외처리 코드)
// 결격사항 없이 모든 입력창 통과 시, 비밀번호 찾기로 이동
// 취소 클릭 시, 로그인 창으로 이동
btnCancel.addEventListener("click", function() {
    window.location.href = "../index.html";
});

// 예외처리
// 한글, 영어만
function checkKoreanEnglish(str) {
    var pattern = /^[가-힣a-zA-Z]+$/;
    return pattern.test(str);
};
// 전화번호 유효성
function checkValidNumber(number) {
    // 하이픈을 제외한 전화번호
    var pattern = /^\+?\d{1,3}?\d{3,14}$/;
    return pattern.test(number);
};
// 이메일 유효성
function checkValidEmail(email) {
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
};

// 이벤트 함수
btnFindPw.addEventListener("click", function() {

    event.preventDefault();

    var name = inputName.value.trim();
    var number = inputNumber.value;
    var email = inputEmail.value.trim();
    
    if (name === "") {
        errorName.innerText = "이름을 입력해 주세요."
        inputName.style.border = "1px solid red";
    } else if (!checkKoreanEnglish(name)) {
        errorName.innerText = "이름은 한글과 영어만 입력 가능합니다.";
        inputName.style.border = "1px solid red";
    } else if (name.length < 2 || name.length > 7) {
        // 길이 제한 (2~7)
        errorName.innerText = "이름은 2자에서 7자 사이로 입력해 주세요.";
        inputName.style.border = "1px solid red";
    } else {
        errorName.innerText = "";
        inputName.style.border = "";
    }

    if (number === "") {
        errorNumber.innerText = "전화번호를 입력해 주세요.";
        inputNumber.style.border = "1px solid red";
    } else if (!checkValidNumber(number)) {
        errorNumber.innerText = "유효한 전화번호를 입력해 주세요.";
        inputNumber.style.border = "1px solid red";
    } else if (number.length > 11) {
        // 길이 제한 (최대 11)
        errorNumber.innerText = "전화번호는 최대 11자까지 입력 가능합니다.";
        inputNumber.style.border = "1px solid red";
    } else {
        errorNumber.innerText = "";
        inputNumber.style.border = "";
    }

    if (email === "") {
        errorEmail.innerText = "이메일을 입력해 주세요";
        inputEmail.style.border = "1px solid red";
    } else if (!checkValidEmail(email)) {
        errorEmail.innerText = "올바른 이메일 양식을 입력해 주세요.";
        inputEmail.style.border = "1px solid red";
    } else if (email.length > 320) {
        // 길이 제한 (최대 320)
        errorEmail.innerText = "이메일은 최대 320자까지 입력 가능합니다.";
        inputEmail.style.border = "1px solid red";
    } else {
        errorEmail.innerText = "";
        inputEmail.style.border = "";
    }

});

// 이벤트 함수 (전화번호) - 오로지 숫자만 입력 받을 수 있게
inputNumber.addEventListener("input", function() {
    var phoneNumber = inputNumber.value;
    phoneNumber = phoneNumber.replace(/\D/g, ""); // 숫자 이외의 문자 제거
    inputNumber.value = phoneNumber;
});

function submitChecking() {

    console.log("들어옴")

    var name = inputName.value.trim();
    var number = inputNumber.value;
    var email = inputEmail.value.trim();
    
    if (name === "" || !checkKoreanEnglish(name) || name.length < 2 || name.length > 7) {
        alert("올바른 이름을 입력해 주세요.")
    } else if (number === "" || !checkValidNumber(number) || number.length > 11) {
        alert("올바른 전화번호를 입력해 주세요.")
    } else if (email === "" || !checkValidEmail(email) || email.length > 320) {
        alert("올바른 이메일을 입력해 주세요.")
    } else {
        document.getElementById("find_pw_form").submit()
    }

}

function btnClickEvent() {
    alert("로그인 후 이용 가능한 서비스입니다.")
}
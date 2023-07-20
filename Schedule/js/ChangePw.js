var inputPW = document.getElementById("pw_value");
var inputCheckingPW = document.getElementById("pw_check_value");
var errorPW = document.getElementById("error_pw_change_pw");
var errorPwCheck = document.getElementById("error_pw_check_change_pw");
var btnCancel = document.getElementById("btn_cancel");
var btnChangePw = document.getElementById("btn_change_pw");

// 버튼 클릭 시, 페이지 이동
// 확인 (비밀번호 변경) 클릭 후, 결격사항 존재할 시 경고 문구 출력 (아래의 예외처리 코드)
// 결격사항 없이 모든 입력창 통과 시, 비밀번호 변경 후 로그인 창으로 이동
// 취소 클릭 시, 로그인 창으로 이동
btnCancel.addEventListener("click", function() {
    window.location.href = "../index.html";
});

// 예외처리
// 비밀번호 유효성
function checkValidPW(password) {
    // 영문 (대소문자), 숫자, 특수문자가 포함되어 있는지 확인하는 정규식
    var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$/;
    return pattern.test(password);
};

// 경고 문구 출력 (비밀번호)
function displayErrorMessagePW(message) {
    errorPW.innerText = message;
};
// 경고 문구 출력 (비밀번호 확인)
function displayErrorMessagePwCheck(message) {
    errorPwCheck.innerText = message;
};

// 조건 충족 시, 경고 문구 삭제 (비밀번호)
function hideErrorPW() {
    errorPW.innerText = "";
};
// 조건 충족 시, 경고 문구 삭제 (비밀번호 확인)
function hideErrorPwCheck() {
    errorPwCheck.innerText = "";
};

// 테두리 빨간색 (비밀번호)
function PWBorderChangingRed() {
    inputPW.style.border = "1px solid red";
};
// 테두리 빨간색 (비밀번호 확인)
function PwCheckBorderChangingRed() {
    inputCheckingPW.style.border = "1px solid red";
};

// 조건 충족 시, 테두리 원상복구 (비밀번호)
function pwBorderReset() {
    inputPW.style.border = "";
};
// 조건 충족 시, 테두리 원상복구 (비밀번호 확인)
function pwCheckBorderReset() {
    inputCheckingPW.style.border = "";
};

// 이벤트 함수 (비밀번호)
btnChangePw.addEventListener("click", function() {

    event.preventDefault();
    var password = inputPW.value;
    var passwordCheck = inputCheckingPW.value;
    
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
    } else {
        hideErrorPW();
        pwBorderReset();
    }

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
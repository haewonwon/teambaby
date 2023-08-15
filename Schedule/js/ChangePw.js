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

// 이벤트 함수 (비밀번호)
btnChangePw.addEventListener("click", function() {

    event.preventDefault();
    var password = inputPW.value;
    var passwordCheck = inputCheckingPW.value;
    
    if (password === "") {
        errorPW.innerText = "비밀번호를 입력해 주세요.";
        inputPW.style.border = "1px solid red";
    } else if (!checkValidPW(password)) {
        errorPW.innerText = "비밀번호는 영문 (대소문자), 숫자, 특수문자를 포함해야 합니다.";
        inputPW.style.border = "1px solid red";
    } else if (password.length < 8 || password.length > 20) {
        // 길이 제한 (8~20)
        errorPW.innerText = "비밀번호는 8자에서 20자 사이로 입력해 주세요.";
        inputPW.style.border = "1px solid red";
    } else {
        errorPW.innerText = "";
        inputPW.style.border = "";
    }

    if (passwordCheck === "") {
        errorPwCheck.innerText = "한 번 더 비밀번호를 입력해 주세요.";
        inputCheckingPW.style.border = "1px solid red";
    } else if (passwordCheck !== password) {
        errorPwCheck.innerText = "비밀번호가 일치하지 않습니다.";
        inputCheckingPW.style.border = "1px solid red";
    } else {
        errorPwCheck.innerText = "";
        inputCheckingPW.style.border = "";
    }

});

function submitChecking() {

    console.log("들어옴")

    var password = inputPW.value;
    var passwordCheck = inputCheckingPW.value;
    
    if (password === "" || !checkValidPW(password) || password.length < 8 || password.length > 20) {
        alert("올바른 비밀번호를 입력해 주세요.")
    } else if (passwordCheck === "" || passwordCheck !== password) {
        alert("올바른 비밀번호 확인을 입력해 주세요.")
    } else {
        document.getElementById("change_pw_form").submit()
    }

}

function btnClickEvent() {
    alert("로그인 후 이용 가능한 서비스입니다.")
}
// 전역변수
var inputName = document.getElementById("name_value");
var inputNumber = document.getElementById("phonenumber_value");
var errorName = document.getElementById("error_name_find_id");
var errorNumber = document.getElementById("error_number_find_id");
var btnCancel = document.getElementById("btn_cancel");
var btnFindId = document.getElementById("btn_find_id");

// 버튼 클릭 시, 페이지 이동
// 확인 (아이디 찾기) 클릭 후, 결격사항 존재할 시 경고 문구 출력 (아래의 예외처리 코드)
// 결격사항 없이 모든 입력창 통과 시, 아이디 찾기로 이동
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

// 경고 문구 출력 (이름)
function displayErrorMessageName(message) {
    errorName.innerText = message;
};
// 경고 문구 출력 (전화번호)
function displayErrorMessageNumber(message) {
    errorNumber.innerText = message;
};

// 조건 충족 시, 경고 문구 삭제 (이름)
function hideErrorName() {
    errorName.innerText = "";
};
// 조건 충족 시, 경고 문구 삭제 (전화번호)
function hideErrorNumber() {
    errorNumber.innerText = "";
};

// 테두리 빨간색 (이름)
function NameBorderChangingRed() {
    inputName.style.border = "1px solid red";
};
// 테두리 빨간색 (전화번호)
function numberBorderChangingRed() {
    inputNumber.style.border = "1px solid red";
};

// 조건 충족 시, 테두리 원상복구 (이름)
function nameBorderReset() {
    inputName.style.border = "";
};
// 조건 충족 시, 테두리 원상복구 (전화번호)
function numberBorderReset() {
    inputNumber.style.border = "";
};

// 이벤트 함수
btnFindId.addEventListener("click", function() {

    event.preventDefault();

    var name = inputName.value.trim();
    var number = inputNumber.value;
    
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
    } else {
        hideErrorName();
        nameBorderReset();
    }

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
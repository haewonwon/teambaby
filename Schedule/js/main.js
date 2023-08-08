// 전역 변수
var scheduleArray =
[
    "1일 화 스테이지어스",
    "2일 수 대전 여행",
    "3일 목 이마트 24 알바",
    "4일 금 이마트 24 알바"
]

// 함수 실행
printSchedule();
currentYearDisplay();

// 일정 height 는 fit-content 고정 사이즈 안 됨

// function yearCreate() {

//     for(var i=0; i < 100; i++) {

//         var tmpOption = document.createElement("option");
//         tmpOption.innerHTML = i + 1990;
//         document.getElementsByTagName("select")[0].appendChild(tmpOption);

//         tmpOption.id = "yearOption" + [i + 1990];

//     }

//     var yearOption2023 = document.getElementById("yearOption2023");
//     yearOption2023.selected = true;
//     // 반복문이 끝난 후에 코드를 작성해야 함
//     // 에러메세지 체크 잘하기
// }

// 현재 연도 가져오기
function currentYearDisplay() {

    var yearDisplay = document.getElementById("year_display");
    var currentYear = new Date().getFullYear();
    yearDisplay.innerHTML = currentYear;

}

function minusBtnClickEvent() {

    var yearDisplay = document.getElementById("year_display");
    yearDisplay.innerHTML = parseInt(yearDisplay.innerHTML) - 1;

}

function plusBtnClickEvent() {

    var yearDisplay = document.getElementById("year_display");
    yearDisplay.innerHTML = parseInt(yearDisplay.innerHTML) + 1;

}

// 일정 출력
function printSchedule() {

    for (var i =0; i < scheduleArray.length; i++) {

        var scheduleItem = scheduleArray[i];
        var tmpdiv = document.createElement("div");
        tmpdiv.className = "schedule_box"

        tmpdiv.innerHTML = `
        <p>${scheduleItem}</p>
        <button class="edit_button">수정</button>
        <button class="delete_button">삭제</button>
        `;
        document.getElementsByTagName("main")[0].appendChild(tmpdiv);

        var editBtn = tmpdiv.querySelector(".edit_button");
        var deleteBtn = tmpdiv.querySelector(".delete_button");

        editBtn.addEventListener("click", function() {
            var scheduleText = this.parentElement.querySelector("p").textContent;
            editSchedule(scheduleText);
        });

        deleteBtn.addEventListener("click", function() {
            if(confirm("일정을 삭제하시겠습니까?")) {
                alert("일정이 삭제되었습니다.")
            } else {
                alert("일정 삭제 실패")
            }
        });
    
    }

}

// 일정 추가
function windowOpen() {

    var popupWidth = 500;
    var popupHeight = 500;

    var popupX = (window.screen.width / 2) - (popupWidth / 2);
    var popupY= (window.screen.height / 2) - (popupHeight / 2);

    window.open(
      "../jsp (page)/schedulePage.jsp",
      "Child",
      "width=500, height=500" + ', top=' + popupY, 'left=' + popupX);

}

// 일정 수정
function editSchedule(scheduleItem) {
    var editedText = prompt("일정 수정", scheduleItem);

    if (editedText !== null) {
        openEditPopup(scheduleItem, editedText);
    }
}

function openEditPopup(originalText, editedText) {

    var popupUrl = `../jsp (page)/schedulePage.jsp?originalText=${encodeURIComponent(originalText)}`;
    popupUrl += `&editedText=${encodeURIComponent(editedText)}`;

    window.open(
      popupUrl,
      "EditSchedule",
      "width=400, height=400, top=100, left=100"
    );

}
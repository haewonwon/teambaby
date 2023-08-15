// 함수 실행
printSchedule();

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
var currentYear = new Date().getFullYear();
var currentMonth = new Date().getMonth() + 1;

function currentYearDisplay() {
    var yearDisplay = document.getElementById("year_display");
    yearDisplay.innerHTML = currentYear;
}

function changeYear(yearDiff) {
    currentYear += yearDiff;
    updateQueryString();
    currentYearDisplay();

    var backendURL = '백엔드URL' + '?year=' + currentYear + '&month=' + currentMonth;
    window.location.href = backendURL;
}

function updateQueryString() {
    var url = "main.jsp?year=" + currentYear + "&month=" + currentMonth;
    window.history.replaceState({}, "", url);
    location.reload();
}

function updateDate() {
    currentMonth = parseInt(document.getElementById("date_select").value);
    updateQueryString();
    currentYearDisplay();
}

// 초기 로드시 현재 연도 표시
currentYearDisplay();
updateQueryString();

console.log(scheduleArray);

// 일정 출력
function printSchedule() {

    for (var i =0; i < scheduleArray.length; i++) {

        var scheduleItem = scheduleArray[i];
        var tmpdiv = document.createElement("div");
        tmpdiv.className = "schedule_box"

        document.getElementsByTagName("main")[0].appendChild(tmpdiv);

        var tmpP = document.createElement("p");
        tmpP.textContent = scheduleItem

        var tmpBtnEdit = document.createElement("button");
        tmpBtnEdit.textContent = "수정"

        var tmpBtnDel = document.createElement("button");
        tmpBtnDel.textContent = "삭제"

        tmpdiv.appendChild(tmpP)
        tmpdiv.appendChild(tmpBtnEdit)
        tmpdiv.appendChild(tmpBtnDel)

        tmpBtnEdit.addEventListener("click", function() {
            var scheduleText = this.parentElement.querySelector("p").textContent;
            editSchedule(scheduleText);
        });

        tmpBtnDel.addEventListener("click", function() {
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

function menuBtnClickEvent() {
    var sideMenu = document.getElementById("side_menu");

    if (sideMenu.style.left === "0px") {
        // 메뉴가 이미 열려 있는 경우
        sideMenu.style.left = "-250px"; // 왼쪽으로 숨김
    } else {
        // 메뉴가 닫혀 있는 경우
        sideMenu.style.left = "0px"; // 왼쪽으로 이동하여 나타냄
    }
}
// 전역 변수
var main = document.getElementsByTagName("main");
var btnAdd = document.getElementById("btn_add");
var modal = document.getElementById("modal");
var btnClose = document.getElementById("close");

// 모달 출력, 닫기 관련
btnAdd.addEventListener("click", function() {
    modal.style.display = 'block'
});

btnClose.addEventListener("click", function () {
    modal.style.display = "none";
});

window.addEventListener("click", function (event) {
    if (event.target === modal) {
      modal.style.display = "none";
    }
});

var btnSave = document.getElementById("btn_save");
btnSave.addEventListener("click", function() {

    for (var i = 0; i < 31; i++) {
        var scheduleBox = document.createElement("div");
        main.appendChild(scheduleBox);
    }
    
});

var inputSchedule = document.getElementById("input_schedule");
var errorSchedule = document.getElementById("error_schedule");
inputSchedule.addEventListener("blur", function() {

    event.preventDefault();
    var schedule = inputSchedule.value.trim();

    if (schedule === "") {
        errorSchedule.innerText = "일정을 입력해 주세요";
        inputSchedule.style.border = "1px solid red";
    } else {
        errorSchedule.innerText = "";
        inputSchedule.style.border = "";
    }
});

// 이벤트 함수 (날짜)
var inputDate = document.getElementById("input_date");
var errorDate = document.getElementById("error_date");
inputDate.addEventListener("blur", function() {

    event.preventDefault();
    var date = inputDate.value;

    if (date === "") {
        errorDate.innerText = "날짜를 선택해 주세요";
        inputDate.style.border = "1px solid red";
    } else {
        errorDate.innerText = "";
        inputDate.style.border = "";
    }

});

// 이벤트 함수 (시간)
var inputTime = document.getElementById("input_time");
var errorTime = document.getElementById("error_time");
inputTime.addEventListener("blur", function() {

    event.preventDefault();
    var time = inputTime.value;

    if (time === "") {
        errorTime.innerText = "시간을 선택해 주세요";
        inputTime.style.border = "1px solid red";
    } else {
        errorTime.innerText = "";
        inputTime.style.border = "";
    }

});

function submitChecking() {

    var schedule = document.getElementById("input_schedule").value.trim()
    var date = document.getElementById("input_date")
    var time = document.getElementById("input_time")

    if (schedule === "" || schedule.length > 50 || schedule.includes(" ")) {
        alert("올바른 일정을 입력해 주세요.")
    }
    
    else if (date === "") {
        alert("날짜를 입력해 주세요.")
    }

    else if (time === "") {
        alert("시간을 선택해 주세요.")
    }

    else {
        document.getElementById("schedule_form").submit()
    }
}
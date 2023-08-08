<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%
// mainAction.jsp 에 있는 코드를 여기에 적어야 함 (스케쥴 출력하는)
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/schedule.css">
</head>

<body>

    <form id="schedule_form" action="../jsp (action)/scheduleAction.jsp">

        <h1>새로운 이벤트</h1>

        <table>
            <tr>
                <td>
                    
                </td>
                <td>
                    <input type="text" id="input_schedule" name="input_schedule" placeholder="일정">
                    <div class="error_message" id="error_schedule"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <p>날짜</p>
                </td>
                <td>
                    <input type="date" id="input_date" name="input_date">
                    <div class="error_message" id="error_date"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <p>시작 시간</p>
                </td>
                <td>
                    <input type="time" id="input_time" name="input_time">
                    <div class="error_message" id="error_time"></div>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <input type="button" value="확인" onclick="submitChecking()">
                </td>
            </tr>
        </table>

    </form>

    <script type="text/javascript" src="../js/schedule.js"></script>
</body>
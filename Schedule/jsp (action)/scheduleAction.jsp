<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<!-- ResultSet -->
<%@ page import="java.sql.ResultSet" %>

<%

// 앞 페이지에서 오는 데이터에 대해서 한글 인코딩
request.setCharacterEncoding("UTF-8");

String userID = (String)session.getAttribute("id");
String scheduleValue = request.getParameter("input_schedule");
String dateValue = request.getParameter("input_date");
String timeValue = request.getParameter("input_time");
boolean success = false;

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

PreparedStatement query = null;

String sql = "INSERT INTO schedule (user_id, content, schedule_date, start_time) VALUES (?, ?, ?, ?)";
    query = connect.prepareStatement(sql);

    query.setString(1, userID);
    query.setString(2, scheduleValue);
    query.setString(3, dateValue);
    query.setString(4, timeValue);

    query.executeUpdate();
    success = true;


%>

<script>
    
    function locateMainPage() {
        window.location.href = "../jsp (page)/main.jsp";
    };

    if (<%=success%> == true) {
        locateMainPage();
    } else {
        alert("일정 추가 실패");
        history.back();
    }

</script>

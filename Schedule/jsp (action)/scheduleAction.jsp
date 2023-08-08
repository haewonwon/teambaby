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

String scheduleValue = request.getParameter("input_schedule");
String dateValue = request.getParameter("input_date");
String timeValue = request.getParameter("input_time");

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

PreparedStatement query = null;
boolean success = false;

try {

    String sql = "INSERT INTO schedule (id, content, start_time) VALUES (?, ?, ?)";
    query = connect.prepareStatement(sql);

    query.setString(1, scheduleValue);
    query.setString(2, dateValue);
    query.setString(3, timeValue);

    query.executeUpdate();
    success = true;

} catch (Exception e) {
    System.out.println("An exception occurred: " + e.getMessage());
    e.printStackTrace();
} finally {
    if (query != null) {
        query.close();
    }
    if (connect != null) {
        connect.close();
    }
}

%>

<script>

    

</script>
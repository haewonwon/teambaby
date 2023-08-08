<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<!-- ResultSet -->
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%

// 앞 페이지에서 오는 데이터에 대해서 한글 인코딩
request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id_value");

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/project", "haewon", "kjneeke0609@");

String query = "SELECT * FROM schedule WHERE id = ?";
PreparedStatement statement = connection.prepareStatement(query);
statement.setString(1, id);

ResultSet resultSet = statement.executeQuery();

ArrayList<Map<String, String>> scheduleList = new ArrayList<>();

while (resultSet.next()) {
    Map<String, String> scheduleData = new HashMap<>();
    scheduleData.put("id", resultSet.getString("id"));
    scheduleData.put("content", resultSet.getString("content"));
    scheduleData.put("start_time", resultSet.getString("start_time"));
    scheduleList.add(scheduleData);
}

resultSet.close();
statement.close();
connection.close();

%>
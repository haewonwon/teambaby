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

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/project", "haewon", "kjneeke0609@");

String nameValue = request.getParameter("name_value");
String emailValue = request.getParameter("email_value");
String numberValue = request.getParameter("phonenumber_value");

//SQL 만들기
String query = "SELECT pw FROM user WHERE name=? AND email=? AND number=?";
PreparedStatement statement = connection.prepareStatement(query);

statement.setString(1, nameValue);
statement.setString(2, emailValue);
statement.setString(3, phonenumberValue);

ResultSet resultSet = statement.executeQuery();

boolean success = false;

if(resultSet.next()) {
    success = true;
}

resultSet.close();
statement.close();
connection.close();

%>
<jsp:forward page="jsp (action)/ChangePwAction.jsp"/>
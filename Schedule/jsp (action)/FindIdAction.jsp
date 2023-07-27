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

String nameValue = request.getParameter("name_value");
String phonenumberValue = request.getParameter("phonenumber_value");

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/project", "haewon", "kjneeke0609@");

String query = "";
PreparedStatement statement;

if (phonenumberValue != null && !phonenumberValue.isEmpty()) {
    query = "SELECT id FROM user WHERE name=? AND number=?";
    statement = connection.prepareStatement(query);
    statement.setString(1, nameValue);
    statement.setString(2, phonenumberValue);
} else {
    throw new IllegalArgumentException("전화번호를 입력해야 합니다.");
}

ResultSet resultSet = statement.executeQuery();

String idValue = null;

if (resultSet.next()) {
    idValue = resultSet.getString("id");
} else {
    idValue = "일치하는 ID를 찾을 수 없습니다.";
}

resultSet.close();
statement.close();
connection.close();

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h1>아이디 : <%=idValue%> </h1>
    
</body>
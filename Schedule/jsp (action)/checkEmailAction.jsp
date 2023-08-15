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
String emailValue = request.getParameter("email_value");

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

// sql 만들기
String sql = "SELECT * FROM user WHERE email=?";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1, emailValue);

boolean emailCheck;

ResultSet resultSet = query.executeQuery();

if(resultSet.next()) {
    emailCheck = true;
} else {
    emailCheck = false;
}

%>

<script>

    if(<%=emailCheck%> == true) {
       alert("중복된 이메일입니다. 다시 입력해 주세요.")
    }

    else {
        alert("사용 가능한 이메일입니다.")
        var email =  opener.document.getElementById("email_value");
        email.readOnly = true;
        email.style.border = "1px solid blue";
    }
    self.close();

</script>
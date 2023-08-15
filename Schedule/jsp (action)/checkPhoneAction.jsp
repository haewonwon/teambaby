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
String numberValue = request.getParameter("phonenumber_value");

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

// sql 만들기
String sql = "SELECT * FROM user WHERE phone=?";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1, numberValue);

boolean phoneCheck;

ResultSet resultSet = query.executeQuery();

if(resultSet.next()) {
    phoneCheck = true;
} else {
    phoneCheck = false;
}

%>

<script>

    if(<%=phoneCheck%> == true) {
       alert("중복된 전화번호입니다. 다시 입력해 주세요.")
    }

    else {
        alert("사용 가능한 전화번호입니다.")
        var number =  opener.document.getElementById("phonenumber_value");
        number.readOnly = true;
        number.style.border = "1px solid blue";
    }
    self.close();

</script>
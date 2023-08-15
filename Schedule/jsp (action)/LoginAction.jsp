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

String idValue = request.getParameter("id_value");
String pwValue = request.getParameter("pw_value");
boolean success = true;

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

String sql = "SELECT id, pw FROM user WHERE email=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    ResultSet rs = query.executeQuery();

if (rs.next()) {
    String userID = rs.getString("id");
    String userPW = rs.getString("pw");

    if (pwValue.equals(userPW)) {
      success = true;
      session.setAttribute("id", userID);
    }
    else {
      success = false;
    }

} else {
    success = false;
}

// 자원 해제
rs.close();
query.close();
connect.close();

%>

<script>

    function locateMainPage() {
        window.location.href = "../jsp (page)/main.jsp";
    };

    if (<%=success%> == true) {
        locateMainPage();
    } else {
        alert("로그인에 실패했습니다.");
        history.back();
    }

</script>
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

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

String sql = "SELECT * FROM user WHERE email=? AND pw=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);
    ResultSet rs = query.executeQuery();

// 로그인 성공 시 세션에 사용자 정보 저장
if (rs.next()) {
    session.setAttribute("id_value", idValue);
    // 클라이언트를 다른 URL로 리다이렉트
    response.sendRedirect("jsp (page)/main.jsp"); // 프로필 페이지로 이동
    
} else {
       
    response.sendRedirect("Login.jsp");

}

// 자원 해제
rs.close();
query.close();
connect.close();

%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>

<%

// 앞 페이지에서 오는 데이터에 대해서 한글 인코딩
request.setCharacterEncoding("UTF-8");

String nameValue = request.getParameter("name_value");
String emailValue = request.getParameter("email_value");
String pwValue = request.getParameter("pw_value");
String pwCheckValue = request.getParameter("pwCheck_value");
String selectRank = request.getParameter("select_rank");
String birthdayValue = request.getParameter("birthday_value");
String numberValue = request.getParameter("phonenumber_value");

// Connector 파일 불러와서 MariaDB 연결
Class.forName("com.mysql.jdbc.Driver");

// db 연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

// sql 만들기
String sql = "INSERT INTO user(name, email, pw, rank, birthday, phone, join_date) VALUES(?, ?, ?, ? , ?, ?, ?);";
PreparedStatement query = connect.prepareStatement(sql);

// 이름 검증
if (name == null || name.trim().isEmpty()) {
    // 이름이 빈 값일 경우
    out.println("올바른 이름을 입력해주세요.");
} else if (name.length() < 2 || name.length() > 7) {
    // 이름이 2자에서 7자 사이가 아닐 경우
    out.println("이름은 2자에서 7자 사이어야 합니다.");
} else if (name.contains(" ")) {
    // 이름에 공백이 포함된 경우
    out.println("이름에 공백을 포함할 수 없습니다.");
} else if (!name.matches("^[가-힣a-zA-Z]*$")) {
    // 이름이 한글 또는 영어로 이루어져 있지 않은 경우
    out.println("이름은 한글 또는 영어만 입력 가능합니다.");
} else {
    // 모든 검증을 통과한 경우, 회원가입 로직 수행
    // (이곳에 회원가입 처리 로직을 작성하세요)
    out.println("회원가입이 완료되었습니다.");
}


query.setString(1, nameValue);
query.setString(2, emailValue);
query.setString(3, pwValue);
query.setString(4, pwCheckValue);
query.setString(5, selectRank);
query.setString(6, birthdayValue);
query.setString(7, numberValue);

// sql 전송
query.executeUpdate();
query.close();

%>
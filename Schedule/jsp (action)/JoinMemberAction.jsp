<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<!-- ResultSet -->
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

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

try {

    // 이름 검증
    if (nameValue == null || nameValue.trim().isEmpty() || nameValue.length() < 2 || nameValue.length() > 7 || nameValue.contains(" ") || !nameValue.matches("^[가-힣a-zA-Z]*$")) {
        throw new Exception("올바른 이름을 입력해 주세요.");
    }

    // 이메일 검증
    if (emailValue == null || emailValue.trim().isEmpty() || emailValue.length() > 320 || emailValue.contains(" ") || !emailValue.matches("^\\S+@\\S+$")) {
        throw new Exception("올바른 이메일 주소를 입력해 주세요.");
    }

    // 비밀번호 검증
    if (pwValue == null || pwValue.trim().isEmpty() || pwValue.length() < 8 || pwValue.length() > 20 || pwValue.contains(" ") || !pwValue.matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]+$")) {
        throw new Exception("올바른 비밀번호를 입력해 주세요.");
    }

    // 비밀번호 확인 검증
    if (!pwCheckValue.equals(pwCheckValue)) {
        throw new Exception("비밀번호가 일치하지 않습니다.");
    }

    // 직급 검증
    if (!selectRank.equals("팀원") && !selectRank.equals("팀장")) {
        throw new Exception("올바른 직급을 선택해 주세요.");
    }

    // 생년월일 검증
    if (birthdayValue == null || birthdayValue.trim().isEmpty()) {
        throw new Exception("생년월일을 입력해 주세요.");
    }
    // 오늘 날짜 이후인지 확인
    java.time.LocalDate today = java.time.LocalDate.now();
    java.time.LocalDate birthdayValueObj = java.time.LocalDate.parse(birthdayValue);
    if (birthdayValueObj.isAfter(today)) {
        throw new Exception("올바른 생년월일을 입력해 주세요.");
    }

    // 휴대전화 번호 검증
    if (numberValue == null || numberValue.trim().isEmpty() || numberValue.length() > 11 || numberValue.contains(" ") || !numberValue.matches("^\\d{3}-\\d{3,4}-\\d{4}$")) {
        throw new Exception("올바른 휴대전화 번호를 입력해 주세요.");
    }

    // 이메일 중복 체크
    String emailSql = "SELECT COUNT(*) as email_count FROM user WHERE email=?";
    PreparedStatement emailQuery = connect.prepareStatement(emailSql);
    emailQuery.setString(1, emailValue);
    ResultSet emailResult = emailQuery.executeQuery();

    boolean isEmailDuplicate = false;
    if (emailResult.next()) {
        int emailCount = emailResult.getInt("email_count");
        isEmailDuplicate = (emailCount > 0);
    }

    // 전화번호 중복 체크
    String numberSql = "SELECT COUNT(*) as number_count FROM user WHERE phone=?";
    PreparedStatement numberQuery = connect.prepareStatement(numberSql);
    numberQuery.setString(1, numberValue);
    ResultSet numberResult = numberQuery.executeQuery();

    boolean isNumberDuplicate = false;
    if (numberResult.next()) {
        int numberCount = numberResult.getInt("number_count");
        isNumberDuplicate = (numberCount > 0);
    }

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter printer = response.getWriter();
    printer.println("emailDuplicate: " + isEmailDuplicate);
    printer.println("numberDuplicate: " + isNumberDuplicate);
    printer.close();

    // 데이터베이스에 새 회원 정보 저장
    query.setString(1, nameValue);
    query.setString(2, emailValue);
    query.setString(3, pwValue);
    query.setString(4, selectRank);
    query.setString(5, birthdayValue);
    query.setString(6, numberValue);
    query.setDate(7, new java.sql.Date(System.currentTimeMillis()));

    // 회원가입 성공 시
    query.executeUpdate();

    } catch (Exception e) {
        
    } finally {
        // 리소스 정리
        if (query != null) {
            query.close();
        }
        if (connect != null) {
            connect.close();
        }
    }

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <main>
        <h1>회원가입</h1>
        <h2>이름 : <%=nameValue%> </h2>
        <h2>아이디 : <%=emailValue%> </h2>
        <h2>비밀번호 : <%=pwValue%> </h2>
        <h2>직급 : <%=selectRank%> </h2>
        <h2>생년월일 : <%=birthdayValue%> </h2>
        <h2>휴대전화 번호 : <%=numberValue%> </h2>

        <a href="index.html">LOG IN</a>
    </main>

</body>
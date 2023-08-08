<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<!-- ResultSet : 데이터베이스 쿼리의 결과 집합을 나타내는 Java 인터페이스 -->
<%@ page import="java.sql.ResultSet" %>
<!-- <%@ page import="javax.servlet.http.HttpSession" %> -->
<%@ page import="java.util.ArrayList" %>

<%
public class User {
    private String nameValue;
    private String rankValue;
    private String birthdayValue;
    private String emailValue;
    private String phonenumberValue;

    // 생성자
    public User(String nameValue, String rankValue, String birthdayValue, String emailValue, String phonenumberValue) {
        this.nameValue = nameValue;
        this.rankValue = rankValue;
        this.birthdayValue = birthdayValue;
        this.emailValue = emailValue;
        this.phonenumberValue = phonenumberValue;
    }
    // Getter 메서드
    public String getName() {
        return nameValue;
    }

    public String getRank() {
        return rankValue;
    }

    public String getBirthday() {
        return birthdayValue;
    }

    public String getEmail() {
        return emailValue;
    }

    public String getPhoneNumber() {
        return phonenumberValue;
    }
}
%>

<%
// 앞 페이지에서 오는 데이터에 대해서 한글 인코딩
request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id_value");
String userRank = (String) session.getAttribute("userRank");

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/project", "haewon", "kjneeke0609@");

String query = "SELECT * FROM user WHERE id = ?";
PreparedStatement statement = connection.prepareStatement(query);
statement.setString(1, id);

ResultSet resultSet = statement.executeQuery();

String nameValue = null;
String rankValue = null;
String birthdayValue = null;
String emailValue = null;
String phonenumberValue = null;

if (resultSet.next()) {
    nameValue = resultSet.getString("name");
    rankValue = resultSet.getString("rank");
    birthdayValue = resultSet.getString("birthday");
    emailValue = resultSet.getString("email");
    phonenumberValue = resultSet.getString("phone");
}

resultSet.close();
statement.close();
connection.close();

if (userRank != null && userRank.equals("팀장")) {

    ArrayList<User> teamMemberInfos = new ArrayList<User>();

    try {
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project", "haewon", "kjneeke0609@");
        String qy = "SELECT * FROM user WHERE rank = '팀원'";
        PreparedStatement pstmt = connect.prepareStatement(qy);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            User member = new User();
            member.setName(rs.getString("name"));
            member.setRank(rs.getString("rank"));
            member.setBirthday(rs.getString("birthday"));
            member.setEmail(rs.getString("email"));
            member.setPhone(rs.getString("phone"));

            teamMemberInfos.add(member);
        }

        rs.close();
        pstmt.close();
        connect.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

%>

<body>
    <!-- <p id="name_value"><%= nameValue %></p>
    <p id="rank_value"><%= rankValue %></p>
    <p id="birthday_value"><%= birthdayValue %></p>
    <p id="email_value"><%= emailValue %></p>
    <p id="phonenumber_value"><%= phonenumberValue %></p> -->
</body>
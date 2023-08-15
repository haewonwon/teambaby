<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!-- 데이터베이스 탐색 및 설정해주는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스 연결 라이브러리 -->
<%@ page import="java.sql.Connection" %>
<!-- 데이터베이스로 sql 전송해주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<!-- ResultSet : 데이터베이스 쿼리의 결과 집합을 나타내는 Java 인터페이스 -->
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
// 앞 페이지에서 오는 데이터에 대해서 한글 인코딩
request.setCharacterEncoding("UTF-8");

String idValue = (String) session.getAttribute("id");

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/imitation", "haewon", "kjneeke0609@");

String query = "SELECT name, rank, birthday, email, phone FROM user WHERE id = ?";
PreparedStatement statement = connection.prepareStatement(query);
statement.setString(1, idValue);

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

List<ArrayList<String>> teamMembers = new ArrayList<>();

    if ("팀장".equals(rankValue)) {
        query = "SELECT name, rank, birthday, email, phone FROM user WHERE rank = '팀원'";
        statement = connection.prepareStatement(query);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ArrayList<String> memberData = new ArrayList<>();
            memberData.add(resultSet.getString("name"));
            memberData.add(resultSet.getString("rank"));
            memberData.add(resultSet.getString("birthday"));
            memberData.add(resultSet.getString("email"));
            memberData.add(resultSet.getString("phone"));
            teamMembers.add(memberData);
        }
    }

    String yearParam = request.getParameter("year");
    String monthParam = request.getParameter("month");
    
    int year = 0;
    int month = 0;

    year = Integer.parseInt(yearParam);
    month = Integer.parseInt(monthParam);
    
    String planQuery = "SELECT content, schedule_date, start_time FROM schedule"
    + " WHERE id = ?"
    + " AND YEAR(schedule_date) = ?"
    + " AND MONTH(schedule_date) = ?"
    + " ORDER BY schedule_date ASC, start_time ASC";
    
    PreparedStatement planStatement = connection.prepareStatement(planQuery);
    planStatement.setString(1, idValue);
    planStatement.setInt(2, year);
    planStatement.setInt(3, month);
    ResultSet rs = planStatement.executeQuery();

ArrayList<String> scheduleList = new ArrayList<>();
    while (rs.next()) {
        String content = rs.getString("content");
        String scheduleDate = rs.getString("schedule_date");
        String startTime = rs.getString("start_time");
        String scheduleInfo = "Date: " + scheduleDate + ", Time: " + startTime + ", Content: " + content;
            scheduleList.add(scheduleInfo);
        }
        request.setAttribute("scheduleList", scheduleList);

%>

<script>

    var scheduleArray = <%= scheduleList %>
    
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/formpage.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
</head>

<body>

    <header>

        <button onclick="menuBtnClickEvent()">
            <img class="menu_btn" src="../icon/free-icon-menu-2976215.png">
        </button>

        <div class="logo_container">
            <img class="stageus_logo" src="../icon/stageus_logo_white.png">
        </div>

    </header>

    <nav id="side_menu">
        <table>
            <tr>
                <td><%= nameValue %></td>
                <td><%= rankValue %></td>
                <td></td>
            </tr>
            <tr>
                <td><%= birthdayValue %></td>
            </tr>
            <tr>
                <td><%= emailValue %></td>
            </tr>
            <tr>
                <td><%= phonenumberValue %></td>
            </tr>
        </table>
    
        <% if ("팀장".equals(rankValue)) { %>
            <!-- 팀원들의 정보 표시 -->
            <table>
                <% for (ArrayList<String> member : teamMembers) { 
                    if (!member.get(0).equals(nameValue)) { %>
                        <tr>
                            <td><%= member.get(0) %></td>
                            <td><%= member.get(1) %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><%= member.get(2) %></td>
                        </tr>
                        <tr>
                            <td><%= member.get(3) %></td>
                        </tr>
                        <tr>
                            <td><%= member.get(4) %></td>
                        </tr>
                    <% } %>
                <% } %>
            </table>
        <% } %>
        <a href="../jsp (action)/LogoutAction.jsp">Log Out</a>
    </nav>

    <div id="assistant_nav">

        <div id="date_box">
            <button id="minus_btn" onclick="changeYear(-1);"><img id="minus_btn" src="../icon/free-icon-arrow-right-6423875.png"></button>
            <span id="year_display" name="year_display"></span>
            <button id="plus_btn" onclick="changeYear(1);"><img id="plus_btn" src="../icon/free-icon-arrow-right-6423875.png"></button>

            <select id="date_select" name="date_select" onchange="updateDate()">
                <option value="1월">01</option>
                <option value="2월">02</option>
                <option value="3월">03</option>
                <option value="4월">04</option>
                <option value="5월">05</option>
                <option value="6월">06</option>
                <option value="7월">07</option>
                <option value="8월" selected>08</option>
                <option value="9월">09</option>
                <option value="10월">10</option>
                <option value="11월">11</option>
                <option value="12월">12</option>
            </select>
        </div>

        <button id="btn_add" onclick="windowOpen()"><img src="../icon/free-icon-addition-thick-symbol-20183.png"></button>

    </div>

    <main id="schedule_main">
        
    </main>

    <script type="text/javascript" src="../js/main.js"></script>
</body>
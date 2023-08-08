<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/formpage.css">
</head>
<body>

    <header>
        <button>
            <img class="stageus_logo" src="../icon/stageus_logo_white.png">
        </button>
    </header>

    <nav role="navigation">
        <div id="menuToggle">
            <input type="checkbox" />
            <span></span>
            <span></span>
            <span></span>
            <ul id="menu">
                <p id="name_value"><%= nameValue %></p>
                <p id="rank_value"><%= rankValue %></p>
                <p id="birthday_value"><%= birthdayValue %></p>
                <p id="email_value"><%= emailValue %></p>
                <p id="phonenumber_value"><%= phonenumberValue %></p>
            </ul>
        </div>
    </nav>


    <h1 class="form_title">PW 찾기</h1>

    <form>

        <table>

            <tr class="input_form_box">
                <td>
                    <p>이름</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="name_value">
                    <div class="error_message" id="error_name_find_pw"></div>
                </td>
            </tr>
            <tr class="input_form_box">
                <td>
                    <p>휴대전화 번호</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="phonenumber_value">
                    <div class="error_message" id="error_number_find_pw"></div>
                </td>
            </tr>
            <tr class="input_form_box">
                <td>
                    <p>이메일</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="email_value">
                    <div class="error_message" id="error_email_find_pw"></div>
                </td>
            </tr>

        </table>

        <div class="btn_form_box">
            <input type="button" class="btn_form" id="btn_cancel" value="취소">
            <input type="submit" class="btn_form" id="btn_find_pw" value="확인">
        </div>

    </form>

    <jsp:include page="../jsp (action)/navAction.jsp" />
    <script type="text/javascript" src="../js/FindPw.js"></script>
</body>
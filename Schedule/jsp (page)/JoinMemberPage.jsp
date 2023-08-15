<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/formpage.css">
    <link rel="stylesheet" type="text/css" href="../css/JoinMemberPage.css">
</head>
<body>

    <header>

        <button onclick="btnClickEvent()">
            <img class="menu_btn" src="../icon/free-icon-menu-2976215.png">
        </button>

        <div class="logo_container">
            <img class="stageus_logo" src="../icon/stageus_logo_white.png">
        </div>

    </header>

    <h1 class="form_title">회원가입</h1>

    <form id="join_mamber_form" action="../jsp (action)/JoinMemberAction.jsp">

        <table>

            <tr class="input_form_box">
                <td>
                    <p>이름</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="name_value" name="name_value" minlength="2" maxlength="7">
                    <div class="error_message" id="error_name"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>이메일</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="email_value" name="email_value" maxlength="320">
                    <input type="button" class="btn_overlap" id="btn_overlap_email" value="중복" onclick="openCheckEmail()">
                    <div class="error_message" id="error_email"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>비밀번호</p>
                </td>

                <td>
                    <input type="password" class="input_form" id="pw_value" name="pw_value" minlength="6" maxlength="20">
                    <div class="error_message" id="error_pw"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>비밀번호 확인</p>
                </td>

                <td>
                    <input type="password" class="input_form" id="pwCheck_value" name="pwCheck_value" minlength="6" maxlength="20">
                    <div class="error_message" id="error_pw_check"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>직급</p>
                </td>

                <td>
                    <select class="input_form" id="select_rank" name="select_rank">
                        <option value="팀원" selected>팀원</option>
                        <option value="팀장">팀장</option>
                    </select>
                    <div class="error_message" id="error_rank"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>생년월일</p>
                </td>

                <td>
                    <input type="date" class="input_form" id="birthday_value" name="birthday_value">
                    <div class="error_message" id="error_birthday"></div>
                </td>
            </tr>

            <tr class="input_form_box">
                <td>
                    <p>휴대전화 번호</p>
                </td>

                <td>
                    <input type="text" class="input_form" id="phonenumber_value" name="phonenumber_value">
                    <input type="button" class="btn_overlap" id="btn_overlap_phonenumber" value="중복" maxlength="11" onclick="openCheckNumber()">
                    <input type="hidden" id="numberCheckResult" name="numberCheckResult" value="">
                    <div class="error_message" id="error_number"></div>
                </td>
            </tr>

        </table>

        <div class="btn_form_box">
            <input type="button" class="btn_form" id="btn_cancel" value="취소">
            <input type="button" class="btn_form" id="btn_join" value="확인" onclick="submitChecking()">
        </div>

    </form>
    
    <script type="text/javascript" src="../js/JoinMember.js"></script>
</body>
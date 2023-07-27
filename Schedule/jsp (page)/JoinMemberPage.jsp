<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/formpage.css">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <link rel="stylesheet" type="text/css" href="../css/JoinMemberPage.css">
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
               <div>김해원</div>
               <div>팀원</div>
               <div>2002.02.21</div>
               <div>jephpp@naver.com</div>
               <div>01030641864</div>
            </ul>
        </div>
    </nav>

    <div class="form_title">회원가입</div>

    <form id="join_mamber_form" action="../jsp (action)/JoinMemberAction.jsp">

        <div class="input_form_box">
            <p>이름</p>
            <input type="text" class="input_form" id="name_value" minlength="2" maxlength="7">
            <div class="error_message" id="error_name"></div>
        </div>

        <div class="input_form_box">
            <p>이메일</p>
            <input type="text" class="input_form" id="email_value" maxlength="320">
            <input type="button" class="btn_overlap" id="btn_overlap_email" value="중복">
            <div class="error_message" id="error_email"></div>
        </div>

        <div class="input_form_box">
            <p>비밀번호</p>
            <input type="password" class="input_form" id="pw_value" minlength="6" maxlength="20">
            <div class="error_message" id="error_pw"></div>
        </div>

        <div class="input_form_box">
            <p>비밀번호 확인</p>
            <input type="password" class="input_form" id="pwCheck_value" minlength="6" maxlength="20">
            <div class="error_message" id="error_pw_check"></div>
        </div>

        <div class="input_form_box">
            <p>직급</p>
            <select class="input_form" id="select_rank">
                <option value="team_member" selected>팀원</option>
                <option value="team_leader">팀장</option>
            </select>
            <div class="error_message" id="error_rank"></div>
        </div>

        <div class="input_form_box">
            <p>생년월일</p>
            <input type="date" class="input_form" id="birthday_value">
            <div class="error_message" id="error_birthday"></div>
        </div>

        <div class="input_form_box">
            <p>휴대전화 번호</p>
            <input type="text" class="input_form" id="phonenumber_value">
            <input type="button" class="btn_overlap" id="btn_overlap_phonenumber" value="중복" maxlength="11">
            <div class="error_message" id="error_number"></div>
        </div>

        <div class="btn_form_box">
            <input type="button" class="btn_form" id="btn_cancel" value="취소">
            <input type="submit" class="btn_form" id="btn_join" value="확인">
        </div>

    </form>
    
    <script type="text/javascript" src="../js/JoinMember.js"></script>
</body>
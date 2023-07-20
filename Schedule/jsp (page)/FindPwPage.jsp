<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/formpage.css">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
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


    <div class="form_title">PW 찾기</div>

    <form>

        <div class="input_form_box">
            <p>이름</p>
            <input type="text" class="input_form" id="name_value">
            <div class="error_message" id="error_name_find_pw"></div>
        </div>

        <div class="input_form_box">
            <p>휴대전화 번호</p>
            <input type="text" class="input_form" id="phonenumber_value">
            <div class="error_message" id="error_number_find_pw"></div>
        </div>

        <div class="input_form_box">
            <p>이메일</p>
            <input type="text" class="input_form" id="email_value">
            <div class="error_message" id="error_email_find_pw"></div>
        </div>

        <div class="btn_form_box">
            <input type="button" class="btn_form" id="btn_cancel" value="취소">
            <input type="submit" class="btn_form" id="btn_find_pw" value="확인">
        </div>

    </form>

    <script type="text/javascript" src="../js/FindPw.js"></script>
</body>
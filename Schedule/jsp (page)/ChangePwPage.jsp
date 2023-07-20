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

    <div class="form_title">PW 변경하기</div>

    <form>

        <div class="input_form_box">
            <p>새로운 비밀번호</p>
            <input type="password" class="input_form" id="pw_value">
            <div class="error_message" id="error_pw_change_pw"></div>
        </div>

        <div class="input_form_box">
            <p>비밀번호 확인</p>
            <input type="password" class="input_form" id="pw_check_value">
            <div class="error_message" id="error_pw_check_change_pw"></div>
        </div>

        <div class="btn_form_box">
            <input type="button" class="btn_form" id="btn_cancel" value="취소">
            <input type="submit" class="btn_form" id="btn_change_pw" value="변경하기">
        </div>

    </form>

    <script type="text/javascript" src="../js/ChangePw.js"></script>
</body>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

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

    <div id="assistant_nav">

        <!-- <input type="number" id="year" name="year" step="1" value="2023" min="1900" max="2099">
        <input type="month"> -->
        <button id="btn_add"><img src="../icon/free-icon-addition-thick-symbol-20183.png"></button>

    </div>

    <div class="modal" id="modal">
        <div class="modal_content">
            <span class="close" id="close">&times;</span>
            <p>새로운 이벤트</p>
            <div>
                <input type="text" id="schedule_content" placeholder="일정">
                <div class="error_message" id="error_content"></div>
            </div>
            <div>
                <p>날짜</p>
                <input type="date" id="schedule_date">
                <div class="error_message" id="error_date"></div>
            </div>
            <div>
                <p>시작 시간</p>
                <input type="time" id="schedule_time">
                <div class="error_message" id="erroe_time"></div>
            </div>
            <button id="btn_save">확인</button>
        </div>
    </div>

    <main>
        
    </main>
    
    <script type="text/javascript" src="../js/main.js"></script>
</body>
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
                
            </ul>
        </div>
        <div id="member_info">

        </div>
    </nav>

    <div id="assistant_nav">

        <div id="date_box">
            <button id="minus_btn" onclick="minusBtnClickEvent()"><img id="minus_btn" src="../icon/free-icon-arrow-right-6423875.png"></button>
            <span id="year_display"></span>
            <button id="plus_btn" onclick="plusBtnClickEvent()"><img id="plus_btn" src="../icon/free-icon-arrow-right-6423875.png"></button>

            <select id="date_select">
                <option value="1월">1월</option>
                <option value="2월">2월</option>
                <option value="3월">3월</option>
                <option value="4월">4월</option>
                <option value="5월">5월</option>
                <option value="6월">6월</option>
                <option value="7월">7월</option>
                <option value="8월" selected>8월</option>
                <option value="9월">9월</option>
                <option value="10월">10월</option>
                <option value="11월">11월</option>
                <option value="12월">12월</option>
            </select>
        </div>

        <button id="btn_add" onclick="windowOpen()"><img src="../icon/free-icon-addition-thick-symbol-20183.png"></button>

    </div>

    <main id="schedule_main">
        
    </main>
    
    <script type="text/javascript" src="../js/main.js"></script>
</body>
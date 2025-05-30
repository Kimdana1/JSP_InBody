<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String heightStr = request.getParameter("height");
    String weightStr = request.getParameter("weight");

    double height = 0;
    double weight = 0;
    double bmi = 0;
    String state = "";
    String food = "";
    String exercise = "";
    String bmiFormatted = "-";
    String arrowStyle = "";

    try {
        height = Double.parseDouble(heightStr) / 100.0;
        weight = Double.parseDouble(weightStr);
        bmi = weight / (height * height);
        bmiFormatted = String.format("%.2f", bmi);

        if (bmi < 18.5) {
            state = "저체중";
            food = "추천 식단: 닭가슴살(단백질), 아보카도(지방), 현미밥(탄수화물)";
            exercise = "운동 추천: 가벼운 근력운동 20분 (100kcal 소모)";
        } else if (bmi < 25) {
            state = "정상";
            food = "추천 식단: 고구마(탄수화물), 계란(단백질), 브로콜리(비타민)";
            exercise = "운동 추천: 유산소 운동 30분 (200kcal 소모)";
        } else if (bmi < 30) {
            state = "과체중";
            food = "추천 식단: 샐러드(식이섬유), 두부(단백질), 현미밥(탄수화물)";
            exercise = "운동 추천: 빠르게 걷기 40분 (250kcal 소모)";
        } else {
            state = "비만";
            food = "추천 식단: 오트밀(저GI), 닭가슴살(단백질), 야채류(식이섬유)";
            exercise = "운동 추천: 조깅 30분 + 근력운동 20분 (350kcal 소모)";
        }

        double arrowLeft = 0;
        if (bmi < 18.5) {
            arrowLeft = (bmi / 18.5) * 15;
        } else if (bmi < 25) {
            arrowLeft = 15 + ((bmi - 18.5) / (25 - 18.5)) * 45;
        } else if (bmi < 30) {
            arrowLeft = 60 + ((bmi - 25) / 5) * 25;
        } else {
            arrowLeft = 85 + ((bmi - 30) / 10) * 15;
            if (arrowLeft > 100) arrowLeft = 100;
        }

        arrowStyle = String.format("left: %.1f%%;", arrowLeft);
    } catch (Exception e) {
        state = "입력 오류";
        food = "※ 숫자(cm, kg)로만 입력해 주세요.";
        exercise = "-";
        arrowStyle = "display: none;";
    }
%>
<html>
<head>
    <title>BMI 결과</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .result { font-size: 18px; margin-bottom: 10px; }
        .warning { color: red; }

        .bmi-wrapper { position: relative; margin: 30px 0 10px 0; }

        .bmi-top-labels {
            display: flex;
            align-items: center;
            font-size: 14px;
            margin-bottom: 4px;
            justify-content: space-between;
        }

        .bmi-top-labels div:first-child {
            width: 40px;
            font-weight: bold;
        }

        .bmi-bar {
            display: flex;
            height: 25px;
            margin-top: 5px;
        }

        .bmi-bar div {
            text-align: center;
            font-size: 13px;
            line-height: 25px;
            color: white;
        }

        .underweight { background-color: #a6d96a; width: 15%; }
        .normal      { background-color: #67a9cf; width: 45%; }
        .overweight  { background-color: #fdae61; width: 25%; }
        .obese       { background-color: #d7191c; width: 15%; }

        .bmi-labels {
            display: flex;
            font-size: 14px;
            margin-top: 6px;
        }

        .bmi-labels div {
            text-align: center;
            font-weight: normal;
        }

        .bmi-labels div:nth-child(1) { width: 15%; text-align: left; }
        .bmi-labels div:nth-child(2) { width: 45%; }
        .bmi-labels div:nth-child(3) { width: 25%; }
        .bmi-labels div:nth-child(4) { width: 15%; text-align: right; }

        .arrow {
            position: absolute;
            top: -20px;
            transform: translateX(-50%);
            font-size: 20px;
            color: black;
        }
    </style>
</head>
<body>
    <h2>BMI 결과</h2>

    <div class="bmi-wrapper">
        <div class="arrow" style="<%= arrowStyle %>">▼</div>

        <div class="bmi-top-labels">
            <div>BMI</div>
        </div>

        <div class="bmi-bar">
            <div class="underweight">저체중</div>
            <div class="normal">정상</div>
            <div class="overweight">과체중</div>
            <div class="obese">비만</div>
        </div>

        <div class="bmi-labels">
            <div>18.5</div>
            <div>25</div>
            <div>30</div>
            <div>40</div>
        </div>
    </div>

    <div class="result">입력한 키: <%= heightStr %> cm</div>
    <div class="result">입력한 몸무게: <%= weightStr %> kg</div>
    <div class="result">
        <% if (!state.equals("입력 오류")) { %>
            당신의 BMI는 <b><%= bmiFormatted %></b> 입니다.
        <% } else { %>
            <span class="warning"><%= food %></span>
        <% } %>
    </div>
    <div class="result">상태: <b><%= state %></b></div>
    <div class="result"><%= food %></div>
    <div class="result"><%= exercise %></div>

    <br>
    <a href="bmiForm.jsp" style="display:inline-block; padding:10px 20px; background:#007acc; color:white; text-decoration:none; border-radius:5px;">
        다시 계산하기
    </a>
</body>
</html>

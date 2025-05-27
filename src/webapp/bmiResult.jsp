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

    try {
        height = Double.parseDouble(heightStr) / 100.0; // cm → m
        weight = Double.parseDouble(weightStr);
        bmi = weight / (height * height);

        if (bmi < 18.5) {
            state = "저체중";
            food = "추천 식단: 닭가슴살(단백질), 아보카도(지방), 현미밥(탄수화물)";
            exercise = "운동 추천: 가벼운 근력운동 20분 (100kcal 소모)";
        } else if (bmi < 23) {
            state = "정상";
            food = "추천 식단: 고구마(탄수화물), 계란(단백질), 브로콜리(비타민)";
            exercise = "운동 추천: 유산소 운동 30분 (200kcal 소모)";
        } else if (bmi < 25) {
            state = "과체중";
            food = "추천 식단: 샐러드(식이섬유), 두부(단백질), 현미밥(탄수화물)";
            exercise = "운동 추천: 빠르게 걷기 40분 (250kcal 소모)";
        } else if (bmi < 30) {
            state = "비만";
            food = "추천 식단: 오트밀(저GI), 닭가슴살(단백질), 야채류(식이섬유)";
            exercise = "운동 추천: 조깅 30분 + 근력운동 20분 (350kcal 소모)";
        } else {
            state = "고도비만";
            food = "추천 식단: 샐러드 위주 식단, 탄수화물 제한";
            exercise = "운동 추천: 수영 또는 자전거 1시간 (500kcal 소모)";
        }
    } catch (Exception e) {
        state = "입력 오류";
        food = "※ 숫자(cm, kg)로만 입력해 주세요.";
        exercise = "-";
    }
%>
<html>
<head>
    <title>BMI 결과</title>
    <style>
        body { font-family: sans-serif; margin: 20px; }
        .result { font-size: 18px; margin-bottom: 10px; }
        .warning { color: red; }
    </style>
</head>
<body>
    <h2>BMI 결과</h2>

    <div class="result">입력한 키: <%= heightStr %> cm</div>
    <div class="result">입력한 몸무게: <%= weightStr %> kg</div>
    <div class="result">당신의 BMI는 <b><%= String.format("%.2f", bmi) %></b> 입니다.</div>
    <div class="result">상태: <b><%= state %></b></div>
    <div class="result"><%= food %></div>
    <div class="result"><%= exercise %></div>

    <br>
    <a href="bmiForm.jsp">다시 계산하기</a>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>BMI 계산기</title></head>
<body>
    <h2>BMI 계산기</h2>
    <form action="bmiResult.jsp" method="post">
        키 (cm): <input type="text" name="height" required><br>
        몸무게 (kg): <input type="text" name="weight" required><br>
        <input type="submit" value="계산하기">
    </form>
</body>
</html>

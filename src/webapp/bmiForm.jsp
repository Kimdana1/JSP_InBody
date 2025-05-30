<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>BMI 계산기</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }

        form {
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #error {
            color: red;
            margin-top: 10px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007acc;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005fa3;
        }
    </style>

    <script>
        function validateForm() {
            const height = document.forms["bmiForm"]["height"].value.trim();
            const weight = document.forms["bmiForm"]["weight"].value.trim();
            const errorDiv = document.getElementById("error");

            const heightNum = parseFloat(height);
            const weightNum = parseFloat(weight);

            if (isNaN(heightNum) || isNaN(weightNum)) {
                errorDiv.textContent = "※ 숫자(cm, kg)로만 입력해 주세요.";
                return false;
            }

            errorDiv.textContent = "";
            return true;
        }
    </script>
</head>
<body>
    <h2>BMI 계산기</h2>
    <form name="bmiForm" action="bmiResult.jsp" method="post" onsubmit="return validateForm()">
        <label for="height">키 (cm)</label>
        <input type="text" name="height" required>

        <label for="weight">몸무게 (kg)</label>
        <input type="text" name="weight" required>

        <div id="error"></div>
        <input type="submit" value="계산하기">
    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="./css/Find_id.css">
</head>
<body>
    <h2>아이디 찾기</h2>
    <form action="Find_id_form.jsp" method="post">
        이름: <input type="text" name="name" required><br>
        생년월일: <input type="date" name="birthdate" required><br>
        <button type="submit">아이디 찾기</button>
        <button type="submit"onclick="window.location.href='login.jsp';">취소</button>
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="./css/Find_password.css">
</head>
<body>
    <h2>비밀번호 찾기</h2>
    <form action="Find_password_form.jsp" method="post">
        아이디: <input type="text" name="userid" required><br>
        이메일: <input type="email" name="email" required><br>
        <button type="submit">비밀번호 찾기</button>
        <button type="submit"onclick="window.location.href='login.jsp';">취소</button>
    </form>
</body>
</html>
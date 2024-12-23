<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 기존 사용자 정보 가져오기
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("fullEmail");
    java.sql.Date birthdate = (java.sql.Date) session.getAttribute("birthdate");
    String newPassword = request.getParameter("newPassword");  // 수정된 비밀번호 받기
    
    if (newPassword != null && !newPassword.isEmpty()) {
        session.setAttribute("userpassword", newPassword);  // 세션에 새로운 비밀번호 저장
    }
%>
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
</head>
<body>
    <h2>정보 수정</h2>
    <form action="Mypage_Update_form.jsp" method="POST">
        <label for="newName">이름:</label>
        <input type="text" id="newName" name="newName" value="<%= name %>" required>
        
        <label for="newEmail">이메일:</label>
        <input type="email" id="newEmail" name="newEmail" value="<%= session.getAttribute("email") %>" required>
        
        <label for="newBirthdate">생년월일:</label>
        <input type="date" id="newBirthdate" name="newBirthdate" value="<%= birthdate %>" required>
        
        <label for="newPassword">새 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword">
        
        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword">
        
        <input type="submit" value="수정 완료">
    </form>
</body>
</html>

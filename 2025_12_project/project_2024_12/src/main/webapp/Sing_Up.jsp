<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면</title>
<link rel="stylesheet" href="./css/Sing_up.css">
<link rel="stylesheet" href="./css/Header.css"> 
<link rel="stylesheet" href="./css/Footer.css">
</head>
<body>
  <header>
      <div class="logo" onclick="location.href = './main.jsp'"> 로고(이미지나 글)</div>
        <div class="menu" onclick="location.href = './Board.jsp'">  게시판</div>
        <div class="members">
        <%            
        String user = (String) session.getAttribute("userid");
        if (user != null) {
    %>
        <div class="user-info">
          <span><%= session.getAttribute("name") %>님 환영합니다!</span>
          <button onclick="location.href='./MyPage.jsp'">마이페이지</button>
        </div>
    <% 
      } else {
    %>
        <div class="login" onclick="location.href = './login.jsp'">로그인</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">회원가입</div>
    <% 
      }
    %>
        </div>
    </header>
  <main>
  <form action="Sing_up_form.jsp" onsubmit="combineEmail()" >
      <table>
      <tr><td><h2>회원가입</h2></td></tr>
      <tr><td>아이디</td></tr>
      <tr><td><input  type="text" name="userid" required placeholder="아이디를 입력하세요." 
        class="box"></td></tr>
      <tr><td>비밀번호</td></tr>
      <tr><td><input  type="password" name="userpassword" required placeholder="비밀번호를 입력하세요." 
        class="box"></td></tr>
      <tr><td>비밀번호 확인</td></tr>
      <tr><td><input type="password" name="userpassword2" required placeholder="비밀번호를 재입력하세요." 
        class="box"></td></tr>
      <tr><td>이름</td></tr>
      <tr><td ><input type="text" name="name" required class="box"></td></tr>
      <tr><td>생년월일</td></tr>
      <tr><td><input type="date" name="birthdate" class="box"></td></tr>
      <tr><td>이메일</td></tr>
      <tr>
      <td>
        <input type="text" name="email" required class="email" id="email"> @
        <select id="email-domain" name="email-domain" id="email-domain">
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="daum.net">daum.net</option>
            <option value="daum.net">nete.com</option>
        </select>
        </td>
        </tr>
        <input type="hidden" name="fullEmail" id="fullEmail">
      <tr><td>
        <input type="submit" value="가입완료" class="btn">
        <input type="button" value="취소" class="btn" onclick="location.href='./login.jsp'">
        </td></tr>
      </table>
  </form>
  <script>
  function combineEmail() {
    // 이메일과 도메인을 가져옴
    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('email-domain').value;
    console.log('email:', email);
    console.log('emailDomain:', emailDomain);
    
    // 이메일과 도메인을 합쳐서 fullEmail 값으로 설정
    var fullEmail = email + '@' + emailDomain;
    
    // hidden 필드에 값을 넣어 서버로 전송
    document.getElementById('fullEmail').value = fullEmail;
  }
</script>
</main>
<footer>
</footer>
</body>
</html>
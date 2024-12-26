<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 화면</title>
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/Header.css">
<link rel="stylesheet" href="./css/Footer.css">
<style>
	
</style>
</head>
<body>
  <header>
    <div class="logo"> 로고(이미지나 글)</div>
    <div class="muen"  onclick="location.href = './AP.jsp'"> 메뉴</div>
    <div class="members">
        <div class="login" onclick="location.href = './login.jsp'">로그인(이미지나 글)</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">회원가입(이미지나 글)</div>
    </div>
  </header>
  <main>
  <form  action="login_form.jsp" method="post">
    <table>
        <tr>
            <td><h2 class="bac"> 로그인 </h2></td>
        </tr>
        <tr>
            <td><input type="text" name="userid" placeholder="아이디" class="box"></td>
        </tr>
        <tr>
            <td><input type="password" name="userpassword" placeholder="비밀번호" class="box"></td>
        </tr>
        <tr>
            <td><input type="submit" class="btn" value="로그인" ></td>
        </tr>
        <tr>
          <td> <a href="Find_id.jsp">아이디 찾기</a>   
            <a href="Find_password.jsp">비밀번호 찾기</a>
            <a href="Sing_Up.jsp">회원가입</a>
          </td> 
      </tr>
    </table>
    </form>
 </main>
 <footer>
    <div class="footer_1"> SNS 사진 총 4개</div>
    <div class="footer_2"> 이쁜 로고 및 사진</div>
    <div class="footer_3"> 깃 허브 주소 </div>
</footer>
</body>
</html>
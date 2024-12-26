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
    </footer>
</body>
</html>
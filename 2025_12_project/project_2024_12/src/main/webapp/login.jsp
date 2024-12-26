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
        <div class="footer_1">
            <div>로고</div>
            <div class="sns">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div>세부 내용</div>
        </div>
        <div class="footer_2"> 
           <div>고객 서비스 링크</div>
            <ul>
                <li> 사용 가이드</li>
                <li> 자주 묻는 질문 (FAQ)</li>
                <li>가격 정채 페이지</li>
                <li> 고객 지원 / 고객 센터</li>
            </ul>
        </div>
        <div class="footer_3"> 
             <div>정책 관련 링크 </div>
            <ul>
                <li>개인정보 처리 방침</li>
                <li> 사이트 이용 약관</li>
                <li>  쿠키 정책</li>
            </ul>
        </div>
        <div class="footer_4"> 
           <div>저작권 정보 </div> 
            <ul>
                <li>웝사이트 소유자 정보</li>
                <li>웹사이트 저작권 정보 (연도 및 소유자)</li>
            </ul>
        </div>
    </footer>
</body>
</html>
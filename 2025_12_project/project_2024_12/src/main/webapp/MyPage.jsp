<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%	
	
	// 세션에서 로그인된 사용자 정보 가져오기
	String userid = (String) session.getAttribute("userid");
	String name = (String) session.getAttribute("name");
	String email = (String) session.getAttribute("fullEmail");
	java.sql.Date birthdate = (java.sql.Date) session.getAttribute("birthdate");
	java.sql.Timestamp lastUpdated = (java.sql.Timestamp) session.getAttribute("lastUpdated");
	java.sql.Date signupDate = (java.sql.Date) session.getAttribute("signup_date");
	java.sql.Timestamp signupTimestamp = new java.sql.Timestamp(signupDate.getTime());
	

	// 마지막 수정 시간 표시용 (null이 아닐 경우 포맷팅)
    String lastUpdatedStr = (lastUpdated != null) ? new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(lastUpdated) : "수정된 정보 없음";
    String signupDateStr = (signupDate != null) ? new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(signupDate) : "왜없냐";
    
 	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지 화면</title>
  <link rel="stylesheet" href="./css/Mypage.css">
  <link rel="stylesheet" href="./css/Header.css">
  <link rel="stylesheet" href="./css/Footer.css">
  <script src="./js/Mypage.js">

  </script>
</head>
<body>
   <header>
      <div class="logo" onclick="location.href = './main.jsp'"></div>
        <div class="menu" onclick="location.href = './AP.jsp'">  게시판</div>
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
    <div class="mypage-container">
    <div class="content-wrapper">
        <aside class="sidebar">
        <div class="profile-section">
          <img src="./photos/pr.jpg" alt="프로필 이미지" class="profile-img">
          <h2><%= name %> 님 환영합니다.</h2>
          <p class="email"><%= session.getAttribute("email") %></p>
          <p class="birthdate">생년월일: <%= birthdate %></p>
        </div>
        <nav class="nav-section">
          <ul>
            <li onclick="showMain(1)" class="nav_section_box" id="nav_section_tag1"><a href="#account">계정 정보</a></li>
            <li ><a href="#logout" onclick="confirmLogout()">로그아웃</a></li>
          </ul>
        </nav>
      </aside>
      <main class="content-section" >
        <div class="content-section_box  content_js_1">
          <div class="card">
			<h3>계정 정보</h3>
            <p>아이디: <%= userid %></p>
            <p>이름: <%= name %></p>
            <p>이메일: <%= session.getAttribute("email") %></p>
            <p>생년월일: <%= birthdate %></p>
            <button onclick="showPasswordBox()">정보 수정</button>
            <button onclick="Mypage_Delete()">회원 탈퇴</button> 
            <p>회원가입 날짜: <%= signupDateStr %></p>
            <p >마지막 회원 정보 수정 날짜: <%= lastUpdatedStr %></p>
          </div>
        </div>
   		<!-- 비밀번호 입력란 (수정 버튼 클릭 후 보이게 됨) -->
        <div id="passwordBox" style="display:none;">
          <label for="passwordInput">비밀번호 확인:</label>
          <input type="password" id="passwordInput" name="passwordInput" required>
          <button onclick="verifyPassword()">확인</button>
          <button onclick="closePasswordBox()">취소</button>
          <p id="errorMessage" style="color:red; display:none;">비밀번호가 틀렸습니다. 다시 시도해주세요.</p>
        </div>

        <div class="content-section_box  content_js_2">
          <div class="card">
            <h3>주문 내역</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>차량 번호</th>
                        <th>차량 이름</th>
                        <th>주행 거리</th>
                        <th>차량 가격</th>
                    </tr>
                </thead>
          
            </table>
          </div>
        </div>
      </main>
    </div>
  </div>
  <footer>
</footer>
<script>
 	 function confirmLogout() {
	    var confirmLogout = confirm("정말 로그아웃 하시겠습니까?");
	    if (confirmLogout) {
	        window.location.href = 'logout.jsp';
	    } 
	}
     function Mypage_Delete() {
         var confirmDelete = confirm("정말 탈퇴하시겠습니까?");
         if (confirmDelete) {
           window.location.href = 'Mypage_Delete.jsp'; // 탈퇴 처리 페이지로 이동
         }
       }
     function showPasswordBox() {
         // 비밀번호 입력란을 보이게 함
         document.getElementById('passwordBox').style.display = 'block';
     }

     function closePasswordBox() {
         // 비밀번호 입력란을 숨김
         document.getElementById('passwordBox').style.display = 'none';
     }

     function verifyPassword() {
    	    var enteredPassword = document.getElementById("passwordInput").value.trim();
    	    // 세션에서 현재 비밀번호 값을 가져옴
    	    var currentPassword  = '<%= session.getAttribute("userpassword") != null ? session.getAttribute("userpassword") : "x" %>';
			
    	 // 콘솔 로그로 입력된 비밀번호와 세션 비밀번호를 확인
    	    console.log("입력한 비밀번호: " + enteredPassword);
    	    console.log("세션에서 가져온 비밀번호: " + currentPassword);

    	    
    	    if (currentPassword === null || currentPassword === "") {
    	        alert("세션에 비밀번호가 저장되지 않았습니다. 다시 로그인 해주세요.");
    	        window.location.href = 'login.jsp'; // 로그인 페이지로 리다이렉트
    	    } else {
    	        // 문자열로 비교
    	        if (enteredPassword == currentPassword) {
    	            // 비밀번호가 맞으면 수정 페이지로 이동
    	            window.location.href = 'Mypage_Update.jsp';
    	        } else {
    	            // 비밀번호가 틀리면 오류 메시지 표시
    	            document.getElementById('errorMessage').style.display = 'block';
    	        }
    	    }
    	   
    	}
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%String userid = (String) session.getAttribute("userid");%>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 추가 페이지</title>
    <link rel="stylesheet" href="./css/BoardInsert.css">
    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
</head>
<body>
    <header>
        <div class="logo" onclick="location.href = './Ev_page.jsp'"> 로고(이미지나 글)</div>
        <div class="muen"> 메뉴</div>
        <div class="members">
       <% 
      String user = (String) session.getAttribute("userid");
      if (userid != null) {
    %>
        <div class="user-info">
          <span><%= session.getAttribute("name") %>님 환영합니다!</span>
          <button onclick="location.href='./MyPage.jsp'">마이페이지</button>
        </div>
    <% 
      } else {
    %>
        <div class="login" onclick="location.href = './login.jsp'">로그인(이미지나 글)</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">회원가입(이미지나 글)</div>
    <% 
      }
    %>
        </div>
    </header>
    <div class="container">
        <h1>차량 추가</h1>
        <h2>차량 정보</h2>
        <div class="section1">
            <form id="addContent" action="./BoardInsertPage_Insert.jsp">
                <div class="car_type">종류 
                    <!-- <button class="selectButton1" value="light_car">경차</button>
                    <button class="selectButton" value="compact_car">승용차</button>
                    <button class="selectButton" value="SUV">SUV</button>
                    <button class="selectButton" value="heavy_car">트럭/화물</button>  -->
                   	<select>
                   		<option value="light_car">소형차</option>
                   		<option value="compact_car">중형차</option>
                   		<option value="SUV_car">SUV</option>
                   		<option value="heavy_car">트럭/화물</option>
                   	</select>

                    <div class="l_car_select">
		            	<div class="l_car_name">차 이름<input type="text" style='font-size:16pt' name="l_car_name"/></div>
		                <div class="l_mileage">주행 거리 <input type="text" style='font-size:16pt' name="l_mileage"/></div>
		                <div class="l_car_price">가격 <input type="text" style='font-size:16pt' name="l_car_price"/></div>
		                <!-- <div class="l_car_type">타입 <input type="text" style='font-size:16pt' name="l_car_type"/></div> -->                     
                    </div>
<!-- 		            	<div class="c_car_name">차 이름<input type="text" style='font-size:16pt'/></div>
 		                <div class="c_car_mileage">주행 거리 <input type="text" style='font-size:16pt'/></div>
		                <div class="c_car_price">가격 <input type="text" style='font-size:16pt'/></div>                     
		            	<div class="s_car_name">차 이름<input type="text" style='font-size:16pt'/></div>
		                <div class="s_car_mileage">주행 거리 <input type="text" style='font-size:16pt'/></div>
		                <div class="s_car_price">가격 <input type="text" style='font-size:16pt'/></div>                     
		            	<div class="h_car_name">차 이름<input type="text" style='font-size:16pt'/></div>
		                <div class="h_car_mileage">주행 거리 <input type="text" style='font-size:16pt'/></div>
		                <div class="h_car_price">가격 <input type="text" style='font-size:16pt'/></div>                         -->
                </div>
		        <div class="Buttons">
		            <button class="addButton">차량 등록</button>
		            <button>취소</button>
		        </div>
            </form>
        </div>
    </div>
    <footer>
        <div class="footer_1"> SNS 사진 총 4개</div>
        <div class="footer_2"> 이쁜 로고 및 사진</div>
        <div class="footer_3"> 깃 허브 주소 </div>
    </footer>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const button = document.getElementById(".addButton"); 
            button.addEventListener("click", function(event) {  
                event.preventDefault();
                if(inputValue = )
                newRegister(); 
            });
            
            const selectButton1 = document.querySelector(".selectButton1");
            selectButton1.addEventListener("click", function(event) {
            	selectType1();
            });
            
            if()
        });

        function newRegister() {
            /* if(!document.getElementsByClassName("l_car_name").value) {
                alert("차량 이름을 작성해주시기 바랍니다.");
                
                return;
            }
        
        	if(isNaN(document.getElementsByClassName("l_car_mileage").value) 
                || isNaN(document.getElementsByClassName("l_car_price").value)) {
                alert("주행거리와 가격은 숫자로 작성해주시기 바랍니다.");
                
                return;
            }
             */
            const addContent = document.getElementsById("addContent");
             addContent.submit();
        }
        
        function selectType1() {
            alert("select");
            
        }
    </script>
</body>
</html>
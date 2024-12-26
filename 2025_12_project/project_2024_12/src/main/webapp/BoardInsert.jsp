<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>차량 추가 페이지</title>
    <link rel="stylesheet" href="./css/BoardInsert.css">
    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
</head>
<body>
    <header>
        <div class="logo" onclick="location.href = './Ev_page.html'"> 로고(이미지나 글)</div>
        <div class="muen"> 메뉴</div>
        <div class="members">
            <div class="login" onclick="location.href = './Login.html'">로그인(이미지나 글)</div>
            <div class="Sing_Up" onclick="location.href = './Sing_Up.html'">회원가입(이미지나 글)</div>
        </div>
    </header>
    <div class="container">
        <h1>차량 추가</h1>
        <h2>차량 정보</h2>
       	<div class="buttonSection">
			<button class="selectButton" value="light_car" onclick="toggleContent('l_car_select');">소형차</button>
			<button class="selectButton" value="compact_car" onclick="toggleContent('c_car_select');">중형차</button>
			<button class="selectButton" value="SUV" onclick="toggleContent('s_car_select');">SUV</button>
			<button class="selectButton" value="heavy_car" onclick="toggleContent('h_car_select');">트럭/화물</button> 
			<p>차량 타입을 선택해 주세요.</p>
		</div> 
        <div class="section1">
			<form id="l_car_select" class="addContent" action="./BoardInsert_Insert_l.jsp" method="POST">
				<div id="l_car" class="content">
		            <div class="l_car_name">차 이름<input type="text" name="l_car_name"/></div>
	                <div class="l_mileage">주행 거리 <input type="text" name="l_mileage"/></div>
	                <div class="l_car_price">가격 <input type="text" name="l_car_price"/></div>
	                <div class="l_car_type">타입<input type="text" name="l_car_type" value="소형차" readonly/></div>
                </div>
                <div class="Buttons">
		            <button class="addButton" onclick="newRegister('l_car_select');">소형 차량 등록</button>
		       </div>
			</form>
		            <button class="cancelButton" onclick="location.href='./Board.jsp'">취소</button>
			<form id="c_car_select" class="addContent" action="./BoardInsert_Insert_c.jsp" style="display:none;" method="POST">
				<div id="c_car" class="content">
					<div class="c_car_name">차 이름<input type="text" name="c_car_name"/></div>
					<div class="c_mileage">주행 거리 <input type="text" name="c_mileage"/></div>
					<div class="c_car_price">가격 <input type="text" name="c_car_price"/></div>
					<div class="c_car_type">타입<input type="text"  name="c_car_type" value="중형차" readonly/></div>
				</div>
				<div class="Buttons">
					<button class="addButton"  onclick="newRegister('c_car_select');">중형 차량 등록</button>
				</div>                      
			</form>
			 <button class="cancelButton" onclick="location.href='./Board.jsp'">취소</button>
			<form id="s_car_select" class="addContent" action="./BoardInsert_Insert_s.jsp" style="display:none;" method="POST">           		
                <div id="s_car" class="content">
		            <div class="s_car_name">차 이름<input type="text" name="s_car_name"/></div>
	                <div class="s_mileage">주행 거리 <input type="text" name="s_mileage"/></div>
	                <div class="s_car_price">가격 <input type="text" name="s_car_price"/></div>
	                <div class="s_car_type">타입<input type="text" name="s_car_type" value="SUV" readonly/></div>
                </div>
                <div class="Buttons">
		            <button class="addButton"  onclick="newRegister('s_car_select');">SUV 차량 등록</button>
		       </div>
           	</form> 
           	 <button class="cancelButton" onclick="location.href='./Board.jsp'">취소</button>
			<form id="h_car_select" class="addContent" action="./BoardInsert_Insert_h.jsp" style="display:none;" method="POST">
                <div id="h_car" class="content">
		            <div class="h_car_name">차 이름<input type="text" name="h_car_name"/></div>
	               	<div class="h_mileage">주행 거리 <input type="text" name="h_mileage"/></div>
	              	<div class="h_car_price">가격 <input type="text" name="h_car_price"/></div>
	              	<div class="h_car_type">타입<input type="text" name="h_car_type" value="트럭/화물" readonly/></div>
				</div>
				<div class="Buttons">
		            <button class="addButton"  onclick="newRegister('h_car_select');">트럭/화물 차량 등록</button>
				</div>                    
			</form>
			 <button class="cancelButton" onclick="location.href='./Board.jsp'">취소</button>
        </div>
    </div>
 <footer>
    </footer>
    <script>    	
        document.addEventListener("DOMContentLoaded", function() {
        	const addButton = document.getElementsByClassName("addButton"); 
        	for(i=0; i<addButton.length; i++) {
	            addButton[i].addEventListener("click", function(event) {  
	                newRegister(); 
	            });
        	} 
        });
	
        function toggleContent(target) {
        	var selectContent = document.getElementsByClassName("addContent");
        	for(var i=0; i<selectContent.length; i++) {
         		if(selectContent[i].id == target) {
         			selectContent[i].style.display = 'block';     
        		} else {        			
       				selectContent[i].style.display = 'none';
        		}
        	}
        };
        
        function newRegister() {
        	const content = document.getElementsByClassName("content");
        	console.log(content);
       		for(var i=0; i<content.length; i++) {        		
	        	if(content[i].id == "l_car") {
	        		content[i].submit();
	        	} else if(content[i].id == "c_car") {
	        		content[i].submit();
	        	} else if(content[i].id == "s_car") {
	        		content[i].submit();
	        	} else if(content[i].id == "h_car") {
	        		content[i].submit();
	        	}
        	} 
        };
    </script>
</body>
</html>
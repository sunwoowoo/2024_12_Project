<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.AP" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PC</title>
    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
    <link rel="stylesheet" href="./css/pc.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
        <div class = "section1">
            <div class="select"><button type="button" onclick="scrollToElement1()">엔진</button></div>
            <div class="select"><button type="button" onclick="scrollToElement2()">색상</button></div>
            <div class="select"><button type="button" onclick="scrollToElement3()">옵션</button></div>
        </div>
        <h2 class="title">엔진 선택</h2>
        <div id="targetElement1" class="section2">
            <div class="engine">
                <input type="radio" id="engine_sel1" name="engine_sel" value="gasolin" onclick="addCartEngine(event)" checked>
                <label for="engine_sel1">가솔린</label>
            </div>
            <div class="engine">
                <input type="radio" id="engine_sel2" name="engine_sel" value="lpg" onclick="addCartEngine(event)">
                <label for="engine_sel2">LPG</label>
            </div>
        </div>
        <h2 class="title">색상 선택</h2>
        <div id="targetElement2" class="section3">
            <div class="image_1">
                <div class="image_1_box  image_1_js_1">1</div>
                <div class="image_1_box  image_1_js_2">2</div>
                <div class="image_1_box  image_1_js_3">3</div>
                <div class="image_1_box  image_1_js_4">4</div>
                <div class="image_1_box  image_1_js_5">5</div>
            </div>
            <div class="color_box_1">
                <div class="color"  onclick="showMain_1(1)" id="color_box_1_tag1"><button type="button" class="color_sel" onclick="addCartColor(event)">1</button></div>
                <div class="color"  onclick="showMain_1(2)" id="color_box_1_tag2"><button type="button" class="color_sel" onclick="addCartColor(event)">2</button></div>
                <div class="color"  onclick="showMain_1(3)" id="color_box_1_tag3"><button type="button" class="color_sel" onclick="addCartColor(event)">3</button></div>
                <div class="color"  onclick="showMain_1(4)" id="color_box_1_tag4"><button type="button" class="color_sel" onclick="addCartColor(event)">4</button></div>
                <div class="color"  onclick="showMain_1(5)" id="color_box_1_tag5"><button type="button" class="color_sel" onclick="addCartColor(event)">5</button></div>
            </div>
        </div>
        <h2 class="title">옵션 선택</h2>
        <div id="targetElement3" class="section4">
            <div class="option"><input type="checkbox" id="option" onclick="addCartOption(event)" value="option1"><label for="option1">option1</label>
                <div>옵션 이미지</div>
            </div>
            <div class="option"><input type="checkbox" id="option" onclick="addCartOption(event)" value="option2"><label for="option2">option2</label>
                <div>옵션 이미지</div>
            </div>
            <div class="option"><input type="checkbox" id="option" onclick="addCartOption(event)" value="option3"><label for="option3">option3</label>
                <div>옵션 이미지</div>
            </div>
        </div>
        <div class="section5">
            <div class="totalCharge">총액
            <%
	            Connection conn = AP.getDBConnection();
	         	
	         	String sql = " SELECT c.color_name, e.engine_name, co.option_name, ci.car_bno "
	         			 + " FROM colors c, engines e, car_options co, car_info ci "
	         		  	 + " WHERE c.color_id = 1 "
		         		 + " AND e.engine_id = 1 "
	         		     + " AND co.option_id = 1";
	         	try {
	         		//PreparedStatement 얻기 및 값 지정
	         		PreparedStatement pstmt = conn.prepareStatement(sql);
	         		
	         		//SQL문 실행 후 ResultSet을 통해 데이터 읽기
	         		ResultSet rs = pstmt.executeQuery(); // SELECT문 실행
	         		while(rs.next()) { // rs의 0번째 커서에 데이터가 있으면 true
	         		
	        %>
	        	<div><%= rs.getString("") %></div>
                <div class="cart1">엔진
                    <div id="addEngine"><%= rs.getString("engine_name") %></div>
                </div>
                <div class="cart2">색상
                    <div id="addColor"><%= rs.getString("color_name") %></div>
                </div>
                <div class="cart3">옵션
                    <div id="addOption"><%= rs.getString("option_name") %></div>
                </div>
	        <%
		     		}
		     		AP.dbClose(conn, pstmt, rs);
	
		     	} catch(SQLException se) {
		     		se.printStackTrace();
		     		System.err.println("테이블 조회 에러");
		     	}
            %>
	            <div class="save">
	                <button class="save_btn">견적 저장</button>
	            </div>
            </div>
        </div>
        
    <footer>
        <div class="footer_1"> SNS 사진 총 4개</div>
        <div class="footer_2"> 이쁜 로고 및 사진</div>
        <div class="footer_3"> 깃 허브 주소 </div>
    </footer>
    <script type="text/javascript" src="./js/pc.js"></script>
</body>
</html>
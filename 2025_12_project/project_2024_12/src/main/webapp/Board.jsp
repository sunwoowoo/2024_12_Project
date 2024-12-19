<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company2.DBManager" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/Board.css">
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
        <div class="section1">
            <div class="bottons">
                <button>추가</button>
                <button>삭제</button>
            </div>
        </div>
        <div class="section2">
            <div class="content">
            <%
			 	Connection conn = DBManager.getDBConnection();
			 	
			 	String sql = " SELECT car_name, car_mileage, car_price, car_type " 
			 					+ " FROM car_list ";
			 	try {
			 		//PreparedStatement 얻기 및 값 지정
			 		PreparedStatement pstmt = conn.prepareStatement(sql);
			 		
			 		//SQL문 실행 후 ResultSet을 통해 데이터 읽기
			 		ResultSet rs = pstmt.executeQuery(); // SELECT문 실행
			 		while(rs.next()) { // rs의 0번째 커서에 데이터가 있으면 true
			%>
                <div class="car_box">
                    <div>차 이름 <%= rs.getString("car_name") %></div>
                    <div>주행 거리 <%= rs.getInt("car_mileage") %></div>
                    <div>가격 <%= rs.getInt("car_price") %></div>
                    <div>차 종류 <%= rs.getString("car_type") %></div>
                </div>
            <%
					}
					DBManager.dbClose(conn, pstmt, rs);
			
				} catch(SQLException se) {
					se.printStackTrace();
					System.err.println("테이블 조회 에러");
				}
			%>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer_1"> SNS 사진 총 4개</div>
        <div class="footer_2"> 이쁜 로고 및 사진</div>
        <div class="footer_3"> 깃 허브 주소 </div>
    </footer>
</body>
</html>
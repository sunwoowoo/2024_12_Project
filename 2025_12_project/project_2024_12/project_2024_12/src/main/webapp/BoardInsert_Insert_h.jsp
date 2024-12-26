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

	String hcarName = request.getParameter("h_car_name");
	
	String carMileage = request.getParameter("h_mileage");
	Integer hcarMileage = Integer.parseInt(carMileage);
	
	String carPrice = request.getParameter("h_car_price");
	Integer hcarPrice = Integer.parseInt(carPrice);
	
	String hcarType = request.getParameter("h_car_type");

	Connection conn = DBManager.getDBConnection();
	
	String sql = " INSERT INTO heavy_cars(h_car_bno, h_car_name, h_mileage, h_car_price, h_car_type) " 
					+ " VALUES (?, ?, ?, ?, ?) ";
	
	int rows = 0;
	try {
		PreparedStatement pstmt 
			= conn.prepareStatement(sql, new String[] {"h_car_bno"});
		pstmt.setInt(1, 111);	/* SEQ_BNO.NEXTVAL 실행 안됨 */
		pstmt.setString(2, hcarName);
		pstmt.setInt(3, hcarMileage);
		pstmt.setInt(4, hcarPrice);
		pstmt.setString(5, hcarType);
		
		// SQL문을 진짜 실행
		rows = pstmt.executeUpdate(); // 리턴값은 실제 insert한 행의 개수
		
		// DB자원 정리
		DBManager.dbClose(conn, pstmt, null);
	} catch (Exception e) {
		e.printStackTrace();
		//exit();
	}
	
%> 
<%= rows %>행이 저장되었습니다.
<script>
	location.href = './BoardInsertPage.jsp';
</script>
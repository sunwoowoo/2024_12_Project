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

	String ccarName = request.getParameter("c_car_name");
	String carMileage = request.getParameter("c_mileage");
	String carPrice = request.getParameter("c_car_price");
	String ccarType = request.getParameter("c_car_type");

	int ccarPrice = Integer.parseInt(carPrice);
	int ccarMileage = Integer.parseInt(carMileage);
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    int rows = 0;
	
	try {
		 conn = DBManager.getDBConnection();
		 String sql = " INSERT INTO compact_cars(c_car_bno, c_car_name, c_mileage, c_car_price, c_car_type) " 
				+ " VALUES (SEQ_BNO.NEXTVAL, ?, ?, ?, ?) ";


		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ccarName);
		pstmt.setInt(2, ccarMileage);
		pstmt.setInt(3, ccarPrice);
		pstmt.setString(4, ccarType);
		
		rows = pstmt.executeUpdate(); 
		
		DBManager.dbClose(conn, pstmt, null);
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		   
        DBManager.dbClose(conn, pstmt, null);
    }	
%> 
<%= rows %>행이 저장되었습니다.
<script>
	location.href = './Board.jsp';
</script>
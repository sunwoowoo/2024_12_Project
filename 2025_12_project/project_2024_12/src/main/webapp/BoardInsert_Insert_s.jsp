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

	String scarName = request.getParameter("s_car_name");
	String carMileage = request.getParameter("s_mileage");
	String carPrice = request.getParameter("s_car_price");
	String scarType = request.getParameter("s_car_type");

	int scarMileage = Integer.parseInt(carMileage);
	int scarPrice = Integer.parseInt(carPrice);
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    
    int rows = 0;
	try {
		 conn = DBManager.getDBConnection();
		  
	   String sql = " INSERT INTO suv(s_car_bno, s_car_name, s_mileage, s_car_price, s_car_type) " 
					+ " VALUES (SEQ_BNO.NEXTVAL,  ?, ?, ?, ?) ";
	    pstmt  = conn.prepareStatement(sql);
		pstmt.setString(1, scarName);	
		pstmt.setInt(2, scarMileage);
		pstmt.setInt(3, scarPrice);
		pstmt.setString(4, scarType);
		
	
		rows = pstmt.executeUpdate(); 


		DBManager.dbClose(conn, pstmt, null);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
   
        DBManager.dbClose(conn, pstmt, null);
	}
%> 
<%= rows %>행이 저장되었습니다.
<script>
	location.href = './Board.jsp';
</script>
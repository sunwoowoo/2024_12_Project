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
	Integer ccarMileage = Integer.parseInt(carMileage);
	
	String carPrice = request.getParameter("c_car_price");
	Integer ccarPrice = Integer.parseInt(carPrice);
	
	String ccarType = request.getParameter("c_car_type");

	Connection conn = DBManager.getDBConnection();
	
	String sql = " INSERT INTO compact_cars(c_car_bno, c_car_name, c_mileage, c_car_price, c_car_type) " 
					+ " VALUES (?, ?, ?, ?, ?) ";
	
	int rows = 0;
	try {
		PreparedStatement pstmt 
			= conn.prepareStatement(sql, new String[] {"c_car_bno"});
		pstmt.setInt(1, 112);	/* SEQ_BNO.NEXTVAL 실행 안됨 */
		pstmt.setString(2, ccarName);
		pstmt.setInt(3, ccarMileage);
		pstmt.setInt(4, ccarPrice);
		pstmt.setString(5, ccarType);
		
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
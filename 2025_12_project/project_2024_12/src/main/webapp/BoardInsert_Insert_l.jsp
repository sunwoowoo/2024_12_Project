<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.company1.DBManager" %>
<%
    // 한글 처리
    request.setCharacterEncoding("UTF-8");

    
    String lcarName = request.getParameter("l_car_name");
    String carMileage = request.getParameter("l_mileage");
    String carPrice = request.getParameter("l_car_price");
    String lcarType = request.getParameter("l_car_type");

  
    int lcarMileage = Integer.parseInt(carMileage);
    int lcarPrice = Integer.parseInt(carPrice);

    Connection conn = null;
    PreparedStatement pstmt = null;
    int rows = 0;

    try {
        
        conn = DBManager.getDBConnection();

   
        String sql = "INSERT INTO light_cars (l_car_bno, l_car_name, l_mileage, l_car_price, l_car_type) " +
                     "VALUES (SEQ_BNO.NEXTVAL, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, lcarName);
        pstmt.setInt(2, lcarMileage);
        pstmt.setInt(3, lcarPrice);
        pstmt.setString(4, lcarType);

 
        rows = pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace(); 
    } finally {
        DBManager.dbClose(conn, pstmt, null);
    }
%>
<%-- 결과 출력 --%>
<%= rows %>행이 저장되었습니다.
<script>
    location.href = './Board.jsp';
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.company1.DBManager" %>
<%
    // 한글 처리
    request.setCharacterEncoding("UTF-8");


    String hcarName = request.getParameter("h_car_name");
    String carMileage = request.getParameter("h_mileage");
    String carPrice = request.getParameter("h_car_price");
    String hcarType = request.getParameter("h_car_type");


    int hcarMileage = Integer.parseInt(carMileage);
    int hcarPrice = Integer.parseInt(carPrice);

    Connection conn = null;
    PreparedStatement pstmt = null;
    int rows = 0;

    try {

        conn = DBManager.getDBConnection();


        String sql = "INSERT INTO heavy_cars (h_car_bno, h_car_name, h_mileage, h_car_price, h_car_type) " +
                     "VALUES (SEQ_BNO.NEXTVAL, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, hcarName);
        pstmt.setInt(2, hcarMileage);
        pstmt.setInt(3, hcarPrice);
        pstmt.setString(4, hcarType);

   
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

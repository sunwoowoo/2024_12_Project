<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 파라미터 가져오기
    String carBnoStr = request.getParameter("car_bno");
    String category = request.getParameter("category");
    	
    // 초기값 검증
    if (carBnoStr == null || category == null || category.isEmpty()) {
        out.println("<script>alert('잘못된 요청입니다.'); location.href='Board.jsp';</script>");
        return;
    }

    int carBno;
    try {
        carBno = Integer.parseInt(carBnoStr);
    } catch (NumberFormatException e) {
        out.println("<script>alert('잘못된 차량 번호입니다.'); location.href='Board.jsp';</script>");
        return;
    }

    String sql = null;

    // 카테고리에 따라 SQL 결정
    switch (category) {
        case "light_cars":
            sql = "DELETE FROM LIGHT_CARS WHERE l_car_bno = ?";
            break;
        case "compact_cars":
            sql = "DELETE FROM COMPACT_CARS WHERE c_car_bno = ?";
            break;
        case "suv":
            sql = "DELETE FROM SUV WHERE s_car_bno = ?";
            break;
        case "heavy_cars":
            sql = "DELETE FROM HEAVY_CARS WHERE h_car_bno = ?";
            break;
        default:
            out.println("<script>alert('유효하지 않은 카테고리입니다.'); location.href='Board.jsp';</script>");
            return;
    }

    // DB 연결 및 삭제 실행
    try (Connection conn = DBManager.getDBConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, carBno);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>alert('삭제되었습니다.'); location.href='Board.jsp';</script>");
        } else {
            out.println("<script>alert('삭제 실패: 삭제할 데이터가 없습니다.'); location.href='Board.jsp';</script>");
        }
    } catch (SQLException e) {
        log("Error while deleting record", e);
        out.println("<script>alert('삭제 중 오류가 발생했습니다.'); location.href='Board.jsp';</script>");
    }
%>

<%
	// response객체는 응답에 대한 처리를 위한 jsp 객체
	response.sendRedirect("./Board.jsp");
%>
<script>
//	location.href= './webprogramming.jsp';
</script> 
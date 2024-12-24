<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.company1.DBManager" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String birthdate = request.getParameter("birthdate");

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        conn = DBManager.getDBConnection();

        // 이름과 생년월일로 아이디 찾기
        String sql = "SELECT userid FROM Users WHERE name = ? AND birthdate = ?";
        psmt = conn.prepareStatement(sql);
        psmt.setString(1, name);
        psmt.setString(2, birthdate);

        rs = psmt.executeQuery();

        if (rs.next()) {
            String foundUserId = rs.getString("userid");
            out.println("<script>alert('찾으신 아이디는 " + foundUserId + "입니다.'); window.location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('입력한 정보와 일치하는 아이디가 없습니다.'); history.back();</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>SQLException: " + e.getMessage() + "</h3>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>오류가 발생했습니다. 관리자에게 문의하세요.</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

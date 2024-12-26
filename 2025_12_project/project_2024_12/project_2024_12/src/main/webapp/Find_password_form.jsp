<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.company1.DBManager" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userid = request.getParameter("userid"); // 이름 대신 아이디를 사용
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        conn = DBManager.getDBConnection();

        // 아이디와 이메일로 비밀번호 찾기
        String sql = "SELECT userpassword FROM Users WHERE userid = ? AND email = ?";
        psmt = conn.prepareStatement(sql);
        psmt.setString(1, userid); // 이름 대신 userid로 수정
        psmt.setString(2, email);

        rs = psmt.executeQuery();

        if (rs.next()) {
            String foundPassword = rs.getString("userpassword");
            out.println("<script>alert('찾으신 비밀번호는 " + foundPassword + "입니다.'); window.location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('입력한 정보와 일치하는 비밀번호가 없습니다.'); history.back();</script>");
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

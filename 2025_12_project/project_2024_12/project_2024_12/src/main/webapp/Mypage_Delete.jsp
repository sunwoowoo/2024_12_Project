<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
  String userid = (String) session.getAttribute("userid");
  
  if (userid == null) {
      response.sendRedirect("login.jsp");
      return;
  }

  Connection conn = null;
  PreparedStatement psmt = null;
  try {
      // DB 연결
      String url = "jdbc:oracle:thin:@1.220.247.78:1522/orcl";
      String dbUser = "mini_2410_team2";
      String dbPassword = "1234";
      conn = DriverManager.getConnection(url, dbUser, dbPassword);

      // 사용자 정보 삭제 SQL
      String deleteUser = "DELETE FROM Users WHERE userid = ?";
      psmt = conn.prepareStatement(deleteUser);
      psmt.setString(1, userid);
      psmt.executeUpdate();

      // 세션 종료
      session.invalidate();
      response.sendRedirect("login.jsp");
  } catch (SQLException e) {
      e.printStackTrace();
      out.println("<h3>SQLException: " + e.getMessage() + "</h3>");
  } catch (Exception e) {
      e.printStackTrace();
      out.println("<h3>오류가 발생했습니다. 관리자에게 문의하세요.</h3>");
  } finally {
      try {
          if (psmt != null) psmt.close();
          if (conn != null) conn.close();
      } catch (SQLException e) {
          e.printStackTrace();
      }
  }
%>

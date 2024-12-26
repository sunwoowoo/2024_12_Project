<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Date" %>
<%

    // 한글 처리
    request.setCharacterEncoding("UTF-8");
%>
<%
	//세션에서 기존 비밀번호 가져오기
	String storedPassword = (String) session.getAttribute("userpassword");
	
	if (storedPassword == null) {
	 // 기존 비밀번호가 세션에 없을 경우 오류 처리
	 out.println("기존 비밀번호를 불러올 수 없습니다.");
	 return;
	}

    // 폼에서 전달받은 수정된 정보
    String newName = request.getParameter("newName");
    String newEmail = request.getParameter("newEmail");
    String newBirthdate = request.getParameter("newBirthdate");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword  = request.getParameter("confirmPassword");

 // 비밀번호 확인
    if (newPassword != null && !newPassword.isEmpty()) {
        if (!newPassword.equals(confirmPassword)) {
            out.println("비밀번호가 일치하지 않습니다.");
            return;
        }
    } else {
        // 비밀번호가 입력되지 않았다면 기존 비밀번호를 유지
        newPassword = storedPassword;  // 세션에서 저장된 비밀번호를 사용
    }

    // 세션에서 사용자 ID 가져오기
    String userid = (String) session.getAttribute("userid");

    // DB 연결 및 업데이트 처리
    Connection conn = null;
    PreparedStatement psmt = null;
    boolean updateSuccess = false;
    java.sql.Timestamp lastUpdated = new java.sql.Timestamp(System.currentTimeMillis());  // 현재 시간

    try {
        // DB 연결
        Class.forName("oracle.jdbc.OracleDriver");
        String url = "jdbc:oracle:thin:@1.220.247.78:1522/orcl"; // DB URL
        String dbUser = "mini_2410_team2"; // DB 사용자 이름
        String dbPassword = "1234"; // DB 비밀번호
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // 업데이트 쿼리
        String updateQuery = "UPDATE Users SET name = ?, email = ?, birthdate = ?, userpassword = ?, userpassword2 = ?, last_updated = ? WHERE userid = ?";
        psmt = conn.prepareStatement(updateQuery);
        psmt.setString(1, newName);
        psmt.setString(2, newEmail);
        psmt.setDate(3, java.sql.Date.valueOf(newBirthdate));
        psmt.setString(4, newPassword);  
        psmt.setString(5, newPassword);  
        psmt.setTimestamp(6, lastUpdated);  // 수정된 시간 저장
        psmt.setString(7, userid);
        
        // 업데이트 실행
        int rowsUpdated = psmt.executeUpdate();

        // 업데이트 성공 여부 확인
        if (rowsUpdated > 0) {
            updateSuccess = true;
            
            // 세션 정보 업데이트
            session.setAttribute("name", newName);
            session.setAttribute("fullEmail", newEmail);
            session.setAttribute("birthdate", java.sql.Date.valueOf(newBirthdate));
            session.setAttribute("userpassword", newPassword);  // 새 비밀번호로 세션 업데이트
            session.setAttribute("lastUpdated", lastUpdated);  // 수정 시간 업데이트

        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (psmt != null) psmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	 // 세션에 마지막 수정 시간 저장
    session.setAttribute("lastUpdated", lastUpdated);
%>
<script>
	location.href = './MyPage.jsp';
</script>

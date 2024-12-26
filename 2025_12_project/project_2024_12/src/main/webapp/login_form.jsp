<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.company1.DBManager" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%> 
<html>
<head>
    <title>로그인 처리</title>
    <script type="text/javascript">
    function showLoginResult(message) {
        alert(message); // 메시지 출력
        
        // 로그인 성공이면 Mypage로 리다이렉트
        if (message === '로그인이 성공하였습니다.') {
            window.location.href = "/project_2024_12/MyPage.jsp"; // Mypage 페이지로 리다이렉트
        }
        // 아이디가 존재하지 않는 경우
        else if (message === '등록된 아이디가 존재하지 않습니다.') {
            window.location.href = "/project_2024_12/login.jsp"; // 로그인 페이지로 리다이렉트
        }
        // 비밀번호가 틀린 경우
        else if (message === '등록된 비밀번호가 틀렸습니다.') {
            window.location.href = "/project_2024_12/login.jsp"; // 로그인 페이지로 리다이렉트
        }
    }
    </script>
</head>
<body>

<%
    String userid = request.getParameter("userid");
    String userpassword = request.getParameter("userpassword");

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        conn = DBManager.getDBConnection();  // DBManager1 클래스에서 DB 연결을 가져옴

        // SQL 쿼리 (아이디와 비밀번호로 검색)
        String sql = "SELECT * FROM Users WHERE userid = ? AND userpassword = ?";
        psmt = conn.prepareStatement(sql);
        
        psmt.setString(1, userid);
        psmt.setString(2, userpassword);

        rs = psmt.executeQuery();

        if (rs.next()) {
            // 아이디는 존재함, 비밀번호 확인
            if (userpassword.equals(rs.getString("userpassword"))) {
                // 로그인 성공
                out.println("<script>");
                out.println("showLoginResult('로그인이 성공하였습니다.');");  // 로그인 성공 메시지
                out.println("</script>");
                session.setAttribute("userid", userid);
                session.setAttribute("userpassword", userpassword);
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("birthdate", rs.getDate("birthdate"));
                session.setAttribute("signup_date",rs.getDate("signup_date"));
                
            } else {
                // 비밀번호가 틀림
                out.println("<script>");
                out.println("showLoginResult('등록된 비밀번호가 틀렸습니다.');"); // 비밀번호 틀린 경우
                out.println("</script>");
            }
        } else {
            // 아이디가 존재하지 않음
            out.println("<script>");
            out.println("showLoginResult('등록된 아이디가 존재하지 않습니다.');"); // 아이디가 없는 경우
            out.println("</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // 예외 메시지 출력
        out.println("<h3>SQLException: " + e.getMessage() + "</h3>");
    } catch (Exception e) {
        e.printStackTrace(); // 다른 예외 발생 시 출력
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
<p class="email"><%= session.getAttribute("email") %></p>
</body>
</html>
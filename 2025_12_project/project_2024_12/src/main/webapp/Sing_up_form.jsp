<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
%> 
<%	
    String userid = request.getParameter("userid");
    String userpassword = request.getParameter("userpassword");
    String userpassword2 = request.getParameter("userpassword2");
    String name = request.getParameter("name");
    String email = request.getParameter("fullEmail");
    String birthdateStr  = request.getParameter("birthdate");
    java.sql.Date birthdate = java.sql.Date.valueOf(birthdateStr);
	
   

    // 유효성 검사 추가
    if (userid.length() > 13) {
        out.println("<script>alert('아이디가 너무 깁니다. 13자 이내로 입력해주세요.'); history.back();</script>");
        return;
    }
	// 비밀번호 유효성 검사
	if (userpassword.length() < 6) {
        out.println("<script>alert('비밀번호는 너무 짧습니다. 최소 6자리 이상이어야 합니다.'); history.back();</script>");
        return;
    }
    if (userpassword.length() > 15) {
        out.println("<script>alert('비밀번호가 너무 깁니다. 15자 이내로 입력해주세요.'); history.back();</script>");
        return;
    }
	// 정규 표현식 : ^ = 문자열시작 [가-힣] = 한글의 범위 {1,5} = 최소1글자에서 최대 5글자까찌 입력가능 $ = 문자열의 끝
    if (!name.matches("^[가-힣]{1,5}$")) { 
        out.println("<script>alert('이름은 5자 이내의 한글만 입력할 수 있습니다.'); history.back();</script>");
        return;
    }
    
    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;
    
    try {
        // JDBC 드라이버 로딩 (Oracle)
        Class.forName("oracle.jdbc.OracleDriver");

        // DB 연결
        String url = "jdbc:oracle:thin:@1.220.247.78:1522/orcl";  // Oracle SID에 맞게 수정
        String dbUser = "mini_2410_team2";  // 데이터베이스 사용자 이름
        String dbPassword = "1234";  // 데이터베이스 비밀번호
        
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        
       
        
        // 아이디 중복 검사 SQL 쿼리
        String checkId = "SELECT * FROM users WHERE userid = ?";
        psmt = conn.prepareStatement(checkId);
        psmt.setString(1, userid);
        rs = psmt.executeQuery();

        if (rs.next()) {
            // 아이디가 중복됨
       		 out.println("<script>alert('아이디가 중복됩니다. 다른 아이디를 사용해주세요.'); history.back();</script>");
            return; // 중복된 아이디가 있으면 가입을 진행하지 않음
        }
        
        // 비밀번호 확인 
        if (!userpassword.equals(userpassword2)) {
        	out.println("<script>alert('비밀번호가 일치하지 않습니다. 확인하시고 다시 시도해주세요.'); history.back();</script>");
            return; // 비밀번호가 일치하지 않으면 가입을 진행하지 않음
        }

        // SQL 쿼리
		String sql = "INSERT INTO users (usernumber, userid, userpassword, userpassword2, name, email, birthdate, signup_date) "
         		   + "VALUES (user_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        psmt = conn.prepareStatement(sql);
        
        psmt.setString(1, userid);
        psmt.setString(2, userpassword);
        psmt.setString(3, userpassword2);
        psmt.setString(4, name);
        psmt.setString(5, email);
        psmt.setDate(6, birthdate);

        int result = psmt.executeUpdate();

        if (result > 0) {
        	out.println("<script>alert('회원가입이 성공적으로 완료되었습니다.'); window.location.href='login.jsp';</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // 예외 메시지 출력
        out.println("<h3>SQLException: " + e.getMessage() + "</h3>"); // SQLException 메시지 출력
    } catch (Exception e) {
        e.printStackTrace(); // 다른 예외 발생 시 출력
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


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");

	if (session != null) {
	    // 세션이 존재하면 세션을 무효화
	    session.invalidate();
	}
	// 로그아웃 후 로그인 페이지로 리다이렉트
    response.sendRedirect("login.jsp");
%> 
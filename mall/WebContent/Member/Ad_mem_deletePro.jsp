<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@page import="common.jdbcUtil"%>
<%
	
	String M_id = request.getParameter("M_id");
	Connection conn = jdbcUtil.connect();
	String sql = "DELETE FROM MEMBER WHERE M_ID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, M_id);
	pstmt.executeUpdate();
	session.invalidate();	
	response.sendRedirect("../Member/Ad_mem_list.jsp");
%>
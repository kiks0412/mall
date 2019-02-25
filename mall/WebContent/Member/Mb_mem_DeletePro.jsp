<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@page import="common.jdbcUtil"%>
<%
	session.invalidate();
	String M_id = request.getParameter("M_id");
	Connection conn = jdbcUtil.connect();
	String sql = "DELETE FROM MEMBER WHERE M_ID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, M_id);
	pstmt.executeUpdate();
	response.sendRedirect("../M_Product/main.jsp");
%>
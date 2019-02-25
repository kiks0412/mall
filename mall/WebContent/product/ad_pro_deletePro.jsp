<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String p_no = request.getParameter("p_no");


	PreparedStatement pstmt = null;
	

	String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
	Connection conn = jdbcUtil.connect();

	String sql = "delete  from product where p_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, p_no);

	pstmt.executeUpdate();
	response.sendRedirect("ad_pro_list.jsp");
%>

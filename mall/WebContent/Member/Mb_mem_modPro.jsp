<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%
	String M_id = request.getParameter("M_id");
	String M_passwd = request.getParameter("M_passwd");
	String M_name = request.getParameter("M_name");
	String M_add = request.getParameter("M_add");
	String M_tel = request.getParameter("M_tel");
	Connection conn = jdbcUtil.connect();
	String sql = "UPDATE MEMBER SET M_PASSWD = ?, M_ADD = ?, M_TEL = ? WHERE M_ID = ? AND M_NAME = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, M_passwd);
	pstmt.setString(2, M_add);
	pstmt.setString(3, M_tel);
	pstmt.setString(4, M_id);
	pstmt.setString(5, M_name);

	int r = pstmt.executeUpdate();
	System.out.println(r + " 건이 수정됨");

	response.sendRedirect("Mb_Select.jsp");
%>
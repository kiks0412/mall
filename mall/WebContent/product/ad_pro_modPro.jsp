<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
	//인코드
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.OracleDriver");

	//파라미터 받고
	String p_no = request.getParameter("p_no");
	String p_name = request.getParameter("p_name");
	String p_tag = request.getParameter("p_tag");
	String p_color = request.getParameter("p_color");
	String p_size = request.getParameter("p_size");
	String p_img = request.getParameter("p_img");
	String p_price = request.getParameter("p_price");
	String p_info = request.getParameter("p_info");
	String p_condition = request.getParameter("p_condition");

	//insert 실행
	Connection conn =jdbcUtil.connect();
	String sql = "insert into product values((select max(p_no)+100 from product),?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, p_name);
	pstmt.setString(2, p_tag);
	pstmt.setString(3, p_color);
	pstmt.setString(4, p_size);
	pstmt.setString(5, p_img);
	pstmt.setString(6, p_price);
	pstmt.setString(7, p_info);
	pstmt.setString(8, p_condition);
	int r = pstmt.executeUpdate();
	System.out.print(r+"건이수정됨");
	//목록으로 이동
	response.sendRedirect("ad_pro_list.jsp");
%>


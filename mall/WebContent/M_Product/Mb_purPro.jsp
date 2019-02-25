<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String m_id= request.getParameter("m_id");
	String m_name= request.getParameter("m_name");
	String m_tel= request.getParameter("m_tel");
	String m_add= request.getParameter("m_add");
	String p_no= request.getParameter("p_no");
	String p_color= request.getParameter("p_color");
	String p_size= request.getParameter("p_size");
	String o_count= request.getParameter("p_count");
	String o_price= request.getParameter("sum");
	String o_pay= request.getParameter("o_pay");
	String o_condition= request.getParameter("o_condition");


	Connection conn =jdbcUtil.connect();
	String sql="insert into ord values((select max(o_no)+1 from ord),sysdate,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt= conn.prepareStatement(sql);
	pstmt.setString(1, m_id);
	pstmt.setString(2, m_name);
	pstmt.setString(3, m_tel);
	pstmt.setString(4, m_add);
	pstmt.setString(5, p_no);
	pstmt.setString(6, p_color);
	pstmt.setString(7, p_size);
	pstmt.setString(8, o_count);
	pstmt.setString(9, o_price);
	pstmt.setString(10, o_pay);
	pstmt.setString(11, o_condition);
	pstmt.executeUpdate();
	
	response.sendRedirect("Mb_order_view.jsp");
%>
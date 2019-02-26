<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String M_id = request.getParameter("M_id");
String M_passwd = request.getParameter("M_passwd");
String M_name = request.getParameter("M_name");
String M_birth = request.getParameter("M_birth");
String M_gender = request.getParameter("M_gender");
String M_add = request.getParameter("M_add");
String M_tel = request.getParameter("M_tel");
Connection conn = jdbcUtil.connect();
String sql = "INSERT INTO MEMBER(M_ID, M_PASSWD, M_NAME, M_BIRTH, M_GENDER, M_ADD, M_TEL) VALUES(?,?,?,TO_DATE(?,'YYYY/MM/DD'),?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, M_id);
pstmt.setString(2, M_passwd);
pstmt.setString(3, M_name);
pstmt.setString(4, M_birth);
pstmt.setString(5, M_gender);
pstmt.setString(6, M_add);
pstmt.setString(7, M_tel);
pstmt.executeUpdate();

response.sendRedirect("../M_Product/main.jsp");
%>
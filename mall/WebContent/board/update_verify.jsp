<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title> 게시판 </title></head>
<body>
<%
request.setCharacterEncoding("utf-8");
int b_no = Integer.parseInt(request.getParameter("b_no"));
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String m_id = request.getParameter("m_id");
String b_title = request.getParameter("b_title");
String b_contents = request.getParameter("b_contents");
String sql = " update board set" +
" b_title='" + b_title + "' , " +
" b_contents ='" + b_contents + "' " +
" where b_no=" + b_no ;
PreparedStatement pstmt=conn.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
%>
<script>
alert("수정되었습니다.");
location.href="view.jsp?b_no="+<%= b_no %>;
</script>
<%
pstmt.close();
conn.close();
%>
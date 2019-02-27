<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head><title>게시판</title></head>
<body>
<%
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String b_no=request.getParameter("b_no");
String sql = " select b_no, b_title, M_id, b_date, B_CONTENTS" +
" from board where b_no= "+ b_no;
PreparedStatement pstmt= conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();
if (rs != null) {
while (rs.next()) {
int no = rs.getInt("b_no");
String b_title = rs.getString("b_title");
String m_id = rs.getString("m_id");
String B_CONTENTS = rs.getString("B_CONTENTS");
Date b_date = rs.getDate("b_date");
%>
<table width="80%" align="center" border=1 >
<tr align="center">
<td bgcolor="#FFFF99">글쓴이</td><td><%= m_id %></td>
<td bgcolor="#FFFF99">등록일</td><td><%= b_date %></td></tr>
<tr>
<td bgcolor="#FFFF99" align="center">제목</td>
<td colspan=3><%= b_title %></td></tr>
<tr height=200>
<td bgcolor="#FFFF99" align="center">내용</td>
<td colspan=3><%= B_CONTENTS %></td></tr>
</table>
<%
}}
%>
<table width="75%" align="center" >
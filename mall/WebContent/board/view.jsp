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
String c_no = request.getParameter("c_no");
String sql = " select no, subject, contents, poster, lastpost, views " +
" from board " +
" where no=" + c_no;
PreparedStatement pstmt=conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
if (rs.next()) {
int no = rs.getInt("no");
String subject = rs.getString("subject");
String contents = rs.getString("contents");
String poster = rs.getString("poster");
Date lastpost = rs.getDate("lastpost");
int views = rs.getInt("views");
%>
<table width="80%" align="center" border=1 >
<tr align="center">
<td bgcolor="#FFFF99">글쓴이</td><td><%= poster %></td>
<td bgcolor="#FFFF99">등록일</td><td><%= lastpost %></td></tr>
<tr>
<td bgcolor="#FFFF99" align="center">제목</td>
<td colspan=3><%= subject %></td></tr>
<tr height=200>
<td bgcolor="#FFFF99" align="center">내용</td>
<td colspan=3><%= contents %></td></tr>
</table>
<%
}
pstmt.close();
conn.close();
%>
<table width="75%" align="center" >
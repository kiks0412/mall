<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html>
<head> <title> 게시판</title> </head>
<body>
<table width="80%" align="center" border=0 >
<tr><td align="center" > JDBC 게시판 </td></tr>
</table><br>
<table width="75%" align="center" border=1 >
<tr bgcolor="#FFFF99" >
<th>번호</th><th>제목</th><th>글쓴이</th><th>등록일</th><th>조회수</th></tr>
<%
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String sql = " select b_no, b_title, M_id, b_date, views " +
" from board";
PreparedStatement pstmt= conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();
if (rs != null) {
while (rs.next()) {
int no = rs.getInt("no");
String subject = rs.getString("subject");
String poster = rs.getString("poster");
Date lastpost = rs.getDate("lastpost");
int views = rs.getInt("views");
%>
<tr>
<td align="center"><%= no %></td>
<td align="center"><a href="view.jsp?c_no=<%=no %>"><%= subject %></a></td>
<td align="center"><%= poster %></td>
<td align="center"><%= lastpost %></td>
<td align="center"><%= views %></td>
</tr>
<%
}
}
pstmt.close();
conn.close();
%>
</table>
<table width="75%" align="center" border=0 >
<tr><td align="right"><a href="insert_form.jsp"> 글쓰기 </a> </td> </tr>
<tr align="center" >
<td><a href="update_form.jsp?c_no=<%=c_no %>">수정 </a> </td>
<td><a href="delete_verify.jsp?c_no=<%=c_no %>">삭제</a></td>
<td><a href="list.jsp">목록으로</a></td>
</tr>
</table>
</body>
</html>
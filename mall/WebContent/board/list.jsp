<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<html>
<head> <title> 게시판</title> </head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #99cccc;
  color: #663300;
}
</style>

<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<h1 align="center">게시판</h1>
<table id="customers" width="75%" align="center" border=1 >
<tr bgcolor="#FFFF99" >
<th>번호</th><th>제목</th><th>글쓴이</th><th>등록일</th></tr>
<%
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String sql = " select b_no, b_title, M_id, b_date" +
" from board";
PreparedStatement pstmt= conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();
if (rs != null) {
while (rs.next()) {
int b_no = rs.getInt("b_no");
String b_title = rs.getString("b_title");
String m_id = rs.getString("m_id");
Date b_date = rs.getDate("b_date");
%>
<tr>
<td align="center"><%= b_no %></td>
<td align="center"><a href="view.jsp?c_no=<%=b_no %>"><%= b_title %></a></td>
<td align="center"><%= m_id %></td>
<td align="center"><%= b_date %></td>
</tr>
<%
}
}
%>
</table>
<table width="75%" align="center" border=0 >   
<tr><td align="right"><a href="insert_form.jsp"> 글쓰기 </a> </td> </tr>
<tr align="center" >
<td><a href="list.jsp">목록으로</a></td>
</tr>

</table>
<br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
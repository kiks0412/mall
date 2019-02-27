<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>게시판</title></head>

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
<%
int b_no = Integer.parseInt(request.getParameter("b_no"));
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String sql = " select b_no, b_title, M_id, b_date, b_contents" +
" from board where b_no=" + b_no;
PreparedStatement pstmt= conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();
if (rs.next()) {
	b_no = rs.getInt("b_no");
	String b_title = rs.getString("b_title");
	String m_id = rs.getString("m_id");
	String  b_contents = rs.getString(" b_contents");
	Date b_date = rs.getDate("b_date");
%>
<form method="post" action="update_verify.jsp">
<input type="hidden" name="b_no" size="30" value="<%= b_no %>">
<table id="customers" width="75%" align="center" border=1 >
<tr>
<td align="center" bgcolor="#99CCCC">글쓴이</td>
<td><%= m_id %></td></tr>
<tr>
<td align="center" bgcolor="#99CCCC">제목</td>
<td><input type="text" name="b_title" size="70" value="<%= b_title %>">
</td></tr>
<tr>
<td bgcolor="#99CCCC" align="center">내용</td>
<td><textarea name=b_contents rows="10" cols="70"><%= b_contents%>
</textarea></td> </tr>
</table>
<%
}
pstmt.close();
conn.close();
%>
<table width="75%" align="center">
<tr align="center" >
<td><input type="submit" value="수정"></td>
<td><a href="list.jsp">목록으로</a></td>
</tr>
</table>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
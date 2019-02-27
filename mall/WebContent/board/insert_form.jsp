<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.jdbcUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title> 게시판</title></head>

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
String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String sql="select * from board";
PreparedStatement pstmt=conn.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
rs.next();
String m_id=rs.getString("m_id");
%>
<form method="post" action="insert_verify.jsp">
<table id="customers"width="80%" align="center" border=1 >
<tr>
<td align="center" bgcolor="99CCCC">글쓴이</td>
<td><input type="text" name="m_id" size="20" value="<%=m_id %>" ></td></tr>
<tr>
<td align="center" bgcolor="#99CCCC">제목</td>
<td><input type="text" name="b_title" size="70" ></td></tr>
<tr>
<td bgcolor="#99CCCC" align="center">내용</td>
<td><textarea name=b_contents rows="10" cols="70"></textarea></td> </tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="저장
"></td></tr>
</table>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
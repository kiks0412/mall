<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

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
<table id="customers" width="80%" align="center" border=1 >
<tr align="center">
<td bgcolor="#99CCCC">글쓴이</td><td><%= m_id %></td>
<td bgcolor="#99CCCC">등록일</td><td><%= b_date %></td></tr>
<tr>
<td bgcolor="#99CCCC" align="center">제목</td>
<td colspan=3><%= b_title %></td></tr>
<tr height=200>
<td bgcolor="#99CCCC" align="center">내용</td>
<td colspan=3><%= B_CONTENTS %></td></tr>
</table>

<%
}}
%>
<table id="customers"width="75%" align="center" >
<tr align="center" >
<td><a href="update_form.jsp?b_no=<%=b_no %>">수정 </a> </td>
<td><a href="delete_verify.jsp?b_no=<%=b_no %>">삭제</a></td>
<td><a href="list.jsp">목록으로</a></td>
</tr>
</table>
</body>
</html>
<br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
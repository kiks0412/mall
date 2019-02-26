<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<html>
<title>회원 관리</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href= "Member.css">
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
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px"></div>

<!-- Header -->
<%@include file="../common/head.jsp"  %>

<h2>회원 관리</h2>
<div style="width:1000px;margin:auto">
<form name = "frm">
<input type = "text" name = "text">
<input type = "submit" value = "검색" ><br><br>
</form>
</div>
<table id="customers" align="center" class = "me" >
<tr class = "tr">
<th>아이디</th>
<th>이름</th>
<th>성별</th>
<th>생년월일</th>
<th>주소</th>
<th>전화번호</th>
<th>주문건수</th>
</tr>
<%
	Connection conn = jdbcUtil.connect();
	String text = request.getParameter("text");
	String cond = "";
 if(text != null && !text.equals("") ) {
	 cond=" WHERE M_ID = ?";
 }
	String sql = "SELECT M_ID, M_NAME, M_GENDER, M_BIRTH, M_ADD, M_TEL, M_PASSWD,(select count(*) from ord where M_id=MEMBER.M_id)ordcnt FROM MEMBER "+ cond;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	 if(text != null && !text.equals("") ) {
		pstmt.setString(1, text);
	 }
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	%>
	<tr class = "tr">
	<td class ="td"><%=rs.getString("M_id") %></td>
	<td class ="td"><a href = "Ad_mem_mod.jsp?M_id=<%=rs.getString("M_id") %>"><%=rs.getString("M_name") %></a></td>
	<td class ="td"><%=rs.getString("M_gender") %></td>
	<td class ="td"><%=rs.getString("M_birth").substring(0, 10) %></td>
	<td class ="td"><%=rs.getString("M_add") %></td>
	<td class ="td"><%=rs.getString("M_tel") %></td>
	<td class ="td"><%=rs.getString("ordcnt") %></td>
		<% } %>
</table>
<br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>
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
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px"></div>

<!-- Header -->
<%@include file="../common/head.jsp"  %>



<form name = "frm">
<h2>회원 관리</h2>
<div >
<input type = "text" name = "text">
<input type = "submit" value = "검색" ><br><br>
</div>
<table align="center" class = "me">
<tr class = "tr">
<th>아이디</th>
<th>이름</th>
<th>성별</th>
<th>생년월일</th>
<th>주소</th>
<th>전화번호</th>
<th>비밀번호</th>
</tr>
<%
	Connection conn = jdbcUtil.connect();
	String text = request.getParameter("text");
	String cond = "";
 if(text != null && !text.equals("") ) {
	 cond=" WHERE M_ID = ?";
 }
	String sql = "SELECT M_ID, M_NAME, M_GENDER, M_BIRTH, M_ADD, M_TEL, M_PASSWD FROM MEMBER"+ cond;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	 if(text != null && !text.equals("") ) {
		pstmt.setString(1, text);
	 }
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	%>
	<tr class = "tr">
	<td><%=rs.getString("M_id") %></td>
	<td><a href = "Ad_mem_mod.jsp?M_id=<%=rs.getString("M_id") %>"><%=rs.getString("M_name") %></a></td>
	<td><%=rs.getString("M_gender") %></td>
	<td><%=rs.getString("M_birth").substring(0, 10) %></td>
	<td><%=rs.getString("M_add") %></td>
	<td><%=rs.getString("M_tel") %></td>
	<td><%=rs.getString("M_passwd") %></td>
	<% } %>
</table>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>
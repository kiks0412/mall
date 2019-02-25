<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 조회</title>
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
<script>
function upList(){
	location.href = "Mb_mem_mod.jsp";
}
</script>
</head>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px"></div>

<jsp:include page="../common/head.jsp"></jsp:include>

<form name = "frm">
<h2>개인 정보 조회</h2>
<table align="center" class = "me">
<%
	Connection conn = jdbcUtil.connect();
	String sql = "SELECT M_ID, M_NAME, M_BIRTH, M_GENDER, M_ADD, M_TEL FROM MEMBER WHERE M_ID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("M_id"));
	ResultSet rs = pstmt.executeQuery();

if(rs.next()){
%>
<tr><th>아이디</th>
<td><input type = "text"  name = "M_id" id = "m_id" readonly value ="<%=rs.getString("M_id") %>"></td></tr>
<tr><th>이름</th>
<td><input type = "text" name = "M_name" id = "m_name"  readonly  value ="<%=rs.getString("M_name") %>"></td></tr>
<tr><th>생년월일</th>
<td><input type = "text" name = "M_birth" id = "birth"   value ="<%=rs.getString("M_birth").substring(0, 10) %>" readonly ></td></tr>
<tr><th>성별 </th><td>
<input type = "text"  name = "M_gender" id = "gender"  readonly  value ="<%=rs.getString("M_gender") %>"></td></tr>
<tr><th>주소</th>
<td><input type = "text" name = "M_add" id = "add" readonly  value ="<%=rs.getString("M_add") %>"></td></tr>
<tr><th>연락처</th>
<td><input type = "tel" name = "M_tel" id = "tel" readonly  value ="<%=rs.getString("M_tel") %>"></td></tr>
<% } %>
</table>
<input type = "button" value = "수정"  onclick ="upList()">
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
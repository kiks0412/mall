<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@page import="common.jdbcUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<script>
function pwCheck(){
	var passwd1 = document.frm.passwd1.value;
	var passwd2 = document.frm.passwd2.value;
	if(passwd1 != passwd2){
		alert("동일하지 않음");
		return;
	}
	if(document.frm.M_add.value == ""){
		alert("주소가 입력되지 않았습니다.");
		return
	}
	if(document.frm.M_tel.value == ""){
		alert("연락처가 입력되지 않았습니다.");
		return
	}
	alert("회원수정이 완료 되었습니다.")
	document.frm.submit();
}
</script>
</head>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px"></div>

<jsp:include page="../common/head.jsp"></jsp:include>

<h2>회원 수정</h2>
<form name = "frm" action = "Ad_mem_modPro.jsp">
<table>
<%
	Connection conn = jdbcUtil.connect();
	String sql = "SELECT M_ID, M_NAME, M_BIRTH, M_GENDER, M_ADD, M_TEL FROM MEMBER WHERE M_ID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, (String)session.getAttribute("M_id"));
	ResultSet rs = pstmt.executeQuery();

if(rs.next()){
%>
<tr><td>아이디</td>
<td><input type = "text"  name = "M_id" id = "m_id" readonly value ="<%=rs.getString("M_id") %>"></td></tr>
<tr><td>비밀번호</td>
<td><input type = "password" name = "M_passwd" id = "passwd1" ></td></tr>
<tr><td>비밀번호 확인</td>
<td><input type = "password" name = "M_passwd" id = "passwd2" ></td></tr>
<tr><td>이름</td>
<td><input type = "text" name = "M_name" id = "m_name"  readonly  value ="<%=rs.getString("M_name") %>"></td></tr>
<tr><td>생년월일</td>
<td><input type = "text" name = "M_birth" id = "birth"   value ="<%=rs.getString("M_birth").substring(0, 10) %>"  readonly></td></tr>
<tr><td>성별 </td>
<td><input type = "text"  name = "M_gender" id = "gender"   value ="<%=rs.getString("M_gender") %>"  readonly ></td></tr>
<tr><td>주소</td>
<td><input type = "text" name = "M_add" id = "add"></td></tr>
<tr><td>연락처</td>
<td><input type = "tel" name = "M_tel" id = "tel"></td></tr>
<% } %>
</table>
<input type = "button" value = "수정" onclick = "pwCheck()">
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>
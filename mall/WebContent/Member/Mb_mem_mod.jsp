<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href= "Member.css">
<style>
	<style>

		body{
			font-family: 나눔고딕;
			margin:0;
			}

		nav{
			overflow:hidden;
			background-color:#999;
			}
		nav ul{
			list-style:none;
			padding:0;
			margin:0;
			display:inline;
			}
		nav ul li{
			margin:0;
			float:left;
			}
		nav a{
			display:block;
			color: #f2f2f2;
			text-align:center;
			padding:14px 16px;
			text-decoration:none;
			}
		nav a:hover{
			background-color:#ddd;
			color:black;
			}
		#left_a{
			float:left;
			width:25%;
			text-align:center;
			height:700px;
			padding:15px;
			background-color:#ccc;
			}
		#right_a{
			float:right;
			width:25%;
			text-align:center;
			height:700px;
			padding:15px;
			background-color:#ccc;
			}
		section{
			width:50%;
			height:700px;
			float:left;
			}
		#frm{
			width:600px;
			margin:20px auto;
			padding:20px;
			text-align:center;
			background-color:#f0f0f5;
			}
		form ul{
			padding:0;
			margin:0;
			}
		form ul li{
			list-style-type:none;
			line-height:50px;
			background-color:rgba(255,255,255,.2);
			border:1px solid white;
			border-radius:5px;
			margin:5px;
			}
		fieldset{
			border:none;
			margin-bottom:16px;
			font-size:1.2em;
			}
		legend{
			font-size:1.3em;
			font-weight:700;
			text-shadow:2px 2px 1px white;
			}
		label{
			width:150px;
			float:left;
			text-align:right;
			font-weight:500;
			}
		input{
			width:250px;
			height:35px;
			padding:5px;
			}
		input:hover{
			background:#ffffcc;
			}
		button{
			width:80px;
			background-color:#003366;
			color:white;
			border-radius:15px;
			padding:2px;
			font-weight:bold;
			font-size:1.2em;
			}
		#rs{
			width:80px;
			background-color:#003366;
			color:white;
			border-radius:15px;
			padding:2px;
			font-weight:bold;
			font-size:1.2em;
			}
		section a{
			padding:10px;
			text-decoration:none;
			color:black;
			}
		section a:hover{
			text-decoration:underline;
			}
		footer{
			clear:both;
			background-color:#999;
			padding: 10px;
			text-align:center;
			border:1px solid #bcbcbc;
			}
	</style>
</style>
<script>
function resetCheck(){
	location.href = "Mb_Select.jsp";
}
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

<h2 align = "center">회원 수정</h2>
<form name = "frm" id="frm" action = "Mb_mem_modPro.jsp">
<table class = "me">
<%
	Connection conn = jdbcUtil.connect();
	String M_id = request.getParameter("M_id");
	String sql = "SELECT M_ID, M_NAME, M_BIRTH, M_GENDER, M_ADD, M_TEL FROM MEMBER WHERE M_ID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, M_id);
	ResultSet rs = pstmt.executeQuery();

if(rs.next()){
%>
<tr><td>아이디</td>
<td><input type = "text"  name = "M_id" id = "M_id" readonly value ="<%=rs.getString("M_id") %>"></td></tr>
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
<div align="center">
<input type = "button" id="rs" value = "수정" onclick = "pwCheck()">
<input type = "button" id="rs"  value = "되돌아가기" onclick ="resetCheck()">
</div>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<script src = "../JavaScript/jquery-3.3.1.js" ></script>
<script>
	function idChack(){
		var quertStr = "M_id=" + document.getElementById("M_id").value
		$.get("IdChack.jsp", quertStr, function(data){
			$("#res").html(data);
		});
}
	function pwCheck(){
		if(document.frm.M_id.value == ""){
			alert("아이디가 입력되지 않았습니다.");
			return
		}
		var passwd1 = document.frm.passwd1.value;
		var passwd2 = document.frm.passwd2.value;
		if(passwd1 != passwd2){
			alert("동일하지 않음");
			return;
		}
		if(document.frm.M_name.value == ""){
			alert("이름이 입력되지 않았습니다.");
			return
		}
		if(document.frm.M_birth.value == ""){
			alert("생년월일이 입력되지 않았습니다.");
			return
		}
		if(document.frm.M_gender.value == ""){
			alert("성별이 선택되지 않았습니다.");
			return
		}
		if(document.frm.M_add.value == ""){
			alert("주소가 입력되지 않았습니다.");
			return
		}
		if(document.frm.M_tel.value == ""){
			alert("연락처가 입력되지 않았습니다.");
			return
		}
		alert("회원가입이 완료 되었습니다.")
		document.frm.submit();
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

</head>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px"></div>

<jsp:include page="../common/head.jsp"></jsp:include>

<h1 align = "center" >회원 등록</h1>
<form name = "frm" id="frm" action = "Mb_mem_regPro.jsp">
<table align="center" border>
	<tr><th>아이디</th>
	<td><input type = "text" name = "M_id" id = "id" onchange = "idChack()" ><span id = "res" ></span></td></tr>
	<tr><th>비밀번호</th>
	<td><input type = "password" name = "M_passwd" id = "passwd1" ></td></tr>
	<tr><th>비밀번호 확인</th>
	<td><input type = "password" name = "M_passwd" id = "passwd2" ></td></tr>
	<tr><th>이름</th>
	<td><input type = "text" name = "M_name" id = "name"></td></tr>
	<tr><th>생년월일</th>
	<td><input type = "date" name = "M_birth" id = "birth"></td></tr>
	<tr><th>성별 </th>
	<td><select name = "M_gender" id = "gender" >   
		<option value = "M">M</option>
		<option value = "F">F</option>
	</select></td></tr>
	<tr><th>주소</th>
	<td><input type = "text" name = "M_add" id = "add"></td></tr>
	<tr><th>연락처</th>
	<td><input type = "tel" name = "M_tel" id = "tel"></td></tr>
</table><br>
	<div align="center">
	<button type = "button" onclick = "pwCheck()">등록</button>&nbsp;&nbsp;
	<input type = "reset" id="rs" value = "초기화">
	</div>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>
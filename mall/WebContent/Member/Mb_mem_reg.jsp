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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
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
		<option value = "M">남성</option>
		<option value = "F">여성</option>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>shopping mall</title>
<meta charset="UTF-8">
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
function goList(){
	location = "ad_pro_list.jsp";
}
function insertCheck(){
	if(document.frm.p_name.value==""){
		alert("상품이 등록되지 않았습니다.")
		document.frm.p_name.focus();
		return;
	}

	alert("상품 등록이 완료되었습니다.")
	document.frm.submit();
}


function fileupload(){
	window.open("fileForm.jsp","file","width=300,height=300")
}

</script>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<jsp:include page="../common/head.jsp"></jsp:include>

<!-- !PAGE START! -->
<section>
		<h3 align="center" style="background-color:#f5c2f8;font-size:25px;width:60%;margin:auto;">상품 등록</h3>
		
		
		<form name="frm" action="ad_pro_modPro.jsp" method="post">
			<table border align="center" width=60%>
				<tr>
					<td class="label">상품 번호</td>
					<td><input type="text" name="p_no" id="p_no"></td>
				</tr>
				<tr>
					<td class="label">상품 이름</td>
					<td><input type="text" name="p_name" id="p_name"></td>
				</tr>
				<tr>
					<td class="label">상품 태그</td>
					<td><input type="text" name="p_tag" id="p_tag"></td>
				</tr>
				<tr>
					<td class="label">상품 색상</td>
					<td><input type="text" name="p_color" id="p_color"></td>
				</tr>

				<tr>
					<td class="label">사이즈</td>
					<td><input type="text" name="p_size" id="p_size">
				</tr>
				<tr>
					<td class="label">이미지</td>
					<td><input type="text" name="p_img" id="p_img">
						<button type="button" onclick="fileupload()">파일첨부</button></td>
	
						
						
				</tr>
				<tr>
					<td class="label">가격</td>
					<td><input type="text" name="p_price" id="p_price"></td>
				</tr>
				<tr>
					<td class="label">정보</td>
					<td><textarea rows="5" cols="100" name="p_info" id="p_info"></textarea>
					</td>
				</tr>
				<tr>
					<td class="label">상태</td>
					<td><select name="p_condition" id="p_condition">
					<option value = "0">품절</option>
					<option value = "1">판매</option>	
					</select>
					</td>
				</tr>
			</table>
			<div style="text-align: center">
				<button type="button" onclick="insertCheck()">등록</button>
				<button type="button" onclick="goList()">조회</button>
			</div>
		</form>
	</section>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>
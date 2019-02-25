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
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:80px 16px">
  <h1 class="w3-xlarge">SHOPPING MALL</h1>
  <div align="center">
ID <input type="text" name="M_id" id="id"><br>
PASSWD <input type="password" name="M_passwd" id="passwd">
</div>
  
  <div class="w3-padding-32">
    <div class="w3-bar w3-border">
      <a href="../M_Product/main.jsp" class="w3-bar-item w3-button">Home</a>
      <a href="../Member/Mb_mem_reg.jsp" class="w3-bar-item w3-button w3-light-grey">회원등록</a>
      <a href="../M_Product/Mb_pro_view.jsp" class="w3-bar-item w3-button">상품보기</a>
      <a href="#" class="w3-bar-item w3-button w3-light-grey">주문하기</a>
      <a href="../Order/Mb_order_view.jsp" class="w3-bar-item w3-button">주문조회</a>
      <a href="#" class="w3-bar-item w3-button w3-hide-small">게시판</a>
    </div>
  </div>
</header>
	<section>
		<h4 align="center">상세주문조회</h4>
	<table border="1" width="90%" align="center">
	

<span class='green_window'>
	<input type='text' class='input_text' />
</span>
<button type='submit' class='sch_smit'>검색</button>
	<tr>
		<th>번호</th>
		<th>주문번호</th>
		<th>주문상품</th>
		<th>주문일시</th>
		<th>주문자</th>
		<th>입금자</th>
		<th>총주문액</th>
		<th>실결제</th>
		<th>상태</th>
	</tr>
	</table>
</body>
</html>
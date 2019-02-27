<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  <h1 class="w3-xlarge">INTERNATIONAL SHOP</h1>
  
  <%if (session.getAttribute("M_id") == null){ %>
  <form action="../common/LogIn.jsp" method="post">
  <table align="center">
				<tr>
					<td align="right">ID</td>
					<td><input type="text" name="M_id" id="id"></td>
				</tr>
				<tr>
					<td align="right">PASSWD</td>
					<td><input type="password" name="M_passwd" id="passwd"></td>
				</tr>
				<tr><td colspan="2" align="center"><input type="submit" value="로그인"></td></tr>
			</table>
  </form>
  <% }
    if(session.getAttribute("M_id") != null){
  %>
  <form method="post" action = "../common/LogOut.jsp" >
  <input type = "submit" value = "로그아웃">
  </form>
  <% } %>
  <div class="w3-padding-32">
    <div class="w3-bar w3-border">
 <% 
    if(session.getAttribute("M_id") != null && session.getAttribute("admin") == null){
  %>
        <a href="../M_Product/main.jsp" class="w3-bar-item w3-button">Home</a>
        <a href="../Member/Mb_Select.jsp" class="w3-bar-item w3-button">개인정보 관리</a>
        <a href="../M_Product/Mb_pro_view.jsp" class="w3-bar-item w3-button">상품보기</a>
        <a href="../M_Product/Mb_order_view.jsp" class="w3-bar-item w3-button">주문보기</a>
        <a href="../board/list.jsp" class="w3-bar-item w3-button w3-hide-small">게시판</a>
  <% } %>
<%if (session.getAttribute("M_id") == null){ %>  
      <a href="../M_Product/main.jsp" class="w3-bar-item w3-button">Home</a>
      <a href="../Member/Mb_mem_reg.jsp" class="w3-bar-item w3-button w3-light-grey">회원등록</a>
     
  <% } %> 
 <% 
    if(session.getAttribute("admin") != null){
  %>
      <a href="../M_Product/main.jsp" class="w3-bar-item w3-button">Home</a>
      <a href="../product/ad_pro_list.jsp" class="w3-bar-item w3-button w3-hide-small">상품관리</a>
      <a href="../Order/Ab_order_view.jsp" class="w3-bar-item w3-button">주문관리</a>
      <a href="../Member/Ad_mem_list.jsp" class="w3-bar-item w3-button">회원관리</a>    
      <a href="../board/list.jsp" class="w3-bar-item w3-button w3-hide-small">게시판</a>
       <% } %>  
    </div>
  </div>

</header>
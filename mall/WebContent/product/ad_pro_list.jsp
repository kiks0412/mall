<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
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
a{text-decoration:none;}
.product_img{width:80px;}
.constyle{
color:red}
th{background-color:#DCE1DC;}
tr:hover{background-color:#ACC5E8;}
</style>
<script>
	//돌아갈페이지
	function goList() {
		location = "ad_pro_mod.jsp";
	}
	
	//
	function insertCheck() {
		if (document.frm.p_name.value == "") {
			alert("상품이 등록되지 않았습니다.")
			document.frm.p_name.focus();
			return;
		}

		alert("상품 등록이 완료되었습니다.")
		document.frm.submit();
	}
	
	
	window.onload = function(){
		console.log("합계계산");
		var list = document.getElementsByClassName("price");
		
		for(i=0;i<list.length;i++){
			
			list[i].innerHTML = comma(list[i].innerHTML);
		}
		
	}
		
	//숫자 콤마 넣기
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}

</script>

<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<jsp:include page="../common/head.jsp"></jsp:include>

<!-- !PAGE START! -->



	<section>
		<h4 align="center" style="background-color:#f5c2f8;font-size:25px;width:60%;margin:auto;border-collapse: collapse;"> 상품 현황 </h4>
		<table border align="center" style="width:60%;">

			<tr>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>상품테그</th>
				<th>상품컬러</th>
				<th>상품사이즈</th>
				<th>상품이미지</th>
				<th>상품가격</th>
				<th>상품정보</th>
				<th>상품상태</th>
				

			</tr>
			<%
				//db에서 조회해서 건수만큼 반복
				String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";  //localhost
				Connection conn =jdbcUtil.connect();
				String sql = "select p_no,p_name,p_tag,p_color,p_size,p_img,p_price,p_info,"+
							" decode(p_condition,'0','품절','1','판매')as p_condition"+
							" from product order by p_no";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				String img ="";
				while (rs.next()) {
					String p_img=rs.getString("p_img");
					if(p_img!=null){
						String[] imgs=p_img.split(",");
						img=imgs[0];
					}
					String condition=rs.getString("p_condition");
					String conStyle="";
					if(condition.equals("품절")){
						conStyle="class='constyle'";
					}
					System.out.print(conStyle);
			%>
			<tr>

				<td style="text-align: center hover:#f5f5f5;"><%=rs.getString("p_no")%></td>
				<td style="text-align: center"> <a href="updatead_pro_mod.jsp?p_no=<%=rs.getString("p_no")%>"> <%=rs.getString("p_name")%></a></td>
				<td style="text-align: center"><%=rs.getString("p_tag")%></td>
				<td style="text-align: center"><%=rs.getString("p_color")%></td>
				<td style="text-align: center"><%=rs.getString("p_size")%></td>
				<td style="text-align: center"><img class="product_img" src = "../M_Product/img/<%=img%>"></td>
				<td style="text-align: center" class="price"><%=rs.getString("p_price")%></td>
				<td style="text-align: center"><%=rs.getString("p_info")%></td>
				<td style="text-align: center" <%=conStyle%>><%=rs.getString("p_condition")%></td>
					
			</tr>

			<%
				}
			%>
		</table><br>
		<div style="text-align: center">
			
			<button type="button" onclick="goList()">등록</button>
		</div>
			
	</section><br>
	


</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>





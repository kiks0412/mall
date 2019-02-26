<%@page import="common.Paging"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>   
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
th{background-color:#99cccc;}
tr:hover{background-color:#ACC5E8;}

.pagination,
.pagination li a {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}

.pagination li { background-color: lightseagreen;list-style-type:none; }

.pagination a {
  font-weight: 300;
  padding-top: 1px;
  text-decoration:none;  
  border: 1px solid rgba(0,0,0,.25);
  border-left-width: 0;
  min-width:44px;
  min-height:44px;
  color: rgba(255,255,255,.85);  
  box-shadow: inset 0px 1px 0px 0px rgba(255,255,255,.35);
}

.pagination li:not([class*="current"]) a:hover { 
  background-color: rgba(255,255,255,.2);
  border-top-color: rgba(0,0,0,.35);
  border-bottom-color: rgba(0,0,0,.5);
}

.pagination li:not([class*="current"]) a:focus,
.pagination li:not([class*="current"]) a:active {;
  box-shadow: 0px 0px 10px 1px rgba(0,0,0,.25);
  border-left-width:1px;
}

.pagination li:first-of-type a {
  border-left-width: 1px;
}

.pagination li:first-of-type span,
.pagination li:last-of-type span,
.pagination li:nth-of-type(2) span,
.pagination li:nth-last-of-type(2) span { 
  /* screen readers only */
  position: absolute;
  top: -9999px;
  left: -9999px;
}

.pagination li:first-child a::before,
.pagination li:last-child a::after,
.pagination li:nth-of-type(2) a::before,
.pagination li:nth-last-of-type(2) a::after {  
  display: inline-block;
  font-family: Fontawesome;  
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  transform: translate(0, 0);
}
/* 
.pagination li:first-child a::before,
.pagination li:last-child a::after { content: "\f100"; }

.pagination li:nth-of-type(2) a::before,
.pagination li:nth-last-of-type(2) a::after { content: "\f104"; }

.pagination li:last-child a::after,
.pagination li:nth-last-of-type(2) a::after { transform: rotate(180deg); }
 */
.pagination li.current a { 
  padding-top:.25em;
  color: rgba(255,255,255,1);
  background-color: rgba(255,255,255,.15);
  box-shadow: inset 0px 2px 1px 0px rgba(0,0,0,.25);
  cursor: default;
  pointer-events: none;
}


  .pagination li:nth-of-type(2) a { border-left-width: 1px; }

}

  .pagination li.current,
  .pagination li:first-of-type,
  .pagination li:last-of-type,
  .pagination li:nth-of-type(2),
  .pagination li:nth-last-of-type(2){
    position: initial;
    top: initial;
    left: initial;
  }

  .pagination li:nth-of-type(2) a { border-left-width: 0; }

}

/* Just Setting a few defaults */

html {  
  overflow-y: scroll; 
  box-sizing: border-box;  
  font-size: 100%;
  line-height: 1.4236;
  font-family: 'Roboto', sans-serif;
  background-color: lightseagreen;
  color: #444;
}
/* 
*,
*:before,
*:after {
  -webkit-box-sizing: inherit;
  -moz-box-sizing: inherit;
  box-sizing: inherit;
}
 */

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
<%	request.setCharacterEncoding("utf-8");
	String p_no = request.getParameter("p_no");
	String p_tag = request.getParameter("p_tag");
	String p = request.getParameter("p");
	
	//페이징처리
	Paging paging = new Paging();
	int pageNo = 1;
	if(p!=null && ! p.isEmpty()) {
		pageNo = Integer.parseInt(p);
	}
	paging.setPage(pageNo);  //조회할 페이지 지정
	paging.setPageUnit(4);
	
%>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<jsp:include page="../common/head.jsp"></jsp:include>

<!-- !PAGE START! -->



	<section>
		<h4 align="center" style="background-color:#f5c2f8;font-size:25px;width:60%;margin:auto;border-collapse: collapse;"> 상품 현황 </h4><br><br>
		<div style="text-align:center">
			<form method="post" name="frm">
		번호 <input type="text" name="p_no" 
				value="<%=p_no==null ? "" : p_no %>">
		태그<input type="text" name="p_tag" 
				value="<%=p_tag == null ? "" : p_tag %>">
		<input type="submit" value="검색">
		<input type="reset" value="초기화">
		<input type="hidden" name="p">
	</form>
		</div>
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
			
				Connection conn =jdbcUtil.connect();
				
				//검색조건 추가
				String where = "";
				if(p_no != null && !p_no.isEmpty()) {
					where += " and p_no like  '%' || ? || '%' ";
				}
				if(p_tag != null && !p_tag.isEmpty()) {
					where += " and p_tag = ? ";
				}
				
				String sql =  "select * from ( select a.*, rownum  rnum from ( "+
						"select p_no,p_name,p_tag,p_color,p_size,p_img,p_price,p_info,"+
							" decode(p_condition,'0','품절','1','판매')as p_condition"+
							" from product where 1=1 "+ where +" order by p_no"
							+ " ) a ) b  where rnum between ? and ?" ;
				System.out.print(sql); 
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				int i=0;
				if(p_no != null && !p_no.isEmpty()) {
					pstmt.setString(++i, p_no);
				}
				if(p_tag != null && !p_tag.isEmpty()) {
					pstmt.setString(++i, p_tag);
				}
				pstmt.setInt(++i, paging.getFirst());
				pstmt.setInt(++i, paging.getLast());
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
	
	//전체 레코드 건수
	sql="select count(*) from product where 1=1 " + where;
	pstmt = conn.prepareStatement(sql);
	i=0;
	if(p_no != null && !p_no.isEmpty()) {
		pstmt.setString(++i, p_no);
	}
	if(p_tag != null && !p_tag.isEmpty()) {
		pstmt.setString(++i, p_tag);
	}
	rs = pstmt.executeQuery();
	rs.next();
	paging.setTotalRecord(rs.getInt(1));
%>
		</table><br>
		<div style="text-align: center">
			
			<button type="button" onclick="goList()">등록</button>
		</div>
			
	</section><br>
<my:paging paging="<%=paging%>" jsfunc="go_list"/>
<script>
	function go_list(p){
		document.frm.p.value = p;
		document.frm.submit();
	}
</script>	


</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>





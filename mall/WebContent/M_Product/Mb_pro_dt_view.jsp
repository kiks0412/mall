<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<script>
	function goPur(p_no) {
		location = "Mb_pur.jsp?p_no="+p_no;
	}
	function goPrePur(p_no) {
		alert("장바구니에 담았습니다");
		document.submit("Mb_pro_pur.jsp"+p_no);
	}
	function go_dt_view(p_no) {
		//입력값 
		location = "Mb_pro_dt_view.jsp?p_no="+p_no;
	}
</script>
<jsp:include page="../common/head.jsp"></jsp:include>

<body>
		<section>
		
			<%
			Connection conn =jdbcUtil.connect();
				String sql = "select * from product where p_no=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,request.getParameter("p_no"));
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				String p_img=rs.getString("p_img");
				String img="";
				String[] imgs=null;
				if(p_img!=null){
					imgs=p_img.split(",");
					img=imgs[0];
				}
			%>
			<table align="center">
				<tr>
					<td rowspan="6"><img src="<%=img%>" width="500px" height="300px"></td>
					<td width="20px"></td>
					<th align="left">&nbsp;&ensp;상품명</th>
					<td><%=rs.getString("p_name")%></td>
				</tr>
				<tr>
					<td width="20px"></td>
					<th align="left">&nbsp;&ensp;색상</th>
					<td><select><option>색상선택</option>
							<option><%=rs.getString("p_size")%></option></select></td>
				</tr>
				<tr>
					<td width="20px"></td>
					<th align="left">&nbsp;&ensp;사이즈</th>
					<td><select><option>사이즈선택</option>
							<option><%=rs.getString("p_color")%></option></select></td>
				</tr>
				<tr>
					<td width="20px"></td>
					<th align="left">&nbsp;&ensp;금액</th>
					<td><%=rs.getString("p_price")%>원</td>
				</tr>
				<tr>
					<td width="20px"></td>
					<th align="left">&nbsp;&ensp;상세내역</th>
					<td colspan="2"><%=rs.getString("p_info")%></td>
				</tr>
				<tr>
				 	<td width="20px"></td>
					<td><button type="button" onclick="goPur(<%=rs.getString("p_no")%>)">주문하기</button></td>
					<td><button type="button" onclick="goPrePur(<%=rs.getString("p_no")%>)">장바구니</button></td>
				<tr>
			</table>
			
			<br> <br>
			<%=imgs.length %>
			
			<%if(imgs!=null)
			for(int i=1;i<imgs.length;i++){ %>
			<div align="center"><img src="img/<%=imgs[i]%>" width="500px" height="300px"></div>
<%
			}	
			%>
			
		</section>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
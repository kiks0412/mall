<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<script>
	function goPrePur() {
		alert("장바구니에 담았습니다");
		location = "Mb_pro_pur.jsp";
	}
	function goPur(p_no) {
		
		location = "Mb_pur.jsp?p_no="+p_no;
	}
	function go_dt_view(p_no) {
		//입력값 
		location ="Mb_pro_dt_view.jsp?p_no="+p_no;
	}
</script>
<jsp:include page="../common/head.jsp"></jsp:include>

<body>
		<section>
			<table align="center">
			<%
				String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
			Connection conn =jdbcUtil.connect();
				String sql = "select * from product";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					String p_img=rs.getString("p_img");
					String img="";
					if(p_img!=null){
						String[] imgs=p_img.split(",");
						img=imgs[0];
					}
			%>
			
				<tr>
					<td rowspan="5"><img src="<%=img%>"	width="500px" height="300px"></td>
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
					<td><button type="button" onclick="goPur(<%=rs.getString("p_no")%>)">주문하기</button></td>
					<td align="center"><button type="button" onclick="go_dt_view(<%=rs.getString("p_no")%>)">상세보기</button></td>
					<td><button type="button" onclick="goPrePur(<%=rs.getString("p_no")%>)">장바구니</button></td>
				<tr>
				
			
				<%} %>
			
			</table>
			
			
		</section>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
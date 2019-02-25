<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>shopping mall</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1 {
	font-family: "Raleway", Arial, sans-serif
}

h1 {
	letter-spacing: 6px
}

.w3-row-padding img {
	margin-bottom: 12px
}
</style>
<body>

	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 1500px">

<jsp:include page="../common/head.jsp"></jsp:include>
		<h3 align="center" width="80%">주문조회</h3>
		<table border="1" align="center">
		
		<span class='green_window'>
		<input type='text' class='input_text' />
		</span>
		<button type='submit' class='sch_smit'>검색</button>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>주문상품</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>회원명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>총주문액</th>
				<th>주문수량</th>
				<th>결제방식</th>
				<th>주문상태</th>
			</tr>
			<%
				String url = "jdbc:oracle:thin:@localhost";
				Connection conn = jdbcUtil.connect();
				String sql = "select o.o_no,o.o_date,p.p_name,o.p_color,o.p_size,o.m_name,o.m_tel,o.m_add,o.o_price,o.o_count, decode(o_pay,'1','카드','현금')as o_pay,decode(o_condition,'0','준비중','배송완료')as o_condition from ord o,product p where p.p_no=o.p_no";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("o_no")%></td>
				<td><%=rs.getString("o_date")%></td>
				<td><%=rs.getString("p_name")%></td>
				<td><%=rs.getString("p_color")%></td>
				<td><%=rs.getString("p_size")%></td>
				<td><%=rs.getString("m_name")%></td>
				<td><%=rs.getString("m_tel")%></td>
				<td><%=rs.getString("m_add")%></td>
				<td><%=rs.getString("o_price")%></td>
				<td><%=rs.getString("o_count")%></td>
				<td><%=rs.getString("o_pay")%></td>
				<td><%=rs.getString("o_condition")%></td>
			</tr>
			<%
				}
			%>


		</table>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/head.jsp"></jsp:include>
<script>
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


		<h3 align="center" width="80%">주문조회</h3>
		<span class='green_window'>
		<input type='text' class='input_text' />
		</span>
		<button type='submit' class='sch_smit'>검색</button>
		<table border="1" align="center">
		
		
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

				Connection conn =jdbcUtil.connect();
				String sql = "select o.o_no,o.o_date,p.p_name,o.p_color,o.p_size,o.m_name,o.m_tel,o.m_add,o.o_price,o.o_count, decode(o_pay,'1','카드','현금')as o_pay,decode(o_condition,'0','배송완료','준비중')as o_condition from ord o,product p where p.p_no=o.p_no and M_id=? order by o.o_no";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,(String)session.getAttribute("M_id"));
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
</body>
</html>
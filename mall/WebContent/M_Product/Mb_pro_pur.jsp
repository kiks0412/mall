<%@page import="java.util.ArrayList"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/head.jsp"></jsp:include>

<script>
	
</script>

	<%

		Connection conn =jdbcUtil.connect();
		String sql = "select p_name,p_img,p_color,p_size,count(*)p_count,p_price from product where p_no=? group by p_name,p_img,p_color,p_size,p_price";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("p_no"));
		ResultSet rs = pstmt.executeQuery();
	%>
	 <%
        request.setCharacterEncoding("UTF-8");
 
        ArrayList<String> arr = (ArrayList<String>) (session.getAttribute("productList"));
 
        String productName = request.getParameter("product");
 
        /* arrayList 안에 아무것도 없으면 arrayList 생성 */
        if (session.getAttribute("productList") == null) {
            arr = new ArrayList<String>();
        }
        arr.add(productName);
        session.setAttribute("productList", arr);
    %>
 
    <script>alert("<%=rs.getString("p_name")%>가 추가되었습니다.");history.back();</script>
 
<jsp:include page="../common/footer.jsp"></jsp:include>
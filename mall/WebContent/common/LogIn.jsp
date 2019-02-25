<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%
String M_id = request.getParameter("M_id");
String M_passwd = request.getParameter("M_passwd");

Connection conn =jdbcUtil.connect();
String sql = "SELECT M_ID, M_PASSWD, M_TEL, M_NAME, M_ADD FROM MEMBER WHERE M_ID = ? AND M_PASSWD = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, M_id);
pstmt.setString(2, M_passwd);
ResultSet rs = pstmt.executeQuery();
boolean wh = rs.next();
if(wh == true){
	session.setAttribute("M_id", M_id);
	session.setAttribute("M_tel", rs.getString("M_tel"));
	session.setAttribute("M_name", rs.getString("M_name"));
	session.setAttribute("M_add", rs.getString("M_add"));
	
	if(M_id.equals("admin")){
		session.setAttribute("admin", M_id);		
	}	
	response.sendRedirect("../M_Product/main.jsp");
}else{%>
<script>
alert("아이디가 맞지 않습니다.")
history.go(-1);
</script>
<%}%>
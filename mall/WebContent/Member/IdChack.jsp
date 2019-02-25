<%@page import="common.jdbcUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"  %>
<%
Connection conn = jdbcUtil.connect();
String sql = "SELECT M_ID FROM MEMBER WHERE M_ID = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
String M_id = request.getParameter("M_id");
pstmt.setString(1, M_id);
ResultSet rs = pstmt.executeQuery();

String result = "사용 가능";
if(rs.next()){
	result = "사용 불가";
}

%>
<%=result %>
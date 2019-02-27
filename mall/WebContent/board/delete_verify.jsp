<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head><title> 게시판 </title></head>
<body>
<%

String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
int b_no = Integer.parseInt(request.getParameter("b_no"));
String sql = "delete board " +
" where b_no =" + b_no ;
PreparedStatement pstmt= conn.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery();

%>
<script>
alert("삭제되었습니다.");
location.href="list.jsp";
</script>
<%
pstmt.close();
conn.close();
%>
31:
32:
</body>
</html>
2.7 게시판 글 삭제 : delete_verify.jsp
</body>
</html>
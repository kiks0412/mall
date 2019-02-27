<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title> 게시판 </title></head>
<body>
<%

request.setCharacterEncoding("utf-8");
String m_id = request.getParameter("m_id");
String b_title = request.getParameter("b_title");

String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";
Connection conn = jdbcUtil.connect();
String b_contents = request.getParameter("b_contents");
String sql = "insert into board " +
" (b_no, m_id, b_title, b_contents, b_date) " +
" values ( ( select max(b_no)+1 from board ), " +
" '" + m_id + "', " +
" '" + b_title + "', " +
" '" + b_contents + "', " +
" sysdate, " +
" 1 )";
PreparedStatement pstmt= conn.prepareStatement(sql);
try {
pstmt.executeQuery(sql);
%>
<script>
alert("저장되었습니다.");
location.href="list.jsp";
</script>
<%
} catch(SQLException ex) {
%>
<script>
alert("<%= sql %>");
location.href = "insert_form.jsp";
</script>
<%
} finally {
if (pstmt != null)
try { pstmt.close();
conn.close();
} catch(SQLException ex) { }
}
%>
</body>
</html>
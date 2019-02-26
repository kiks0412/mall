<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%
Connection conn =jdbcUtil.connect();
Statement stmt = null;
ResultSet myResultSet = null;
String sql = "";
String dbdriver = "oracle.jdbc.OracleDriver";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user= "mall";
String passwd= "1234";
try {
Class.forName(dbdriver);
Connection conn = DriverManager.getConnection (dburl, user, passwd);
PreparedStatement pstmt = conn.prepareStatement(sql);
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
}
%>
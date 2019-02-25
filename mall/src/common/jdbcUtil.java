package common;

import java.sql.*;

public class jdbcUtil {
	public static Connection connect() throws SQLException {
		String url = "jdbc:oracle:thin:@192.168.0.29:1521:xe";  
		Connection conn = DriverManager.getConnection(url, "mall", "1234");
		return conn;
		
	}

}

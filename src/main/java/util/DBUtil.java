package util;

import java.sql.DriverManager;

public class DBUtil {
	public static connecton get Connection( ) {
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
	}
}

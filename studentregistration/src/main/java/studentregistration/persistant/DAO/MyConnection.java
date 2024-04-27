package studentregistration.persistant.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
static Connection con = null;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/register";
			String username = "root";
			String password = "myaphoothwe";
			con = DriverManager.getConnection(db,username,password);
		}catch(ClassNotFoundException e) {
			System.out.println("Driver class not found " + e);
		}catch(SQLException e){
			System.out.println("SQL not founds " + e);
		}
		return con;
	}
}



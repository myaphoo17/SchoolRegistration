package com.stuReg.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	static Connection con=null;
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/stu";
			String username="root";
			String password="myaphoothwe";
			con=DriverManager.getConnection(url,username,password);
			
			
		}catch(ClassNotFoundException e) {
			System.out.println("Class not found  :"+e);

			
		}catch(SQLException e) {
			System.out.println("SQL Exception :"+e);
		}
		
		return con;
		
	}
}

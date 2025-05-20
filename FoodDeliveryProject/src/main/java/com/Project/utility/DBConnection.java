package com.Project.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{
	private static final String URL = "jdbc:mysql://localhost:3306/advanced_java_project";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	static Connection connection; 
	
	public static Connection getConnection()
	{
		 
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
			if(connection != null)
			{
				System.out.println("Connection got");
			}
			else
			{
				System.out.println("Connection not got");
			}
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return connection;
	}
}

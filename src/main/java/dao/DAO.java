package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DAO {
	public static Connection con = null;
	
	public DAO()  {
		if(con == null){
			String dbUrl ="jdbc:mysql://localhost:3306/qltv";
		
			String dbClass = "com.mysql.jdbc.Driver";
			try {
			Class.forName(dbClass);
			con = DriverManager.getConnection (dbUrl, "root",
			 "");
                        System.out.print("connect  successfull");
			}catch(Exception e) {
			e.printStackTrace();
                        System.out.print(e);
			}
			}
	}
}

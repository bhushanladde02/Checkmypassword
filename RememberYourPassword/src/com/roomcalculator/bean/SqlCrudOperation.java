package com.roomcalculator.bean;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

public class SqlCrudOperation {
	
 // public static void Connection()
      
	   protected static final String dbName="checkmyp_assword";
	   //Local
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/"+dbName;//savepasswords.com";
	   static final String USER = "root";
	   static final String PASS = "";
	   //End Local
	  
	

	// private  static final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";  
	// private  static final String DB_URL = "jdbc:mysql://localhost/"+dbName;
	// private  static final String USER = "checkmyp";
	// private  static final String PASS = "byj!@#~";
	
	   
	   
	   public static void createTable(String query,String id)
	   {
		   try{
		   Connection Conn=getConnection();
		   Statement stmt = Conn.createStatement();
		      
		      String sql = "CREATE TABLE temp"+id+" (data VARCHAR(255))"; 
		      //System.out.println("Create Query :"+sql);
		      stmt.executeUpdate(sql);
		      String queryInsert="insert into temp"+id+" (data) values('"+query+"')";
		      //System.out.println("Query insert :"+queryInsert);
		      insertQuery(queryInsert);
		   }
		   catch(Exception e)
		   {
			   System.out.println(e);
		   }
	   }

	   public static void droptable(String query)
	   {
		   try{
		   Connection Conn=getConnection();
		   Statement stmt = Conn.createStatement();
		   String sql = " drop table temp"+query.trim(); 
		   //bhushan remove drop table method
           stmt.executeUpdate(sql);
		   }
		   catch(Exception e)
		   {
			   System.out.println(e);
		   }
	   }
	   public static Connection getConnection()
	   {
		   Connection conn = null;
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName(JDBC_DRIVER);

		      //STEP 3: Open a connection
		      //System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);
		     // conn=DriverManager.getConnection(url);

		      //STEP 4: Execute a query
		      //System.out.println("Creating statement...");
		    }
		   catch(Exception exe)
		   {
			   System.out.println(exe);
		   }
		   return conn;
	   }
	   public static ResultSet selectQuery(String sqlData){  ///Require
	   ResultSet rs=null; 
		   try{
				  Statement stmt = null;
			      stmt = getConnection().createStatement();
			      String sql=sqlData;
			      rs = stmt.executeQuery(sql);
			  }catch(SQLException sqle){
				  sqle.printStackTrace();
			  }catch(Exception exe){
			   exe.printStackTrace();
			 }
	   return rs;		   
	   }
	   
	 public static ResultSet selectQueryAuthenticationPreparedStatement(String username,String password){
		   ResultSet rs=null; 
		   try{
			   //
			   //String selectSQL = "SELECT USER_ID, USERNAME FROM DBUSER WHERE USER_ID = ?";
			   String selectSQL="select * from register where (username=? or email=?) and password=?";
			   PreparedStatement preparedStatement = getConnection().prepareStatement(selectSQL);
			   preparedStatement.setString(1, username);
			   preparedStatement.setString(2, username);
			   preparedStatement.setString(3, password);
			   rs = preparedStatement.executeQuery(); 
			  }catch(SQLException sqle){
				  sqle.printStackTrace();
			  }catch(Exception exe){
			   exe.printStackTrace();
			 }
	     return rs;		   
	   }
	   
	   public static int updateQuery(String updateQuery)
	   {
		   int valueSuccess=0;
		   try{
				  Statement stmt = null;
			      stmt = getConnection().createStatement();
			      String sql=updateQuery;
			      valueSuccess = stmt.executeUpdate(sql);
			  }
		     catch(Exception exe)
			 {
			   System.out.println(exe);
			 } 
		     return valueSuccess;
	   }
	   public static int deleteQuery(String deleteQuery)
	   {
		   int valueSuccess=0;
		   try{
				  Statement stmt = null;
			      stmt = getConnection().createStatement();
			      String sql=deleteQuery;
			      valueSuccess = stmt.executeUpdate(sql);
			  }
		     catch(Exception exe)
			 {
			   System.out.println(exe);
			 } 
		     return valueSuccess;
	   }
	   
	   public static int insertQuery(String insertQuery)
	   {
		   int valueSuccess=0;
		   try{
				  Statement stmt = null;
			      stmt = getConnection().createStatement();
			      String sql=insertQuery;
			      valueSuccess = stmt.executeUpdate(sql);
			  }
		     catch(Exception exe)
			 {
			   System.out.println(exe);
			 } 
		     return valueSuccess;
	   }
	   
	  
	   
	   public static boolean checkTableExist(String tableName) //bhushan new method
	   {
		   try{
			   DatabaseMetaData dbm = getConnection().getMetaData();
			   // check if "employee" table is there
			   ResultSet tables = dbm.getTables(null, null, tableName, null);
			   if (tables.next()) {
				   return true;
			   }
			   else {
				   return false;
			   }

		   }
		   catch (Exception e) {
			   System.out.println("Got a exception in table check");
			   return false;
		   }

	   }
	   
  

}

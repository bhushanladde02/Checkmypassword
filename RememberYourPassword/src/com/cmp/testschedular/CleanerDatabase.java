package com.cmp.testschedular;
//STEP 1. Import required packages
import java.sql.*;
import java.util.Timer;
import java.util.TimerTask;

import com.roomcalculator.bean.SqlCrudOperation;

public class CleanerDatabase extends SqlCrudOperation {
 public static void main(String[] args) {
	 /*Timer timer = new Timer();
	
	 timer.scheduleAtFixedRate(new TimerTask() {

	     @Override
	     public void run() {
	    	 deletecontent();
	    	 
	     }

	 }, 0, 10);*/
	 
	 deletecontent();
}  
 public static void deletecontent(){
   Connection conn = null;
   Statement stmt = null;
   String databasename=SqlCrudOperation.dbName;
   String table1="details";
   String table2="register";
   String table3="details_bck";
   String table4="register_BCK";
   try{
      Class.forName("com.mysql.jdbc.Driver");
    //  System.out.println("Connecting to database...");
      conn = SqlCrudOperation.getConnection();
    //  System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
      sql = "SET FOREIGN_KEY_CHECKS = 0";
      ResultSet rs = stmt.executeQuery(sql);
      String sql1=" SET @tables = NULL";
      rs = stmt.executeQuery(sql1);
      String sql2=" SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables   FROM information_schema.tables   WHERE table_schema = '"+databasename+"' and table_name<>'"+table1+"' and table_name<>'"+table2+"' and table_name<>'"+table3+"' and table_name<>'"+table4+"'";
      rs = stmt.executeQuery(sql2);
      String sql3=" SET @tables = CONCAT('DROP TABLE ', @tables) ";
      rs= stmt.executeQuery(sql3);
      String sql4="PREPARE stmt FROM @tables"; 
      rs= stmt.executeQuery(sql4);
      String sql5="EXECUTE stmt";
      rs= stmt.executeQuery(sql5);
      String sql6=" DEALLOCATE PREPARE stmt";
      rs= stmt.executeQuery(sql6);
      String sql7="SET FOREIGN_KEY_CHECKS = 1;";
      rs= stmt.executeQuery(sql7);
      System.out.println("done");
     }catch(SQLException se){
      se.printStackTrace();
   }catch(Exception e){
      e.printStackTrace();
   }
}
}
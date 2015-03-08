package com.roomcalculator.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import com.encryption.GetEncrypt;
import com.roomcalculator.pojo.Maindata;
import com.roomcalculator.pojo.MyCrypto;

public class LoginActionBean {
	public static String authenticateUser;
	//public static String sqlSelectSemisterList;
	//public static String sqlSelectSubjectList;
	//public static String sqlSelectProfessor;

	public LoginActionBean()
	{
		//sqlSelectDivisionList="select * from division";
		//sqlSelectSubjectList="select * from subject";
		//sqlSelectSemisterList="select * from semister";
	}
	public ResultSet selectQuery(String query)
	{
		return SqlCrudOperation.selectQuery(query); ///Require
	}
	public boolean otpCheck(String userEnter,String tableName)
	{
		try{
				String table="temp"+tableName.trim();
				ResultSet rs=SqlCrudOperation.selectQuery("select data from "+table); ///Require
				rs.next();				
				String data=rs.getString("data");
				//System.out.println("data is::::::::"+data);
				if(userEnter.equalsIgnoreCase(data)){
					//System.out.println("Dropping table id:"+tableName);
					//droptable(tableName);//bhushan
					//unnessesaricontent(table)//bhushan
					return true;
				}
				else{		
					//droptable(tableName);
				return false;
				}
		}
		catch(Exception e)
		{
			System.out.println("Otp Check Table creation Problem occure");
			return false;
		}
	}
	
	public void createTable(String insertData,String id,int a)
	{
		if(a==1){
				String queryRetriveMobilenumber="SELECT  mobilenumber FROM  register  WHERE userId_Pk="+id;
				String mobilenumber=getUsermobilenumber(queryRetriveMobilenumber);
				GetEncrypt encryptd = new GetEncrypt();//jyo
				byte[] encryptedData =  encryptd.encryptData(insertData, mobilenumber); //Jyoshana Encrypt
				String password=encryptd.ByteToString(encryptedData);
				//System.out.println("value putting in database::"+password);
				SqlCrudOperation.createTable(password,id);
		}
		else
		{
				SqlCrudOperation.createTable(insertData,id);	
		}
	}
	public void droptable(String id)
	{
		/*String query="select data from temp"+id;
		ResultSet rs=SqlCrudOperation.selectQuery(query);
		rs.next();
		Strin*/
		SqlCrudOperation.droptable(id);
	}
	public String getSecurityPIN(String idValue1,int a)
	{
		if(a==1){ //inserting code here
				//System.out.println("Id value" +idValue1);
				String queryRetriveMobilenumber="SELECT  mobilenumber FROM  register  WHERE userId_Pk="+idValue1;
				String mobilenumber=getUsermobilenumber(queryRetriveMobilenumber);
				GetEncrypt encryptd = new GetEncrypt();
				String key=null;
				try{
				 ResultSet rsFirstRecord=SqlCrudOperation.selectQuery("Select data from temp"+idValue1); ///Require
				 rsFirstRecord.next();
				 String fetchRecord=rsFirstRecord.getString("data");
				 //System.out.println("fetch Record:::"+fetchRecord);
				 byte[] convertedRecord=encryptd.StringToByte(fetchRecord);
				 //key=rsFirstRecord.getString("data");
				 key=encryptd.decryptData(convertedRecord,mobilenumber);
				 //System.out.println("key value after decrupting is::::"+key);
				}catch(Exception e)
				{
				  System.out.println("Got an exception to retrive security key");	
				}
				return key;
		}
		else
		{
			String key=null;
			try{
			 ResultSet rsFirstRecord=SqlCrudOperation.selectQuery("Select data from temp"+idValue1); ///Require
			 rsFirstRecord.next();
			 key=rsFirstRecord.getString("data");
			}catch(Exception e)
			{
			  System.out.println("Got an exception to retrive security key");	
			}
			return key;
		}
	}
	public Collection<Maindata> listData(String id,String idValue1)
	{
		Collection<Maindata>   contryList=new ArrayList<Maindata>();
		GetEncrypt encryptd = new GetEncrypt();
		String key=getSecurityPIN(idValue1,1);
		//System.out.println("Key is to edit the data::::::::::::::::::::::::::::::::::::::::::::::::"+key);
		//System.out.println("Decrypted data::::::"+ encryptd.decryptData(encryptedData,key));	
		try{  
			String query="select * from details where userId_fk='"+id+"'";
			//System.out.println(query);
			ResultSet rs=SqlCrudOperation.selectQuery(query); ///Require
			
			while(rs.next())
			{ 
				//System.out.println("Before Bhushan decrypt :"+rs.getString("passwordweb"));
				//String data=MyCrypto.decrypt(rs.getString("passwordweb"));//bhushan decrypt
				String data=rs.getString("passwordweb");//bhushan decrypt			
				//System.out.println("data coming from database :::::::::::::::::"+data);
				//System.out.println("Paramter sending for decription:::::::::::::::::::::::::::::;"+data);
				//System.out.println("After Bhushan decrypt :"+data);
				String finalQuery=encryptd.decryptData(encryptd.StringToByte(data),key); //jyoshna decrypt
				data=finalQuery;
				
				String data1=rs.getString("usernameweb");
				String finalQuery1=encryptd.decryptData(encryptd.StringToByte(data1),key); //jyoshna decrypt
				data1=finalQuery1;
				
				//System.out.println("After Jyoshna decrypt :"+finalQuery);
				//System.out.println("details id:::::"+rs.getString("detailsId"));
				contryList.add(new Maindata(rs.getString("detailsId"),rs.getString("weblink"),data1,data,id)); 
			};	  
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in query retriving method"+exe); 
		}
		return contryList;
		
	}
	public String getUsermobilenumber(String query)
	{
		String queryValue=query;
		String result=null;
		try{  
			
			System.out.println(query);
			ResultSet rs=SqlCrudOperation.selectQuery(query); ///Require
			rs.next();
			result=rs.getString("mobilenumber");	
				 
			  
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return result;
	}
	public Collection<String> countryList()
	{
		Collection<String>   contryList=new ArrayList<String>();
		try{  
			String query="select * from Country";
			System.out.println(query);
			ResultSet rs=SqlCrudOperation.selectQuery(query); ///Require
			while(rs.next()){ contryList.add(rs.getString("name"));  };	  
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return contryList;
		
	}
	public Maindata getEdit(String query,String idValue1)
	{
		Maindata main=new Maindata();
		GetEncrypt encryptd = new GetEncrypt();
		try{  
			String selectQuery=query;
			//System.out.println(authenticateUser);
			ResultSet rs=SqlCrudOperation.selectQuery(selectQuery); ///Require
			rs.next();
			main.setDetailsId(rs.getString("detailsId"));
			main.setWeblink(rs.getString("weblink"));  
			
			String key=getSecurityPIN(idValue1,1);
			
			String username=rs.getString("usernameweb");
			username=encryptd.decryptData(encryptd.StringToByte(username),key);
			main.setUsername(username);
			
			
			//String finalQuery=encryptd.decryptData(encryptd.StringToByte(data),key); //jyoshna decrypt
			String finalQuery=rs.getString("passwordweb");
			finalQuery=encryptd.decryptData(encryptd.StringToByte(finalQuery),key);
			main.setPassword(finalQuery);
			
			
			//main.setUsername(rs.getString("usernameweb"));
			
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return main;
	}
	public String getAuthenticate(String username,String password)
	{
		String loginid="";
		try{  
			//select *  from register where (username='bhushanladde02' or email='bhushan' ) and password='1234'
			//String selectQuery="select *  from register where (username='"+username+"' or email='"+username+"') and password='"+password+"'";
			
			//System.out.println(authenticateUser);
			//ResultSet rs=SqlCrudOperation.selectQuery(selectQuery);
			ResultSet rs=SqlCrudOperation.selectQueryAuthenticationPreparedStatement(username,password);
			rs.next();
			loginid=rs.getString("userId_Pk");   
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return loginid;
	}
	
	
	public String getPasswordByEmail(String query){
		String password="";
		try{
			
			ResultSet rs=SqlCrudOperation.selectQuery(query); ///Require
			rs.next();
			password=rs.getString("password");
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return password;
	}
	
	public boolean checkAlready(String query)
	{
		String queryValue=query;
		boolean flag=false;
		try{  
		
			//System.out.println(authenticateUser);
			ResultSet rs=SqlCrudOperation.selectQuery(queryValue); ///Require
			rs.next() ;
		    Integer pvalue=Integer.parseInt(rs.getString("count"));	  
		    System.out.println("PVALUE"+pvalue);
		    if(pvalue!=null && !pvalue.equals("") && pvalue==0)
		    {
		    	flag=true;
		    }
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		
		return flag;
	}
	public int register(String query)
	{
		int flag=SqlCrudOperation.insertQuery(query);
		System.out.println("Inserting re bho::"+flag);
		return flag;
		
	}
	
	public boolean checkTable(String tablename) //bhushan code start
	{
		return SqlCrudOperation.checkTableExist(tablename); //bhashan
	}
	
	public void unnessesaricontent(String idvalue)
	{
		LoginActionBean bean=new LoginActionBean();
		String id=idvalue;
		boolean b1=false;
		//System.out.println("table values:::::::::::::::::::::::::::::::::"+bean.checkTable("temp"+id));
		if(bean.checkTable("temp"+id)) //bhushan code change
		{
			b1=true;				
		}
		if(b1){
			bean.droptable(id);
		}			
		//
		
		//ResultSet rs1=bean.selectQuery("select * from temp"+id+"OTP"); //deleting otp table when login if it is exist//bhushan
		boolean b=false;
		if(bean.checkTable("temp"+id+"OTP"))//bhushan
		{
			b=true;				
		}
		if(b){
			bean.droptable(id+"OTP");
		}
	}
/*
    	
	public String getProfessor(String profUsername)
	{
		String professorId="";
		try{  
			sqlSelectProfessor="select professorid from professor where username='"+profUsername+"'";
			ResultSet rs=SqlCrudOperation.selectQuery(sqlSelectProfessor);
			while(rs.next()){ professorId=rs.getString("professorid"); break; };	  
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return professorId;
	}
	public ArrayList getAllDiv()
	{
		ArrayList divList=null;
		try
		{public Division(String divId, String divisionName)
			divList=new ArrayList();		
			ResultSet rs=SqlCrudOperation.selectQuery(sqlSelectDivisionList);
			while(rs.next()){ 
				Division div=new Division(rs.getString("id"),rs.getString("Name")); 
				divList.add(div);
			};
			 
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in division retriving method"+exe); 
		}
		return divList;
	}

	public ArrayList getAllSem()
	{
		ArrayList semList=null;
		try
		{	public Semister(String semId, String semnumber, String semisterName)
			semList=new ArrayList();		
			ResultSet rs=SqlCrudOperation.selectQuery(sqlSelectSemisterList);
			while(rs.next()){ 
				Semister sem=new Semister(rs.getString("id"),rs.getString("semnumber"),rs.getString("semisterName")); 
				semList.add(sem);
			};
			 
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in semister retriving method"+exe); 
		}
		return semList;
	}

	public ArrayList getAllSub()
	{
		ArrayList subList=null;
		try
		{public Subject(String subjectId, String subjectName, String semisterId)
			subList=new ArrayList();		
			ResultSet rs=SqlCrudOperation.selectQuery(sqlSelectSubjectList);
			while(rs.next()){ 
				Subject sub=new Subject(rs.getString("subjectid"),rs.getString("subjectname"),rs.getString("semisterid")); 
				subList.add(sub);
			};		
			
		}
		catch(Exception exe)
		{
			System.out.println("Got Exception in professor retriving method"+exe); 
		}
		return subList;
	}

*/
}

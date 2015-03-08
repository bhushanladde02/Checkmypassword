/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roomcalculator.action;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.encryption.GetEncrypt;
import com.roomcalculator.bean.LoginActionBean;
import com.roomcalculator.bean.SqlCrudOperation;
import com.roomcalculator.form.RegisterForm;
import com.roomcalculator.pojo.GenerateId;
import com.roomcalculator.pojo.Maindata;
import com.roomcalculator.pojo.MyCrypto;
import com.roomcalculator.pojo.SMS;

/**
 *
 * @author eswar@vaannila.com
 */
public class RegisterAction extends Action  {

	/* forward name="success" path="" */
	private final static String SUCCESS = "success";
	private final static String FAILURE = "failure";
	protected  int  data=0;
	/**
	 * This is the action called from the Struts framework.
	 * @param mapping The ActionMapping used to select this instance.
	 * @param form The optional ActionForm bean for this request.
	 * @param request The HTTP Request we are processing.
	 * @param response The HTTP Response we are processing.
	 * @throws java.lang.Exception
	 * @return
	 */
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		List cout=new ArrayList();
		HttpSession session=request.getSession(false);//change - paramter passing active session object
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); 
		response.setDateHeader("Expires",-1);  		
		//System.out.println("Session value::::"+session);
		String id=request.getParameter("id");
		String value=(String)session.getAttribute("sessionvalue");
		
		if(!request.getParameter(session.getAttribute("Tkey").toString()).equals(session.getAttribute("Tvalue").toString())){
			return  mapping.findForward("failure");
		}
		
		if(value!=null && !value.equalsIgnoreCase("") )
		{
			cout.add(value);
            //System.out.println("I am in session");
			if(id.equalsIgnoreCase("addDetailsIntoDatabase")){ 				
				return  mapping.findForward("failure");
			}
			else if(id.equalsIgnoreCase("editRemain"))
			{
				request.getSession();
				return  mapping.findForward("edit");
			}
			else if(id.equalsIgnoreCase("editfail"))
			{
				LoginActionBean bean=new LoginActionBean();
				String str=(String)session.getAttribute("sessionvalue");//bhushan
				//bean.droptable(str); //new code
				//bean.droptable(str+"OTP");		//new code	
				bean.unnessesaricontent(str);//bhushan
				session.invalidate();
				//System.out.println("Out of session");
				return  mapping.findForward("sessionend");
			}			
			else if(id.equalsIgnoreCase("SuccessOtpRemain"))
			{
				request.getSession();
				//System.out.println("I am in alive");
				return  mapping.findForward("Successotp");				
			}
			else if(id.equalsIgnoreCase("SuccessOtpfail"))
			{
				LoginActionBean bean=new LoginActionBean();
				String str=(String)session.getAttribute("sessionvalue");//bhushan
				//bean.droptable(str); //new code
				//bean.droptable(str+"OTP");		//new code	
				bean.unnessesaricontent(str);//bhushan	
				session.invalidate();
				//System.out.println("Out of session");
				return  mapping.findForward("sessionend");			
			}
			else if(id.equalsIgnoreCase("aliveMainPage")) //bhushan
			{
			  request.getSession();//bhushan
			  //System.out.println("I am in alive");//bhushan
			  return  mapping.findForward("Successotp"); //bhushan code end				
			}
			else if(id.equalsIgnoreCase("alive"))
			{
				request.getSession();
				//System.out.println("I am in alive");
				return  mapping.findForward("otp");
			}
			else if(id.equalsIgnoreCase("pass2")){ // room is already register but user is not register //bhushan code start
				//System.out.println("I am pass2");
				LoginActionBean bean=new LoginActionBean();
				RegisterForm registerForm = (RegisterForm) form;
				String userid=(String) session.getAttribute("sessionvalue");
				bean.droptable(userid+"OTP");
				//
				String generatedOtp=GenerateId.getOtp();				
				String queryRetriveMobilenumber="SELECT  mobilenumber FROM  register  WHERE userId_Pk="+userid;
				String mobilenumber=bean.getUsermobilenumber(queryRetriveMobilenumber);				
				String idValue=(String)session.getAttribute("sessionvalue");				
				//String query="";
				if(!bean.checkTable("temp"+idValue+"OTP")){ //bhushan
				bean.createTable(generatedOtp,idValue+"OTP",2);
				SMS.sendSMS(mobilenumber, "Your OTP is :"+generatedOtp);				
				registerForm.setMessage("");
				registerForm.setUpdationMessage("");
				request.setAttribute("message", "");
				registerForm.setOtpMessage("Otp sent to your mobile");
				request.setAttribute("otpMessage", "Otp sent to your mobile");
				////System.out.println(registerForm.getUrl());
				return  mapping.findForward("otp");
				}
				else//bhushan
				{
					return  mapping.findForward("otpAlreadyGenerated");//bhushan
				}
				//
				
			 }
			else if(id.equalsIgnoreCase("pass")){ // room is already register but user is not register//bhushan code start
				LoginActionBean bean=new LoginActionBean();
				//System.out.println("pass");
				////System.out.println("I am in logout");
				//HttpSession session=request.getSession();
				String generatedOtp=GenerateId.getOtp();				
				//String selectQuery="select count(*) as count from register where username='"+username+"' and password='"+password+"'";
				String userid=(String) session.getAttribute("sessionvalue");
				String queryRetriveMobilenumber="SELECT  mobilenumber FROM  register  WHERE userId_Pk="+userid;
				String mobilenumber=bean.getUsermobilenumber(queryRetriveMobilenumber);				
				String idValue=(String)session.getAttribute("sessionvalue");				
				//String query="";
				if(!bean.checkTable("temp"+idValue+"OTP")){ //bhushan
				bean.createTable(generatedOtp,idValue+"OTP",2);
				SMS.sendSMS(mobilenumber, "Your OTP is :"+generatedOtp);
				
				RegisterForm registerForm = (RegisterForm) form;
				registerForm.setMessage("");
				registerForm.setUpdationMessage("");
				request.setAttribute("message", "");
				request.setAttribute("updationMessage", "");
				registerForm.setOtpMessage("");
				request.setAttribute("otpMessage", "");
				////System.out.println(registerForm.getUrl());
				return  mapping.findForward("otp");
				}
				else//bhushan
				{
					return  mapping.findForward("otpAlreadyGenerated");//bhushan
				}//bhushan code end
				
			}
			else if(id.equalsIgnoreCase("Otpcheck")){ // room is already register but user is not register
				LoginActionBean bean=new LoginActionBean();
				////System.out.println("I am in logout");
				//System.out.println("Otpcheck");
				
				//HttpSession session=request.getSession();
				RegisterForm registerForm = (RegisterForm) form;
				String finalOtp=registerForm.getOtp();
				//System.out.println(finalOtp);
				//String alreadyGenerated=(String)session.getAttribute("flagOtp");//bhushan
				String idValue1=(String)session.getAttribute("sessionvalue");
				boolean value1=bean.otpCheck(finalOtp,idValue1+"OTP");
			
				if(value1/* && !alreadyGenerated.equalsIgnoreCase("Alreadygenrated")*/){//bhushan
				//String mainKey=registerForm.getTimepass();
				bean.droptable(idValue1+"OTP");//bhushan
				Collection<Maindata> listUsers = bean.listData(value,idValue1);
				//session.setAttribute("flagOtp", "Alreadygenrated");//bhushan
				request.setAttribute("listUsers", listUsers);
				registerForm.setMessage("");
				registerForm.setUpdationMessage("");
				request.setAttribute("message", "");
				request.setAttribute("updationMessage", "");
				registerForm.setOtpMessage("");
				request.setAttribute("otpMessage", "");
				////System.out.println(registerForm.getUrl());
				return  mapping.findForward("Successotp");
				}
				//else if(alreadyGenerated.equalsIgnoreCase("Alreadygenrated"))//bhushan
				//{
				//	return  mapping.findForward("otpAlreadyGenerated");//bhushan
				//}
				else
				{
					registerForm.setOtpMessage("You Enter wrong OTP");
					request.setAttribute("otpMessage", "You Enter wrong OTP");
					return  mapping.findForward("otp");	
				}
			}      	
			else if(id.equalsIgnoreCase("addDetails")){ // room is already register but user is not register
				LoginActionBean bean=new LoginActionBean();
				//System.out.println("addDetailsIntoDatabase");
				RegisterForm registerForm = (RegisterForm) form;
				String idValue1=(String)session.getAttribute("sessionvalue");
				String url=registerForm.getUrl();
				String username=registerForm.getUsername();
				String password=registerForm.getPasswordRegisterData();
				//String key=registerForm.getTimepass();
				////System.out.println("Main Security PIN is Require for encryption(add details)::"+key);
				String flag1=request.getParameter("flag");
				if(flag1!=null && flag1.equals("1"))
				{
					url="Enter Website Link";
					username="Enter Username";
					password="Password";
					//key="Enter Security PIN";
				}
				if(url!=null && !url.equalsIgnoreCase("")&&!url.equalsIgnoreCase("Enter Website Link".trim()) && !username.equalsIgnoreCase("Enter Username".trim()) && !password.equalsIgnoreCase("Password".toString())){
			    String querySelect="select count(*) as count from details where weblink='"+url+"' and userId_fk="+idValue1+"";
			    if(bean.checkAlready(querySelect)){
			    	
				    	//jyotsana 1 level encryption
			    	    //System.out.println("Simple Password::"+password);
			    	    //System.out.println("Before Jyoshna Incrypt :"+password);
						GetEncrypt encryptd = new GetEncrypt();//jyo
						//ResultSet rsFirstRecord=SqlCrudOperation.selectQuery("Select data from temp"+idValue1);
						//rsFirstRecord.next();
						//String key=rsFirstRecord.getString("data");
						String key=bean.getSecurityPIN(idValue1,1);
						//System.out.println("key value isL:::::::::::::::::::::::::::"+key);
						byte[] encryptedData =  encryptd.encryptData(password, key); //Jyoshana Encrypt
						password=encryptd.ByteToString(encryptedData);
					
						byte[] encryptedData1 =  encryptd.encryptData(username, key); //Jyoshana Encrypt
						username=encryptd.ByteToString(encryptedData1);
						
						//System.out.println("Encrypted Data::::::::::::::::::::::::::::::::::::"+encryptedData);
						//System.out.println("Value passing to database::::::::::::::::::::::::::::::::::::"+password);
						
						////System.out.println("After Jyoshna Incrypt :"+password);
						////System.out.println(encryptedData.toString());
						////System.out.println("Decrypted data::::::"+ encryptd.decryptData(encryptedData,"207244291"));	
						
						//End jyotsana
			    	    //bhushan Change : MyCrypto.encrypt(password)
			    		String query="INSERT INTO `details` (`weblink`, `usernameweb`, `passwordweb`, `userId_fk`) VALUES ('"+url+"', '"+username+"', '"+password+"', '"+value+"')"; //bhushan Encrypt
			    	//	//System.out.println("After Bhushan Incrypt :"+MyCrypto.encrypt(password));
			    		////System.out.println(registerForm.getUrl());
						int flag= bean.register(query);
						if(flag!=0)
						{ 
							//System.out.println("I am in flag");
							registerForm.setMessage("Data successfully inserted");
						    request.setAttribute("message", "Data successfully inserted");
							return  mapping.findForward("success");
							///return mapping.findForward("successReg");
							
						}
						else
						{
							System.out.println("Insertion Query Zol");
							registerForm.setMessage("Data is not inserted");
							request.setAttribute("message", "Data is not inserted");
							//return  mapping.findForward("failure");
							return  mapping.findForward("success");
						}
			    }
			    else 
			    {
			    	registerForm.setMessage("Data for this website is already registered If you want to change please go to view password");
					request.setAttribute("message", "Data for this website is already registered If you want to change please go to view password");
					return  mapping.findForward("success");
			    }
				}
				else
				{
					registerForm.setMessage("Enter the details");
					request.setAttribute("message", "Enter the details");
					return  mapping.findForward("success");
				}
				//System.out.println(registerForm.getPasswordRegister());
				//System.out.println(registerForm.getUsername());
			}  
			else if(id.equalsIgnoreCase("logout")){ // room is already register but user is not register
				LoginActionBean bean=new LoginActionBean();
				//bean.droptable((String)session.getAttribute("sessionvalue"));//bhushan
				//bean.droptable((String)session.getAttribute("sessionvalue")+"");
				//System.out.println("logout");
				//System.out.println("I am in logout");
				//HttpSession session=request.getSession();
				//bean.droptable(value+"OTP"); //new code//bhushan
				String str=(String)session.getAttribute("sessionvalue");//bhushan
				//bean.droptable(str); //new code
				//bean.droptable(str+"OTP");		//new code	
				bean.unnessesaricontent(str);//bhushan
				session.setAttribute("sessionvalue", "");
				session.setAttribute("sessionvalue", null);
				session.invalidate();
				RegisterForm registerForm = (RegisterForm) form;
				
				//System.out.println(registerForm.getUrl());
				return  mapping.findForward("logout");
			}
			else if(id.equalsIgnoreCase("edit"))
			{
				LoginActionBean bean=new LoginActionBean();
				String idvalue2=(String)session.getAttribute("sessionvalue");
				RegisterForm formReg=(RegisterForm)form;
				System.out.println("value of Id::::::::::::"+formReg.getDetailsId());
				String query="Select * from details where userId_fk='"+value+"' and detailsId='"+formReg.getDetailsId()+"'";
				Maindata main=bean.getEdit(query,idvalue2);
				formReg.setDetailsId(main.getDetailsId());
				formReg.setUrl(main.getWeblink());
				formReg.setUsername(main.getUsername());
				formReg.setPasswordRegisterData(main.getPassword());
				return  mapping.findForward("edit");
			}
			else if(id.equalsIgnoreCase("expiresession"))
			{
				LoginActionBean bean=new LoginActionBean();
				String str=(String)session.getAttribute("sessionvalue");//bhushan
				//bean.droptable(str); //new code
				//bean.droptable(str+"OTP");		//new code	
				bean.unnessesaricontent(str);//bhushan	
				session.invalidate();
				System.out.println("Out of session");
				return  mapping.findForward("sessionend");
			}
			else if(id.equalsIgnoreCase("update"))
			{
				LoginActionBean bean=new LoginActionBean();
				RegisterForm formReg=(RegisterForm)form;
				//String query="Select * from details where userId_fk='"+value+"'";
				//Maindata main=bean.getEdit(query);
			    String d=formReg.getDetailsId();
				String url=formReg.getUrl();
				String username=formReg.getUsername();
				String registerData=formReg.getPasswordRegisterData();
				GetEncrypt encryptd = new GetEncrypt();//jyo
				String strkey=(String)session.getAttribute("sessionvalue");
				String key=bean.getSecurityPIN(strkey,1);
				byte[] encryptedData =  encryptd.encryptData(registerData, key); //Jyoshana Encrypt
				registerData=encryptd.ByteToString(encryptedData);
				
				byte[] encryptedData1 =  encryptd.encryptData(username, key); //Jyoshana Encrypt
				username=encryptd.ByteToString(encryptedData1);			
				
			//	String mainKey=formReg.getTimepass();
			//	System.out.println("Main Security PIN is Require for encryption((Update details))::"+mainKey);
				//new updation
				request.setAttribute("updationMessage", "Data is not updated");
				formReg.setUpdationMessage("Data is not updated");
			   // String querySelect="select count(*) as count from details where weblink='"+url+"'";
			    // bean.checkAlready(querySelect)
				//MyCrypto.encrypt(registerData) bhushan 
			   	String query="update details set weblink='"+url+"',usernameweb='"+username+"',passwordweb='"+registerData+"' where detailsId="+d+" and userId_fk="+value+"";
			   	System.out.println(query);
				int flag= bean.register(query);
				if(flag!=0)
				{ 
				System.out.println("I am in flag");
				formReg.setUpdationMessage("Data updated successfully ");
			    request.setAttribute("updationMessage", "Data updated successfully");
				return  mapping.findForward("edit");
				///return mapping.findForward("successReg");
				}
			    else
				{
				System.out.println("updation Query Zol");
				formReg.setUpdationMessage("Data is not Updated");
				request.setAttribute("updationMessage", "Data is not updated");
				//return  mapping.findForward("failure");
				return  mapping.findForward("edit");
				}
			   }
			else
			{
				return  mapping.findForward("failure");
			}
		}
	
		else
		{
			LoginActionBean bean=new LoginActionBean();
			String str=(String)session.getAttribute("sessionvalue");//bhushan
			//bean.droptable(str); //new code
			//bean.droptable(str+"OTP");		//new code	
			bean.unnessesaricontent(str);//bhushan
			session.invalidate();
			System.out.println("Out of session");
			return  mapping.findForward("sessionend");
		}

	}


}

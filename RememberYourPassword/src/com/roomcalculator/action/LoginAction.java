/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roomcalculator.action;

import java.sql.ResultSet;
import java.util.UUID;
import com.cmp.testschedular.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import com.encryption.GetEncrypt;
import com.roomcalculator.bean.LoginActionBean;
import com.roomcalculator.form.LoginForm;
import com.roomcalculator.form.RegisterForm;
import com.roomcalculator.pojo.GenerateId;
import com.roomcalculator.pojo.MyCrypto;
import com.roomcalculator.pojo.SMS;
import com.test.emailsend.EmailData;

/**
 *
 * @author eswar@vaannila.com
 */
public class LoginAction extends DispatchAction {

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
	public ActionForward restart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	{
		MainApplication main=new MainApplication();
		main.start();
		return null;
	}
	public ActionForward securePinSessionSuccess(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); 
		response.setDateHeader("Expires",-1); 
		request.getSession();
		//System.out.println("I am in alive");
		return  mapping.findForward("success");		
	}

	public ActionForward securePinSessionInvalidate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		HttpSession session=request.getSession();
		LoginActionBean bean=new LoginActionBean();
		String str=(String)session.getAttribute("sessionvalue");//bhushan
		//bean.droptable(str); //new code
		//bean.droptable(str+"OTP");		//new code	
		bean.unnessesaricontent(str);//bhushan
		session.invalidate();
		//System.out.println("Out of session");
		return  mapping.findForward("sessionend");


	}
	
	public ActionForward none(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		return  mapping.findForward("failure");
	}
	
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		//System.out.println("login");
		LoginActionBean bean=new LoginActionBean();
		HttpSession session=request.getSession();
		LoginForm loginForm = (LoginForm) form;
		////System.out.println(loginForm.getUsername());
		RegisterForm r=new RegisterForm();
		r.setMessage("");
		String id=bean.getAuthenticate(loginForm.getUsername(),loginForm.getPassword());
		// //System.out.println("Id:"+id);
		if(id!=null && !id.equalsIgnoreCase(""))
		{
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setDateHeader("Expires", 0); 
			response.setDateHeader("Expires",-1); 

			//
			session.setAttribute("sessionvalue", id);
			
			loginForm.setForgotPasswordErrorMessage(""); 
			
			session.setAttribute("Tkey", UUID.randomUUID().toString().split("-")[0].toString());
			session.setAttribute("Tvalue", UUID.randomUUID().toString().replaceAll("-", ""));
			//ResultSet rs=bean.selectQuery("select * from temp"+id); //deleting otp table when login if it is exist//bhushan
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
			session.setAttribute("sessionvalue", id);
			//ResultSet rs1=bean.selectQuery("select * from temp"+id+"OTP"); //deleting otp table when login if it is exist//bhushan
			boolean b=false;
			if(bean.checkTable("temp"+id+"OTP"))//bhushan
			{
				b=true;				
			}
			if(b){
				bean.droptable(id+"OTP");
			}
			//System.out.println("Sesssion Value"+session.getAttribute("sessionvalue"));
			request.setAttribute("message", "");
			return  mapping.findForward("success");
		}
		else
		{
			return  mapping.findForward("failure");
		}

	}
	public ActionForward securePin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); 
		response.setDateHeader("Expires",-1); 

		//System.out.println("login");
		LoginActionBean bean=new LoginActionBean();
		HttpSession session=request.getSession();
		LoginForm loginForm = (LoginForm) form;
		
		if(!request.getParameter(session.getAttribute("Tkey").toString()).equals(session.getAttribute("Tvalue").toString() )){
			return  mapping.findForward("failure");
		}

		
		//System.out.println("Sesssion Value"+session.getAttribute("sessionvalue"));
		request.setAttribute("message", "");
		bean.createTable(loginForm.getSecurePin(),(String)session.getAttribute("sessionvalue"),1);
		return  mapping.findForward("success1");
	}

	public ActionForward fail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		//	//System.out.println("fail");
		//		return  mapping.findForward("login");

		//System.out.println("fail");
		LoginForm loginForm=(LoginForm)form;

		loginForm.setForgotPasswordErrorMessage("");
		return  mapping.findForward("login");
	}

	public ActionForward forgotPassword(ActionMapping mapping, ActionForm form,  //create a new room button
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		LoginForm loginForm = (LoginForm) form;
		String registeredEmail=loginForm.getForgotPasswordEmail();
		
		String sql="SELECT password FROM register where email='"+registeredEmail+"'";
		String password=new LoginActionBean().getPasswordByEmail(sql);
		
		if(password==null||password.equals(null)||password.equals("")){
			loginForm.setForgotPasswordErrorMessage("We did not find account associated with this account."); 
			return mapping.findForward("failureForgotPassword");
		}else{
			loginForm.setForgotPasswordErrorMessage(""); 
			StringBuffer message=new StringBuffer();
			message.append("\n");
			message.append("Your Account Password is: "+password);
			message.append("\n");
			message.append("\n");
			String[] emails={registeredEmail ,registeredEmail};
			new EmailData().sendFromGMail("checkmypassw0rd@gmail.com", "nicename", emails, "Messgae from Check My Password!", message.toString());
			return mapping.findForward("successForgotPassword");
		}
	 
	}

	public ActionForward newroom(ActionMapping mapping, ActionForm form,  //create a new room button
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		//System.out.println("newroom");
		LoginActionBean bean=new LoginActionBean();
		HttpSession session=request.getSession();
		int maintainFlag=0;
		LoginForm loginForm = (LoginForm) form;
		//  String id=bean.getAuthenticate(loginForm.getUsername(),loginForm.getPassword());
		String firstname=loginForm.getFirstName();    
		String lastname=loginForm.getLastName();
		String email=loginForm.getEmail();
		String username=loginForm.getName();
		String mobilenumber=loginForm.getPhone();
		String password=loginForm.getPasswordRegister();
		String confirmpassword=loginForm.getConfirmPassword();
		String termAndCondition=loginForm.getTermsnCondition();
		//System.out.println("Terms and condtion flag::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+termAndCondition);
		//System.out.println(password+"::::::::::"+confirmpassword);
		String gender=loginForm.getMenu();
		String status="";
		String country="";
		String termsflag=termAndCondition;
		if(termsflag.equalsIgnoreCase("true"))
		{
			termsflag="Y";
		}
		else
		{
			termsflag="N";
		}
		if(password.equals(confirmpassword)){
			String selectusername1="select  count(*) as count from register where mobilenumber='"+mobilenumber+"'";
			if(bean.checkAlready(selectusername1))
			{
				String selectusername="select  count(*) as count from register where email='"+email+"'";
				if(bean.checkAlready(selectusername))
				{
					String selectQuery="select count(*) as count from register where username='"+username+"'";
					if(bean.checkAlready(selectQuery))
					{
						String query="INSERT INTO `register` (`firstname`, `lastname`, `email`, `username`, `mobilenumber`, `password`, `confirmpassword`, `gender`, `status`, `country`, `termsflag`) VALUES ('"+firstname+"', '"+lastname+"', '"+email+"', '"+username+"', '"+mobilenumber+"', '"+password+"', '"+confirmpassword+"', '"+gender+"', '"+status+"', '"+country+"', '"+termsflag+"')";
						int flag= bean.register(query);
						if(flag!=0)
						{ 
							String generatedOtp=GenerateId.getOtp();
							//System.out.println("I am in flag");
							String confirmationKey=generatedOtp;
							StringBuffer message=new StringBuffer();
							message.append("Thank you registering with Check My Passwords !!!");
							message.append("\n");
							message.append("Your password is: "+password);
							message.append("\n");
							message.append("Your Security Pin is: "+confirmationKey +" (do not forget)");
							message.append("\n");
							String[] emails={email ,email};
							new EmailData().sendFromGMail("checkmypassw0rd@gmail.com", "nicename", emails, "Welcome to CheckMyPasswords!!", message.toString());
							//String selectQuery="select count(*) as count from register where username='"+username+"' and password='"+password+"'";
							SMS.sendSMS(mobilenumber, "Your Security PIN is "+generatedOtp +"    (do not forget)");
							return mapping.findForward("successReg");
							//maintainFlag=1;
						}
						else
						{
							System.out.println("Insertion Query Zol");
							return  mapping.findForward("notinserted");
						}
					}
					else
					{
						//	System.out.println("username and password combination already found in db");
						return  mapping.findForward("userNameAlreadyExist");
					}

				}
				else
				{
					System.out.println("Email is already register");
					return  mapping.findForward("alreadyregister");
				}
			}
			else
			{
				System.out.println("Mobile is already register");
				return  mapping.findForward("mobileNumberAlready");
			}
		}
		else
		{
			System.out.println("pass and confrimpass mismatch");	
			return  mapping.findForward("failure");
		}
		//mobileNumberAlready


		//System.out.println("I am in out sider loop");

		//return  mapping.findForward("failure");
		/* if(maintainFlag==1){
			 return mapping.findForward("successReg");
		  }
		  else
		  {
			  return  mapping.findForward("failure");
		  }*/
	}
		
	


}

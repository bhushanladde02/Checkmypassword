package com.roomcalculator.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roomcalculator.form.ContactForm;
import com.test.emailsend.EmailData;

public class ContactAction extends DispatchAction  {

	
	
	public ActionForward sendContact(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		System.out.println("in send Email");
		//LoginActionBean bean=new LoginActionBean();
		HttpSession session=request.getSession();
		ContactForm contactForm = (ContactForm) form;
		//System.out.println(loginForm.getUsername());
		

		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String phnumber=request.getParameter("phone");
		String message=request.getParameter("message");
		
		System.out.println("Email: "+email+" Name: "+name+" phone numbe: "+phnumber+" meassage: "+message);
		
		
		if(name==null){
			name=email;
		}
		
		String[] emails={email ,"checkmypassw0rd@gmail.com"};
		new EmailData().sendFromGMail("checkmypassw0rd@gmail.com", "nicename", emails, "Important Message from "+name, message.toString());
		
		response.getWriter().write("Hi "+name+" your message has been sent !!");
		
		
		return  null;


	}
}

package com.cmp.sessionListener;
 
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.roomcalculator.bean.LoginActionBean;
 
public class SessionCounterListener implements HttpSessionListener {
 
  private static int totalActiveSessions;
 
  public static int getTotalActiveSession(){
	return totalActiveSessions;
  }
 
  @Override
  public void sessionCreated(HttpSessionEvent arg0) {
	totalActiveSessions++;
	System.out.println("sessionCreated - add one session into counter");
  }
 
  @Override
  public void sessionDestroyed(HttpSessionEvent arg0) {
	totalActiveSessions--;
	HttpSession session = arg0.getSession();
	// Log a message
	LoginActionBean bean=new LoginActionBean();
	String str=(String)session.getAttribute("sessionvalue");//bhushan
	//bean.droptable(str); //new code
	//bean.droptable(str+"OTP");		//new code	
	bean.unnessesaricontent(str);//bhushan
	session.invalidate();
	//System.out.println("Session invalidated: "+session);
	//System.out.println("The name is: " + session.getAttribute("foo"))
	System.out.println("sessionDestroyed - deduct one session from counter");
  }	
}
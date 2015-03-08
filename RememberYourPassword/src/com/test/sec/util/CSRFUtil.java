package com.test.sec.util;

import javax.servlet.http.HttpSession;

public class CSRFUtil{

	
	
/*	public CSRFUtil getObject();
	public String getData(HttpSession session);
*/	

	
	
	public String getData(HttpSession session) {
		// TODO Auto-generated method stub
		String result="";
		/*System.out.println("The key from session is : "+session.getAttribute("Tkey").toString());
		System.out.println("The value from session is : "+session.getAttribute("Tvalue").toString());*/
		
		if(session.getAttribute("Tkey")!=null && session.getAttribute("Tvalue")!=null){
			String key=session.getAttribute("Tkey").toString();
			String value=session.getAttribute("Tvalue").toString();
		}
		if(session.getAttribute("Tkey")!=null && session.getAttribute("Tvalue")!=null){
			result="&"+session.getAttribute("Tkey").toString()+"="+session.getAttribute("Tvalue").toString();
		}else{
			result="";
		}
		
		
		return result;
	}
}

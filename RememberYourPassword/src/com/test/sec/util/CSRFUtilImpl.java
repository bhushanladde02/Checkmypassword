package com.test.sec.util;

import javax.servlet.http.HttpSession;

public class CSRFUtilImpl extends CSRFUtil{

	
	public String getData(HttpSession session) {
		// TODO Auto-generated method stub

		String result="&"+session.getAttribute("key").toString()+"="+session.getAttribute("value").toString();
		return result;
	}

	/*@Override
	public CSRFUtil getObject() {
		// TODO Auto-generated method stub
		return new CSRFUtilImpl();
	}*/
	
	
	
	
	
	

}

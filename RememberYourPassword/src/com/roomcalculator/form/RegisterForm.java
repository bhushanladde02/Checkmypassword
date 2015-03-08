package com.roomcalculator.form;


public class RegisterForm  extends org.apache.struts.action.ActionForm{
	    private String url;
	    private String username;
	    private String passwordRegisterData;
	    private String message="";
	    private String flag="";
	    private String detailsId;
	    private String updationMessage;
	    private String secureMobileKey;
	    private String otp;
	    private String otpMessage;
	    
	  //  private String timepass;
	    
		
		public String getOtpMessage() {
			return otpMessage;
		}
		public void setOtpMessage(String otpMessage) {
			this.otpMessage = otpMessage;
		}
		/*public String getTimepass() {
			return timepass;
		}
		public void setTimepass(String timepass) {
			this.timepass = timepass;
		}*/
		public String getSecureMobileKey() {
			return secureMobileKey;
		}
		public void setSecureMobileKey(String secureMobileKey) {
			this.secureMobileKey = secureMobileKey;
		}
		public String getOtp() {
			return otp;
		}
		public void setOtp(String otp) {
			this.otp = otp;
		}
		public String getUpdationMessage() {
			return updationMessage;
		}
		public void setUpdationMessage(String updationMessage) {
			this.updationMessage = updationMessage;
		}
		public String getDetailsId() {
			return detailsId;
		}
		public void setDetailsId(String detailsId) {
			this.detailsId = detailsId;
		}
		public String getFlag() {
			return flag;
		}
		public void setFlag(String flag) {
			this.flag = flag;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getUsername() {
			return username;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPasswordRegisterData() {
			return passwordRegisterData;
		}
		public void setPasswordRegisterData(String passwordRegisterData) {
			this.passwordRegisterData = passwordRegisterData;
		}
		
	    
		

}

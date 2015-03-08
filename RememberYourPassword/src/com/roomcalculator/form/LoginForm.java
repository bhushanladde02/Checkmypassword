/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.roomcalculator.form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author eswar@vaannila.com
 */
public class LoginForm extends org.apache.struts.action.ActionForm {
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String passwordRegister;
    private String confirmPassword;
    private String menu;
    private String securePin;
	private String forgotPasswordEmail;
    private String forgotPasswordErrorMessage="";
    private String termsnCondition;
   
	public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }
	/*public void reset(ActionMapping mapping,
			HttpServletRequest request) {
			System.out.println("LoginForm::reset()");
			username=null;
			password=null;
			name=null;
			email=null;
			phone=null;
			passwordRegister=null;
			confirmpassword=null;
			menu=null;
			
		}*/
    /*
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (username == null || username.length() < 1) {
            errors.add("userName", new ActionMessage("error.userName.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        if (password == null || password.length() < 1) {
            errors.add("password", new ActionMessage("error.password.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }*/
   
	public String getUsername() {
		return username;
	}


	public String getTermsnCondition() {
		return termsnCondition;
	}

	public void setTermsnCondition(String termsnCondition) {
		this.termsnCondition = termsnCondition;
	}

	public String getSecurePin() {
		return securePin;
	}

	public void setSecurePin(String securePin) {
		this.securePin = securePin;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getPasswordRegister() {
		return passwordRegister;
	}


	public void setPasswordRegister(String passwordRegister) {
		this.passwordRegister = passwordRegister;
	}



	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getMenu() {
		return menu;
	}


	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getForgotPasswordEmail() {
		return forgotPasswordEmail;
	}

	public void setForgotPasswordEmail(String forgotPasswordEmail) {
		this.forgotPasswordEmail = forgotPasswordEmail;
	}

	public String getForgotPasswordErrorMessage() {
		return forgotPasswordErrorMessage;
	}

	public void setForgotPasswordErrorMessage(String forgotPasswordErrorMessage) {
		this.forgotPasswordErrorMessage = forgotPasswordErrorMessage;
	}
	
    
}

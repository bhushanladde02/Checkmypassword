	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ page import="com.test.sec.util.CSRFUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<title></title>
<meta charset="utf-8">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid1.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="screen">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.js"></script>
<div style='text-align:center'></div>

<script src="js/html5shiv.js"></script>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<link href='http://fonts.googleapis.com/css?family=Lato:300italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>

<script src="jqueryAlert/jquery.js" type="text/javascript"></script>
<script src="jqueryAlert/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="jqueryAlert/jquery.alerts.js" type="text/javascript"></script>
<link href="jqueryAlert/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" >

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47069136-1', 'checkmypasswords.com');
  ga('send', 'pageview');

</script>
<script type="text/javascript">
function checkEmail() {

    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 	}
    else{ return true;}
}
function login()
{
	var use=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	if(use!='' && use!='Username' && pass!='' && pass!='Password'){
		
	document.forms[0].username=document.getElementById("username").value;
	document.forms[0].password=document.getElementById("password").value;
	var newUrl = '/RememberYourPassword/Login.do?method=login';
    document.forms[0].method="post";
    document.forms[0].action = newUrl;
    document.forms[0].submit();	
	}
	else
	{
		alert('Please Enter Username and password');
	}
}

function forgotPassword()
{
	var use=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	if(use!='' && use!='Username' && pass!='' && pass!='Password'){
		
	document.forms[0].username=document.getElementById("username").value;
	document.forms[0].password=document.getElementById("password").value;
	var newUrl = '/RememberYourPassword/Login.do?method=login';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].method="post";
    document.forms[0].action = newUrl;
    document.forms[0].submit();	
	}
	else
	{
		alert('Please Enter Username and password');
	}
}
function checkValue()
{
	document.getElementById("termsnCondition").setAttribute('value', true);
}
function newroom()
{
	if(checkEmail()){
	var value1=document.getElementById("passwordRegister").value;  
	var value2=document.getElementById("confirmPassword").value;
	var value3=document.getElementById("firstName").value;
	var value4=document.getElementById("lastName").value;
	var value5=document.getElementById("email").value;
	var value7=document.getElementById("phone").value;
	var value8=document.getElementById("name").value;
	var value9=document.getElementById("termsnCondition").value;
	if(value9!='' && value9!='false'){
   if(value1!='' && value2!='' && value3!='' && value4!='' && value5!='' && value7!=''  && value8!='' &&
	   value1!='Password' && value2!='Password' && value3!='First Name' && value4!='Last Name' && value5!='Email' && value7!='Mobile Number with Country Code'  && value8!='Username'){
	   
	if(value1==value2){
	var newUrl = '/RememberYourPassword/Login.do?method=newroom';
    document.forms[0].method="post";
    document.forms[0].action = newUrl;
    document.forms[0].submit();	
	}
	else
	{
		alert("Password and Confirm Password is mismatch");
	}
	
   }
   else
   { 
	   alert('Please fill the all data.!!!');
   }
   }
   else
   { 
		alert('You have to must accept term and condition!!!');
   }		
  }
	

}
function messagepass()
{
	alert("Enter Password");
}
function messagecon()
{
	alert("Enter Confirm Password");
}
function checkBrowser()
{
 var isOpera = !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;    // Opera 8.0+ (UA detection to detect Blink/v8-powered Opera)
 var isFirefox = typeof InstallTrigger !== 'undefined';   // Firefox 1.0+
// var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;    // At least Safari 3+: "[object HTMLElementConstructor]"
 var isChrome = !!window.chrome && !isOpera;  // Chrome 1+
 //var isIE = /*@cc_on!@*/false || !!document.documentMode; 
 //alert(isChrome);
 
 if(isChrome==true|| isFirefox==true)
 {
	// document.getElementById("id3").style.display="none";
	// document.getElementById("id4").style.display="none";
	// document.getElementById("id3").remove();
	// document.getElementById("id4").remove();
	document.getElementById("id1").style.display="";
	document.getElementById("id2").style.display="";
}
else{
	 //document.getElementById("id1").style.display="none";
	// document.getElementById("id2").style.display="none";
	// document.getElementById("id1").remove();
	// document.getElementById("id2").remove();
	 document.getElementById("id3").style.display="";
	 document.getElementById("id4").style.display="";
 }
//check browser and set accordingly 2nd google chrome and first one is IE
}
</script>
</head>

<body  onload="checkBrowser()">
 <html:form styleId="contact-form" action="/Login">
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper" id="check">
					<%--<a href="#" class="logo">Check my Passwords</a>
					 <nav>
						<ul class="menu">
						 <li class="active"><label><input type="text" id="username" name="username" value="Username"  class="form-login" onFocus="if(this.value=='Username'){this.value=''}" onBlur="if(this.value==''){this.value='Username'}"></label></li>
						 <li><label><input type="password" id="password" name="password" value="Password"  class="form-login"  onFocus="if(this.value=='Password'){this.value=''}" onBlur="if(this.value==''){this.value='Password'}"></label></li>
						</ul>
						<li> &nbps;<a href="#" class="button2" onclick="javascript:login()" ><font color="white">Login</font></a></li>
						<li> &nbps;<a href="ForgotPassword.jsp"><font color="white">Forgot Password</font></a> </li>
						
					</nav>---%>
				<%--<a href="index.html" class="logo"></a> --%>
				    <a href="#" class="logo">Check my Passwords</a>
					
					<nav>
						<ul class="menu">
							<li class="active"><label><input type="text" id="username" name="username" value="Username"  class="form-login" onFocus="if(this.value=='Username'){this.value=''}" onBlur="if(this.value==''){this.value='Username'}"></label></li>
							 <li><label><input type="password" id="password" name="password" value="Password"  class="form-login"  onFocus="if(this.value=='Password'){this.value=''}" onBlur="if(this.value==''){this.value='Password'}"></label></li>
							<li> <a href="#" class="button2" onclick="javascript:login()" id="id1" style="display: none;"><font color="white">Login</font></a></li>
						</ul>
						<a id="id2" href="ForgotPassword.jsp" style="display: none; "><font color="white" style="font-size:small !important;">&nbsp;&nbsp;&nbsp;&nbsp;Forgot Password&nbsp;&nbsp;&nbsp;</font></a>
						
						<li id="id3" style="display: none;"> &nbps;<a href="#" class="button2" onclick="javascript:login()" ><font color="white">Login</font></a></li>
						<li id="id4" style="display: none;"> &nbps;<a href="ForgotPassword.jsp"><font color="white" style="font-size: small !important;">Forgot Password</font></a> </li>
					</nav>
					 
				</div>
			</div>
		</div>
	</header>
	<div id="content">
		<div class="ic"></div>
		<div class="inner pad1">
			<div class="container_12">
				<div class="wrapper h-pad">
					<div class="grid_7">
						<h2> Make it easy for you...!!! </h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
						<%--		<iframe align="center" width="700" height="420" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.iseecubed.com/wp-content/uploads/exclusive-well-designed-free-blue-living-room-hd.jpg"></iframe> --%>
								
						 <iframe src="https://www.youtube.com/watch?v=VmrCcfWhZXQ" width="500" height="375" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
							</div>						
						</div>
					</div>
					
					<div class="grid_4 prefix_1">
						<h2>Register</h2>						
						  <form id="contact-form"> 						
							<fieldset>
								<label><input type="text" id="firstName" name="firstName" value="First Name" onFocus="if(this.value=='First Name'){this.value=''}" onBlur="if(this.value==''){this.value='First Name'}">	</label>
								<label><input type="text" id="lastName" name="lastName"  value="Last Name" onFocus="if(this.value=='Last Name'){this.value=''}" onBlur="if(this.value==''){this.value='Last Name'}">	</label>
								<label><input type="text" id="name" name="name" value="Username" onFocus="if(this.value=='Username'){this.value=''}" onBlur="if(this.value==''){this.value='Username'}">	</label>
								<label><input type="text" id="email" name="email" value="Email" onFocus="if(this.value=='Email'){this.value=''}" onBlur="if(this.value==''){this.value='Email'}">	</label>
								<label><input type="text" id="phone" name="phone" value="Mobile Number with Country Code" onFocus="if(this.value=='Mobile Number with Country Code'){this.value=''}" onBlur="if(this.value==''){this.value='Mobile Number with Country Code'}">	</label>
								<label><input type="password" id="passwordRegister" name="passwordRegister" value="Password" onFocus="if(this.value=='Password'){this.value=''}" onclick="javascript:messagepass()" onBlur="if(this.value==''){this.value='Password'}">	</label>
								<label><input type="password" id="confirmPassword" name="confirmPassword" value="Password" onFocus="if(this.value=='Password'){this.value=''}"  onclick="javascript:messagecon()" onBlur="if(this.value==''){this.value='Password'}">	</label>
							    <label><font size="5">&nbsp;<u>Gender</u></font> &nbsp;&nbsp; <select class="label" id="menu" name="menu">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								</select></label>							
								<label><input type="checkbox" id="termsnCondition" onchange="javascript:checkValue()"name="termsnCondition" value="false" style="float: left;width: 15px;"><span style="float: left;">I agree<a href="/RememberYourPassword/TermsAndCondition.jsp" target="_blank" style="text-decoration: none;"> terms and conditions </a></span></label>
								<a href="#" class="button1"  onclick="javascript:newroom()" id="register">Register</a> <%--onclick="javascript:register()" --%>
								<a href="#" class="button1" onClick="document.getElementById('contact-form').reset()">clear</a> 
							</fieldset>
						 </form>
						
					</div>
				
				</div>
				
			</div>	
		</div>
	</div>
	<footer>
		<div class="container_12">
			<div class="wrapper">
				<div class="grid_8">
					Onine Pvt Ltd &copy; 2014 &nbsp; | &nbsp;   <a href="/RememberYourPassword/contactUs.jsp" target="_blank" ><font color="blue">Contact Us</font></a> &nbsp; | &nbsp;
				</div>
				<div class="grid_4">
					<div class="social">
					
				     My Social:<a href="http://www.linkedin.com/profile/view?id=315368590&trk=nav_responsive_tab_profile" target="_blank"><img src="images/linkedin.png" alt=""></a><a href="https://plus.google.com/110752570346107407382?rel=author" target="_blank"><img src="images/googleplus.png" alt=""></a><a href="https://www.facebook.com/checkmypasswords" target="_blank"><img src="images/facebook-icon.png" alt=""></a><a href="https://twitter.com/checkmypassword" target="_blank"><img src="images/twitter-icon.png" alt=""></a><br/> Best view in Google Chrome
					</div>
				</div>
				
			</div>
		</div>
	</footer>
</html:form>
</body>
</html>

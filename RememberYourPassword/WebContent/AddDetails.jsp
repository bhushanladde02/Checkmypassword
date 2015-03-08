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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title></title>
<meta charset="utf-8">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid1.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-migrate-1.1.1.js"></script>
  <!--[if lt IE 8]><div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div><![endif]-->
  	<!--[if lt IE 9]>
	   	<script src="js/html5shiv.js"></script>
	   	<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300italic' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
	   	<link href='http://fonts.googleapis.com/css?family=Lato:700' rel='stylesheet' type='text/css'>
    <![endif]-->
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

function addDetails()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=addDetails';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function logout()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=logout';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function login()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=addDetailsIntoDatabase';
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function viewpassword()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=pass';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function messagepass()
{
	alert("Enter Password");
}
function messagecon()
{
	alert("Enter Confirm Password");
}
</script>
</head>

<body>
 <html:form styleId="contact-form" action="/RegisterAlreadyRoom">
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper">
					<a href="#" class="logo">Save Passwords</a>
					<nav>
						<ul class="menu">
						  <li> <a href="#" class="button2" onclick="javascript:logout()" ><font color="white">Log out</font></a></li>
						</ul>
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
						<h2>Add Password Details</h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
							 <form id="contact-form"> 
							   <fieldset>
									<label><input type="text" id="url" name="url" value="Enter Website Link" onFocus="if(this.value=='Enter Website Link'){this.value=''}" onBlur="if(this.value==''){this.value='Enter Website Link'}">	</label>
									<label><input type="text" id="username" name="username"  value="Enter Username" onFocus="if(this.value=='Enter Username'){this.value=''}" onBlur="if(this.value==''){this.value='Enter Username'}">	</label>
									<label><input type="password" id="passwordRegisterData" name="passwordRegisterData" value="Password" onFocus="if(this.value=='Password'){this.value=''}" onclick="javascript:messagepass()" onBlur="if(this.value==''){this.value='Password'}">	</label>
									<a href="#" class="button1"  onclick="javascript:addDetails()" id="register">Enter</a>
									<a href="#" class="button1" onClick="document.getElementById('contact-form').reset()">clear</a> 
									<a href="#" class="button1" onclick="javascript:viewpassword()" >View Passwords</a> 
								</fieldset>						  	
						  <br/><br/>
						  <c:if test="${RegisterForm.message != ''}">
						  <font color="red" ><c:out value="${RegisterForm.message}"></c:out> </font> 
						  </c:if>
						 </form>
						
								
							</div>						
						</div>
					</div>
							
					
					<div class="grid_4 prefix_1">
					<b><u> Instructions</u></b>
								<div class="testimonial-block"> 
										<marquee direction="up"> 
										    <table border="1" bordercolor="#ffffff" width="100%" cellpadding="1" cellspacing="1">
												<tr>
													<td>1.&nbsp;&nbsp;</td>
													<td>Your Credential are always <b><u>valuable</u></b> for us. </td>
												</tr>	
												<tr>
													<td>2.&nbsp;&nbsp;</td>
													<td>Never share your  <b><u>security pin</u></b> with any one</td>
												</tr>											
											</table>
										</marquee> 											
								</div>
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

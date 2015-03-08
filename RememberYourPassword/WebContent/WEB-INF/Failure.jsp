<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript">
function login()
{
	document.forms[0].username=document.getElementById("username").value;
	document.forms[0].password=document.getElementById("password").value;
	var newUrl = '/RememberYourPassword/Login.do?method=login';
    document.forms[0].method="post";
    document.forms[0].action = newUrl;
    document.forms[0].submit();	
}
function fail()
{
	var newUrl = '/RoomCalculator/Login.do?method=fail';
    document.forms[0].method="post";
    document.forms[0].action = newUrl;
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
 <html:form styleId="contact-form" action="/Login">
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper">
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
						<h2>How to used Room Calculator ?</h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
								<iframe align="center" width="700" height="420" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.iseecubed.com/wp-content/uploads/exclusive-well-designed-free-blue-living-room-hd.jpg"></iframe>
							</div>						
						</div>
					</div>
					
					<div class="grid_4 prefix_1">
						<h2>Your data is wrong. Please Check</h2>
						
						  <form id="contact-form"> 
						
							<fieldset>
								
								<a href="#" class="button1"  onclick="javascript:fail()" id="register">Go To Login Page</a> 
								
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
					Room Calculator &copy; 2013 &nbsp;  | &nbsp;  Website Template designed by 
				</div>
				<div class="grid_4">
					<div class="social">
						My Social:<a href="#"><img src="images/facebook-icon.png" alt=""></a><a href="#"><img src="images/twitter-icon.png" alt=""></a>
					</div>
				</div>
				
			</div>
		</div>
	</footer>
</html:form>
</body>
</html>

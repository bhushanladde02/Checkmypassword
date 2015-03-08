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

function addDetails()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=addDetails';
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function logout()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=logout';
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function edit()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=edit';
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
</script>
</head>

<body>
 <html:form styleId="contact-form" action="/RegisterAlreadyRoom">
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper">
					<a href="index.html" class="logo">Save Passwords</a>
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
						<h2>Check Passwords</h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
							 <form id="contact-form"> 
						      <fieldset>
							
								<style type="text/css">
								.tg-table-paper { border-collapse: collapse; border-spacing: 0; }
								.tg-table-paper td, .tg-table-paper th { background-color: #F3F5EF; border: 1px #bbb solid; color: #333; font-family: sans-serif; font-size: 100%; padding: 10px; vertical-align: top; }
								.tg-table-paper .tg-even td  { background-color: #F0F0E5; }
								.tg-table-paper th  { background-color: #EAE2CF; color: #333; font-size: 110%; font-weight: bold; }
								.tg-table-paper tr:hover td, .tg-table-paper tr.even:hover td  { color: #222; background-color: #FFFBEF; }
								.tg-bf { font-weight: bold; } .tg-it { font-style: italic; }
								.tg-left { text-align: left; } .tg-right { text-align: right; } .tg-center { text-align: center; }
								</style>
								<table  class="tg-table-paper">
								  <tr>								    
								   
								    <th class="tg-right tg-bf tg-it">Website Url</th>
								    <th class="tg-right tg-bf tg-it">Username</th>
								    <th class="tg-right tg-bf tg-it">Password</th>
								    <th class="tg-right tg-bf tg-it">Click to Edit</th>
								    <%-- <th class="tg-right tg-bf tg-it">Edit</th>  --%> 
								  </tr>
								  
								  <logic:iterate name="listUsers" id="listUserId">
								  <tr class="tg-even">
								    <%--<td></td> --%>
								    <td><a href="<bean:write name="listUserId" property="weblink"/>"><bean:write name="listUserId" property="weblink"></bean:write></a> </td>
								    <td><bean:write name="listUserId" property="username"/></td>
								    <td><bean:write name="listUserId" property="password"/></td>
								      <td><a href="#" onclick="javascript:edit()">Click Me!!</a> </td>
								  <%--  <td></td> --%>
								  </tr>								
								</logic:iterate>
								  
								
								</table>
								
								
							   </fieldset>
							
						
						 </form>
						
								
							</div>						
						</div>
					</div>
					
					<div class="grid_4 prefix_1">
						
						<form id="contact-form"> 
						
							<fieldset>
														
								<a href="#" class="button1"  onclick="javascript:addDetails()" id="register">Go To Add Passwords</a> <%--onclick="javascript:register()" --%>
								
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
					SavePasswords.com &copy; 2013 &nbsp;  | &nbsp;  Website Template designed by 
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

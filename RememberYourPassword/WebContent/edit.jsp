<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
        $.active = false;
        $('body').bind('click keypress', function() { $.active = true; });
        //checkActivity(1800000, 60000, 0); // timeout = 30 minutes, interval = 1 minute.
        checkActivity(200000, 100000, 100000); 
    });

    function checkActivity(timeout, interval, elapsed) {
        if ($.active) {
            elapsed = 0;
            $.active = false;
            var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=editRemain';            
            document.forms[0].action = newUrl;
            document.forms[0].method="post";
            document.forms[0].submit();	
        }
        if (elapsed < timeout) {
            elapsed += interval;
            setTimeout(function() {
                checkActivity(timeout, interval, elapsed);
            }, interval);
        } else {
            // '/RememberYourPassword/Login.do?method=login'
            var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=editfail';
            document.forms[0].action = newUrl;
            document.forms[0].method="post";
            document.forms[0].submit();	
        	
            //window.location = 'http://example.com/expired'; // Redirect to "session expired" page.
        }
    }
</script>

	
    
<script type="text/javascript">


function check()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=pass';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function update()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=update';
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
function edit()
{		
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=edit';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
function valueAssign()
{
	//document.getElementById("url").setAttribute(,);
}
</script>
</head>

<body onload="javascript:valueAssign()">
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
						<h2>Check Passwords</h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
							 <form id="contact-form"> 
						      <fieldset>
							       
							        <input type="hidden" id="detailsId1" name="detailsId1" value="<bean:write name="RegisterForm" property="detailsId" />">
							      	<label><input type="text" id="url" name="url" value="<bean:write name="RegisterForm" property="url" />">	</label>
									<label><input type="text" id="username" name="username"  value="<bean:write name="RegisterForm" property="username" />" >	</label>
									<label><input type="password" id="passwordRegisterData" name="passwordRegisterData" value="<bean:write name="RegisterForm" property="passwordRegisterData" />" >	</label>
									<a href="#" class="button1"  onclick="javascript:update()" id="register">Update</a>
									<%-- <a href="#" class="button1" onClick="document.getElementById('contact-form').reset()">clear</a> --%>
									  <br/><br/>
									  <c:if test="${RegisterForm.updationMessage != ''}">
									  <font color="red" ><c:out value="${RegisterForm.updationMessage}"></c:out> </font> 
									  </c:if>
							      </fieldset>
							
						
						 </form>
						
								
							</div>						
						</div>
					</div>
					
					<div class="grid_4 prefix_1">
						
						<form id="contact-form"> 						
							<fieldset>														
								<a href="#" class="button1"  onclick="javascript:check()" id="register">View Passwords</a> <%--onclick="javascript:register()" --%>
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

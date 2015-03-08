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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>checkmypasswords.com</title>

<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid1.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-migrate-1.1.1.js"></script>

		<script src="jqueryAlert/jquery.js" type="text/javascript"></script>
		<script src="jqueryAlert/jquery.ui.draggable.js" type="text/javascript"></script>
		<script src="jqueryAlert/jquery.alerts.js" type="text/javascript"></script>
		<script type="text/javascript" >

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47069136-1', 'checkmypasswords.com');
  ga('send', 'pageview');

</script>
		<link href="jqueryAlert/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
        $.active = false;
        $('body').bind('click keypress', function() { $.active = true; });
        //checkActivity(1800000, 60000, 0); // timeout = 30 minutes, interval = 1 minute.
        checkActivity(200000, 100000,  100000); 
    });

    function checkActivity(timeout, interval, elapsed) {
        if ($.active) {
            elapsed = 0;
            $.active = false;
            var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=aliveMainPage';
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
            var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=expiresession';
            document.forms[0].action = newUrl;
            document.forms[0].method="post";
            document.forms[0].submit();	
        	
            //window.location = 'http://example.com/expired'; // Redirect to "session expired" page.
        }
    }
</script>
		
		
<script type="text/javascript">

function addDetails()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=addDetails&&flag=1';
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
function edit(id,link,username,password)
{
	//alert(id);
	//alert(link);
	//alert(username);
	//alert(password);
	document.getElementById("detailsId").setAttribute("value", id);
	document.getElementById("weblink").setAttribute("value", link);
	document.getElementById("username").setAttribute("value", username);
	document.getElementById("password").setAttribute("value", password);
	
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=edit';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
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
					<a href="#" class="logo">Check My Passwords</a>
					<nav>
						<ul class="menu">
						    <li> <a href="#" class="button2" onClick="javascript:logout()" ><font color="white">Log out</font></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div id="content">
		<div style="min-width: 1000px; width: 100%;z-index: 1000; background:#EDF0F6;">
			<div style="margin-left:auto; margin-right:auto; max-width:1000px; display:block; height:400px; padding-top:50px;">
					<div style="height:50px; padding-top:10px;">
						<div style="float: left; height: 30px; position: relative; width: 160px; margin-top:10px; padding-left:100px;">
							<font style="font-size:large; font-weight:bold;">My Passwords </font>
						</div>
						
						<div style="float: right; height: 38px; position: relative; padding-right:100px;"> 
							<a href="#" class="button1" style="margin-top:1px;" onclick="javascript:addDetails()" id="register">Go To Add Passwords</a>
						</div>
					
					</div>
					
					
					<div style="height:100%; padding-left:100px; padding-right:100px;">
						<div style="position: relative; width: 800px; height: 300px; overflow: scroll;" >
							<table style="width:800px;" align="center">
								<th width="200px" style="background:#EAE2CF; padding:10px;">
									Website URL
								</th>
								<th width="200px" style="background:#EAE2CF; padding:10px;">
									Username
								</th>
								<th width="200px" style="background:#EAE2CF; padding:10px;">
									Password
								</th>
								<th width="200px" style="background:#EAE2CF; padding:10px;">
									Edit
								</th>
								<logic:iterate name="listUsers" id="listUserId">
									<tr align="center" style="background:#F0F0E5;"> 
										<html:hidden styleId="detailsId" property="detailsId" name="listUserId" value=""/>
									    <html:hidden styleId="weblink" property="weblink" name="listUserId"  value=""/>
									    <html:hidden styleId="username" property="username" name="listUserId"  value=""/>
									    <html:hidden styleId="password" property="password" name="listUserId"  value=""/>
										
										<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
											<bean:write name="listUserId" property="weblink"></bean:write> 
										</td>
										<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
											<bean:write name="listUserId" property="username"/>
										</td>
										<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
											<bean:write name="listUserId" property="password"/>
										</td>
										<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
											<a href="#" onClick="javascript:edit('<bean:write name="listUserId" property="detailsId"/>','<bean:write name="listUserId" property="weblink"/>','<bean:write name="listUserId" property="username"/>','<bean:write name="listUserId" property="password"/>')">Click Me</a>
										</td>
									</tr>
								
								</logic:iterate>
								
								<%--tr align="center" style="background:#F0F0E5;"> 
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										www.facebook.comsdjcblksjbdchbshbdcjkhbdzkjvbcadbschbskhdbjbckjbsdcjbdzsjb
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										user1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										password1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										Click Me
									</td>
								</tr>
								<tr align="center" style="background:#F0F0E5;">
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										www.facebook.com
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										user1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										password1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										Click Me
									</td>
								</tr>
								<tr align="center" style="background:#F0F0E5;">
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										www.facebook.com
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										user1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										password1
									</td>
									<td width="200px" style="padding:10px; max-width:200px; word-wrap: break-word;">
										Click Me
									</td>
								</tr--%>
							</table>
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

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
<script type="text/javascript" >

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47069136-1', 'checkmypasswords.com');
  ga('send', 'pageview');

</script>
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

function OTPCheck()
{
	var securityone=document.getElementById("securePin").value;
	var securitytwo=document.getElementById("securePin1").value;
	if(securityone!=securitytwo){
		alert("Your Security Pin and Confirm Security Pin Mismatch");
		return;
	}
	else
	{
		var newUrl = '/RememberYourPassword/Login.do?method=securePin';
		newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
	    document.forms[0].method="post";
	    document.forms[0].action = newUrl;
	    document.forms[0].submit();
		
	}
		
}
function logout()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=logout';
	newUrl=newUrl+"<%= new CSRFUtil().getData(request.getSession())%>";
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
        $.active = false;
        $('body').bind('click keypress', function() { $.active = true; });
        //checkActivity(1800000, 60000, 0); // timeout = 30 minutes, interval = 1 minute.
        checkActivity(100000, 50000, 50000); 
    });

    function checkActivity(timeout, interval, elapsed) {
        if ($.active) {
            elapsed = 0;
            $.active = false;
            var newUrl = '/RememberYourPassword/Login.do?method=securePinSessionSuccess';            
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
            var newUrl = '/RememberYourPassword/Login.do?method=securePinSessionInvalidate';
            document.forms[0].action = newUrl;
            document.forms[0].method="post";
            document.forms[0].submit();	
        	
            //window.location = 'http://example.com/expired'; // Redirect to "session expired" page.
        }
    }
</script>
</head>

<body>
 <html:form styleId="contact-form" action="/Login">
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
		<div class="ic"></div>
		<div class="inner pad1">
			<div class="container_12">
				<div class="wrapper h-pad">
					<div class="grid_7">
						<font size="10%" color="red"><b><u>Enter Security PIN received during registration</u></b></font>
						<br></br>
						<div class="wrapper">
							<div class="grid_4 alpha">
							  <form id="contact-form"> 
						    	<fieldset>
						    	
						    	<label>Enter your Security Pin<input type="password" id="securePin" name="securePin" value="" onFocus="if(this.value==''){this.value=''}" onclick="javascript:messagepass()" onBlur="if(this.value==''){this.value=''}">	</label>
						    	<br></br>
						    	
						    	<label>Confirm your Security Pin<input type="password" id="securePin1" name="securePin1" value="" onFocus="if(this.value==''){this.value=''}" onclick="javascript:messagepass()" onBlur="if(this.value==''){this.value=''}">	</label>
								<a href="#" class="button1"  onclick="javascript:OTPCheck()" id="register">Submit</a> 
							  </fieldset>
						     </form>
							</div>						
						</div>
					</div>					
					<div class="grid_4 prefix_1">	
							  <b><u> Instructions</u></b>
								<div class="testimonial-block"> 
										<marquee direction="up" > 
										    <table border="1" bordercolor="#ffffff" width="100%" cellpadding="1" cellspacing="1">
												<tr>
													<td>1.&nbsp;&nbsp;</td>
													<td>If you enter wrong  <b><u>security pin</u></b> then you can not able to see your passwords</td>
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

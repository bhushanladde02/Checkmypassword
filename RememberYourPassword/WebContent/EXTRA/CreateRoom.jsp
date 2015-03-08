<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8"><link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic' rel='stylesheet' type='text/css'>
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
</head>
<script type="text/javascript">
function login()
{
	var newUrl = '/RememberYourPassword/RegisterAlreadyRoom.do?id=createRoom';
    document.forms[0].action = newUrl;
    document.forms[0].method="post";
    document.forms[0].submit();	
}
</script>
<body>
<html:form styleId="contact-form" action="/RegisterAlreadyRoom">
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper">
					<a href="index.html" class="logo">Room Calculator</a>
					
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
						<div class="wrapper">
							<div class="grid_4 alpha">
							<!--	<iframe width="700" height="420" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.iseecubed.com/wp-content/uploads/exclusive-well-designed-free-blue-living-room-hd.jpg"></iframe>-->
								<h2>Room Registration</h2>
								<form id="contact-form">
									<fieldset>
										<label><input type="text" id="roomName" name="roomName"  value="Room Name" onFocus="if(this.value=='Room Name'){this.value=''}" onBlur="if(this.value==''){this.value='Room Name'}">	</label>
										<label><input type="text" id="roomLocation" name="roomLocation"  value="Room Location" onFocus="if(this.value=='Room Location'){this.value=''}" onBlur="if(this.value==''){this.value='Room Location'}">	</label>
										<label><input type="text" id="numberOfPerson" name="numberOfPerson"  value="Number Of Person In Room" onFocus="if(this.value=='Number Of Person In Room'){this.value=''}" onBlur="if(this.value==''){this.value='Number Of Person In Room'}">	</label>
										<label><input type="text" id="roomInformation" name="roomInformation"  value="Room Information" onFocus="if(this.value=='Room Information'){this.value=''}" onBlur="if(this.value==''){this.value='Room Information'}">	</label>
										<label><input type="text" id="ownerName" name="ownerName"  value="Owner Name" onFocus="if(this.value=='Owner Name'){this.value=''}" onBlur="if(this.value==''){this.value='Owner Name'}">	</label>
										<label><input type="text" id="rent" name="rent"  value="Rent" onFocus="if(this.value=='Rent'){this.value=''}" onBlur="if(this.value==''){this.value='Rent'}">	</label>
										
										<label><input type="text" id="fullAddress" name="fullAddress"  value="Full Address" onFocus="if(this.value=='Full Address'){this.value=''}" onBlur="if(this.value==''){this.value='Full Address'}">	</label>
										<label><input type="text" id="rule" name="rule"  value="Define Rule for Room" onFocus="if(this.value=='Define Rule for Room'){this.value=''}" onBlur="if(this.value==''){this.value='Define Rule for Room'}">	</label>
										<label><input type="text" id="roomStatus" name="roomStatus" value="Room Status" onFocus="if(this.value=='Room Status'){this.value=''}" onBlur="if(this.value==''){this.value='Room Status'}">	</label>
										<label><font size="5">&nbsp;<u>Country</u><br/></font><select class="label" id="country" name="country">
										<logic:iterate name="contryListData" id="cntry">
										<p><option value="<bean:write name="cntry"/>"><bean:write name="cntry"/></option></p>
										</logic:iterate>											  
										</select></label>
										
										Upload Room Photo : <html:file property="fileRoom" size="50" />
										<br></br>
										<a href="#" class="button1" onclick="javascript:login()">Create Room</a>
										<a href="#" class="button1" onClick="document.getElementById('contact-form').reset()">clear</a>
										
									</fieldset>
								</form>
								
							</div>
						
						</div>
					</div>
					<div class="grid_4 prefix_1">
						<h2>Video of Reports</h2>
						<form id="contact-form">
							<fieldset>
										
								
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

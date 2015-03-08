<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact</title>

<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="screen">
<script type="text/javascript" >

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47069136-1', 'checkmypasswords.com');
  ga('send', 'pageview');

</script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-migrate-1.1.1.js"></script>
<script type="text/javascript">

function sendContactMail()
{
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var phone=document.getElementById("phone").value;
	var message=document.getElementById("message").value;

	var xmlhttp=new XMLHttpRequest();

		if(email!='' && email!='Email' && message!='' && message!='Message'){
			xmlhttp.onreadystatechange=function()
		  	{
		  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    	{
		  	    	//alert("resp: "+xmlhttp.responseText);
		    		document.getElementById("resp").innerHTML=xmlhttp.responseText;
		    	}else{
				
		    		document.getElementById("resp").innerHTML="<img src=\"images/3.gif\" alt=\"wait loading..\">";
			    }
		  	}
			var newUrl = "/RememberYourPassword/Contact.do?method=sendContact&name="+encodeURIComponent(name)+"&email="+encodeURIComponent(email)+"&phone="+encodeURIComponent(phone)+"&message="+encodeURIComponent(message);
		  	//alert("URL: "+newUrl );
			xmlhttp.open("POST",newUrl ,true);
			xmlhttp.send(null);
		}
		else
		{
			alert('Please Enter Username and password');
		}

}


</script>

</head>
<body>
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="wrapper">
					<a href="index.html" class="logo"></a><%-- design.maniacs --%>
					<nav>
						<ul class="menu">
							<li class="active"><a href="#">Contact Us</a></li>

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
					<div align="center" style="color: red;" id="resp"></div>
					<div class="grid_7">
						<h2>Contact Info</h2>
						<div class="wrapper">
							<div class="grid_4 alpha">
							    <!--<iframe width="300" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=0.01628,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>-->
								<!--<iframe width="300" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?q=Pune,+Maharashtra&hl=en&ll=18.520429,73.85675&spn=0.011882,0.021136&sll=18.524185,73.864689&sspn=0.380225,0.676346&t=h&hnear=Pune,+Maharashtra&z=16&iwloc=A"></iframe>-->
								<iframe width="300" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Pune,+Maharashtra&amp;aq=&amp;sll=18.524185,73.864689&amp;sspn=0.380225,0.676346&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Pune,+Maharashtra&amp;ll=18.520429,73.85675&amp;spn=0.011882,0.021136&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
								<!--<br /><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Pune,+Maharashtra&amp;aq=&amp;sll=18.524185,73.864689&amp;sspn=0.380225,0.676346&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Pune,+Maharashtra&amp;ll=18.520429,73.85675&amp;spn=0.011882,0.021136&amp;z=14&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a></small>-->
							</div>
							<div class="grid_3 omega">
								<div class="contacts">
									<strong class="title">CheckMyPasswords.com</strong>
									A-7 Angle Park, <br>
									S.B Road, Near Chatushrungi.<br/><br/>
								   	E-mail:<br/><a href="#" class="link">support@checkmypasswords<br/>.com</a> 
								</div>		
							</div>
						</div>
					</div>
					<div class="grid_4 prefix_1">
						<h2>Get In Touch</h2>
						<form id="contact-form">
						
							<fieldset>
								<label><input type="text" id="name" name="name" value="Name" onFocus="if(this.value=='Name'){this.value=''}" onBlur="if(this.value==''){this.value='Name'}">	</label>
								<label><input type="text" id="email"  name="email" value="Email" onFocus="if(this.value=='Email'){this.value=''}" onBlur="if(this.value==''){this.value='Email'}">	</label>
								<label><input type="text"  id="phone"  name="phone" value="Phone" onFocus="if(this.value=='Phone'){this.value=''}" onBlur="if(this.value==''){this.value='Phone'}">	</label>
								<textarea id="message" onFocus="if(this.value=='Message'){this.value=''}" name="message" onBlur="if(this.value==''){this.value='Message'}">Message</textarea>
								<a href="#" class="button1" onClick="sendContactMail();">send</a>
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
</body>
</html>
<!DOCTYPE HTML>
<html>

<head>
<title>Voidmain</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">Drug De-Addiction<span class="logo_colour">Counseling</span></a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">
				
					<li><a href="index.jsp">Login</a></li>
					<li><a href="registration.jsp">Registration</a></li>
					<li><a href="paymentinfo.jsp">Payment Info</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>Register Here</h1>
				<%
					}
				%>

				<form action="VoidmainServlet" method="post" name="appform">

					<input type="hidden" name="type" value="com.voidmain.pojo.Client">
					<input type="hidden" name="redirect" value="registration.jsp">

					<div class="form_settings">
						
						<p>
							<span>Name</span><input class="contact" type="text" name="name"
								required="required" />
						</p>
						<p>
							<span>User Name</span><input class="contact" type="text" name="username"
								required="required" />
						</p>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="password" required="required" />
						</p>
						<p>
							<span>Mobile</span><input class="contact" type="tel"
								name="mobile" required="required" />
						</p>
						<p>
							<span>Email Address</span><input class="contact" type="email"
								name="email" required="required" />
						</p>
						<p>
							<span>Address</span>
							<textarea class="contact" name="address" required="required"></textarea>

						</p>
						<p>
							<span>Gender</span>
							<select name="gender">
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</p>
						<p>
							<span>Age</span><input class="contact" type="number"
								name="age" required="required" />
						</p>
						<p>
							<span>Profession</span><input class="contact" type="text"
								name="profession" required="required" />
						</p>
						<p>
							<span>Known Languages</span><input class="contact" type="text"
								name="languages" required="required" />
						</p>
						<p>
							<span>Problem Description</span>
							<textarea class="contact" name="problem" required="required"></textarea>

						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Register" onclick="return validate()" />
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

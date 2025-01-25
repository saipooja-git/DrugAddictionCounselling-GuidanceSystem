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

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");

						if (role.equals("1")) {
					%>
						<li><a href="viewclients.jsp">Clients</a></li>
						<li><a href="viewcounselors.jsp">Counselors</a></li>
						<li><a href="viewreviews.jsp">Reviews</a></li>
						<li><a href="addcounselor.jsp">Add Counselor</a></li>
						<li><a href="viewmessages.jsp">Messages</a></li>
						<li><a href="viewschedules.jsp">Schedules</a></li>
					<%
						}
					%>
					<%
						if (role.equals("2")) {
					%>
						<li><a href="viewclients.jsp">Clients</a></li>
						<li><a href="viewmessages.jsp">Messages</a></li>
					
					<%
						}
					%>
					<%
						if (role.equals("3")) {
					%>
						<li><a href="viewschedules.jsp">Schedules</a></li>
						<li><a href="viewcounselors.jsp">Counselors</a></li>
						<li><a href="viewmessages.jsp">Messages</a></li>
						<li><a href="postmessage.jsp?to=admin">Contact</a></li>
						<li><a href="postreview.jsp">Post Review</a></li>
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
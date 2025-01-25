<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>

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
	<h1>Add Counselor</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Counselor">
		<input type="hidden" name="redirect" value="addcounselor.jsp">

		<div class="form_settings">

			<p>
				<span>Name</span><input class="contact" type="text" name="name"
					required="required" />
			</p>
			<p>
				<span>User Name</span><input class="contact" type="text"
					name="username" required="required" />
			</p>
			<p>
				<span>Password</span><input class="contact" type="password"
					name="password" required="required" />
			</p>
			<p>
				<span>Mobile</span><input class="contact" type="tel" name="mobile"
					required="required" />
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
				<span>Gender</span> <select name="gender">
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</p>
			<p>
				<span>Specialization</span><input class="contact" type="text" name="specialization"
					required="required" />
			</p>
			<p>
				<span>Skills</span><input class="contact" type="text"
					name="skills" required="required" />
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add"
					onclick="return validate()" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>
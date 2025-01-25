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
	<h1>Post Message</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Message">
		<input type="hidden" name="redirect" value="postmessage.jsp">
		
		<input type="hidden" name="postedby" value="<%=username%>">
		<input type="hidden" name="postedto" value="<%=request.getParameter("to")%>">
		<input type="hidden" name="mdate" value="<%=new Date().toString()%>">
		

		<div class="form_settings">
			<p>
				<span>Enter Message</span>
				<textarea class="contact" name="message" required="required"></textarea>

			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Send"
					onclick="return validate()" />
			</p>
			
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>
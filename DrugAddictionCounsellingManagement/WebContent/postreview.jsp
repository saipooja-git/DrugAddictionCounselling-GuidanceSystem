<%@page import="com.voidmain.pojo.Counselor"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.Schedule"%>
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
	<h1>Post Review</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Review">
		<input type="hidden" name="redirect" value="postreview.jsp">
		
		<input type="hidden" name="postedby" value="<%=username%>">
		<input type="hidden" name="rdate" value="<%=new Date().toString()%>">
		

		<div class="form_settings">
			
			<p>
				<span>Enter Review</span>
				<textarea class="contact" name="review" required="required"></textarea>

			</p>
			
			<p>
				<span>Select Counselor</span> 
				<select name="postedto">
					<%
						for (Schedule schedule: HibernateDAO.getSchedules()) 
						{
							if(schedule.getClientid().equals(username))
							{
								Counselor counselor=HibernateDAO.getCounselorById(schedule.getAssignedto());	
					%>
								<option value="<%=schedule.getAssignedto()%>"><%=counselor.getUsername()%>--<%=counselor.getName()%></option>
					<%		
							}
						}
					%>
				</select>
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
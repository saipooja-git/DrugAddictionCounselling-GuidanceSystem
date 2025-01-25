<%@page import="com.voidmain.pojo.Schedule"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>

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
		<h1>View Schedules</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<tr>
				<th>Schedule ID</th>
				<th>Client ID</th>
				<th>Counselor</th>
				<th>From Date</th>
				<th>To Date</th>
				<th>Amount</th>
				<th>Payment Status</th>
				
				<%
					if(role.equals("3"))
					{
				%>
							<th>Pay</th>
				<%
					}
				%>
				
				<th>Delete</th>
				
			</tr>
			
			<%
				for (Schedule schedule : HibernateDAO.getSchedules()) 
				{
			%>
					<tr>
						<td><%=schedule.getId()%></td>
						<td><%=schedule.getClientid()%></td>
						<td><%=schedule.getAssignedto()%></td>
						<td><%=schedule.getFromdate()%></td>
						<td><%=schedule.getTodate()%></td>
						<td><%=schedule.getAmount()%></td>
						<td><%=schedule.getPaymentstatus()%></td>
						<%
							if(role.equals("3"))
							{
								if(schedule.getPaymentstatus().equals("yes"))
								{
						%>
									<td>paid</td>
						<%			
								}
								else
								{
						%>
									<td><a href="payment.jsp?sid=<%=schedule.getId()%>">pay</a></td>
						<%
								}
							}
						%>
						<td><a href="viewschedules.jsp?sid=<%=schedule.getId()%>">delete</a></td>
					</tr>
			<%
				}
			%>

		</table>

		<%
			String sid = request.getParameter("sid");

			if (sid != null) {
				
				if (HibernateTemplate.deleteObject(Schedule.class, sid) == 1) {
					response.sendRedirect("viewschedules.jsp?status=success");
				} else {
					response.sendRedirect("viewschedules.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>
<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.voidmain.pojo.Schedule"%>
<%@page import="com.voidmain.pojo.Client"%>
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
		<h1>View Clients</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">

			<%
				if(role.equals("1"))
				{
			%>
					<tr>
						<th>Client ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Address</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Profession</th>
						<th>Languages</th>
						<th>Problem Description</th>
						<th>Assign to Counselor</th>
						<th>Delete</th>
					</tr>
			<%
				}
			%>
			
			<%
				if(role.equals("2"))
				{
			%>
					<tr>
						<th>Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Profession</th>
						<th>Languages</th>
						<th>Problem Description</th>
						<th>Post Message</th>
					</tr>
			<%
				}
			%>

			<%
				if(role.equals("1"))
				{
					for (Client client : HibernateDAO.getClients()) 
					{
			%>
						<tr>
							<td><%=client.getUsername()%></td>
							<td><%=client.getName()%></td>
							<td><%=client.getEmail()%></td>
							<td><%=client.getMobile()%></td>
							<td><%=client.getAddress()%></td>
							<td><%=client.getGender()%></td>
							<td><%=client.getAge()%></td>
							<td><%=client.getProfession()%></td>
							<td><%=client.getLanguages()%></td>
							<td><%=client.getProblem()%></td>
							<td><a href="assigntocounselor.jsp?cid=<%=client.getUsername()%>">assign</a></td>
							<td><a href="viewclients.jsp?cid=<%=client.getUsername()%>">delete</a></td>
						</tr>
			<%
					}
				}
			%>
			
			<%
				if(role.equals("2"))
				{
					for (Schedule schedule : HibernateDAO.getSchedules()) 
					{
						if(schedule.getAssignedto().equals(username) && schedule.getPaymentstatus().equals("yes"))
						{
							Client client=HibernateDAO.getClientById(schedule.getClientid());
			%>
							<tr>
								<td><%=client.getName()%></td>
								<td><%=client.getGender()%></td>
								<td><%=client.getAge()%></td>
								<td><%=client.getProfession()%></td>
								<td><%=client.getLanguages()%></td>
								<td><%=client.getProblem()%></td>
								<td><a href="postmessage.jsp?to=<%=client.getUsername()%>">send message</a></td>
							</tr>
			<%
						}
					}
				}
			%>

		</table>

		<%
			String cid = request.getParameter("cid");

			if (cid != null) {
				
				if (HibernateTemplate.deleteObject(Client.class, cid) == 1 && HibernateTemplate.deleteObject(Login.class,cid)==1) {
					response.sendRedirect("viewclients.jsp?status=success");
				} else {
					response.sendRedirect("viewclients.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>
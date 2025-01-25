<%@page import="com.voidmain.pojo.Schedule"%>
<%@page import="com.voidmain.pojo.Counselor"%>
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
		<h1>View Counselors</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<%
				if(role.equals("1"))
				{
			%>
					<tr>
						<th>Counselor ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Address</th>
						<th>Gender</th>
						<th>Specialization</th>
						<th>Skills</th>
						<th>Delete</th>
					</tr>
			<%
				}
			%>
			
			<%
				if(role.equals("3"))
				{
			%>
					<tr>
						<th>Counselor ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Specialization</th>
						<th>Skills</th>
						<th>send message</th>
					</tr>
			<%		
				}
			%>
			
			<%
				if(role.equals("1"))
				{
					for (Counselor counselor : HibernateDAO.getCounselors()) 
					{
				%>
						<tr>
							<td><%=counselor.getUsername()%></td>
							<td><%=counselor.getName()%></td>
							<td><%=counselor.getEmail()%></td>
							<td><%=counselor.getMobile()%></td>
							<td><%=counselor.getAddress()%></td>
							<td><%=counselor.getGender()%></td>
							<td><%=counselor.getSpecialization()%></td>
							<td><%=counselor.getSkills()%></td>
							<td><a href="viewcounselors.jsp?cid=<%=counselor.getUsername()%>">delete</a></td>
						</tr>
				<%
					}
				}
			%>
			
			<%
				if(role.equals("3"))
				{
					for (Schedule schedule : HibernateDAO.getSchedules())  
					{
						if(schedule.getClientid().equals(username) && schedule.getPaymentstatus().equals("yes"))
						{
							Counselor counselor=HibernateDAO.getCounselorById(schedule.getAssignedto());
				%>
								<tr>
									<td><%=counselor.getUsername()%></td>
									<td><%=counselor.getName()%></td>
									<td><%=counselor.getGender()%></td>
									<td><%=counselor.getSpecialization()%></td>
									<td><%=counselor.getSkills()%></td>
									<td><a href="postmessage.jsp?to=<%=counselor.getUsername()%>">send message</a></td>
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
				
				if (HibernateTemplate.deleteObject(Counselor.class, cid) == 1) {
					response.sendRedirect("viewcounselors.jsp?status=success");
				} else {
					response.sendRedirect("viewcounselors.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>
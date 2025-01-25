<%@page import="com.voidmain.pojo.Message"%>
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
		<h1>View Messages</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">

			<tr>
				<th>Message</th>
				<th>Posted By</th>
				<th>Date</th>
				<th>Reply</th>
				<th>Delete</th>
			</tr>

			<%
				for (Message message : HibernateDAO.getMessages()) 
				{
					if(message.getPostedto().equals(username))
					{
			%>
					<tr>
						<td><%=message.getMessage()%></td>
						<td><%=message.getPostedby()%></td>
						<td><%=message.getMdate()%></td>
						<td><a href="postmessage.jsp?to=<%=message.getPostedby()%>">reply</a></td>
						<td><a href="viewmessages.jsp?mid=<%=message.getId()%>">delete</a></td>
					</tr>
			<%
					}
				}
			%>

		</table>

		<%
			String mid = request.getParameter("mid");

			if (mid != null) {
				
				if (HibernateTemplate.deleteObject(Message.class, mid) == 1) {
					response.sendRedirect("viewmessages.jsp?status=success");
				} else {
					response.sendRedirect("viewmessages.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>
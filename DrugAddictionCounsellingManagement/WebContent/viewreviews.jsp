<%@page import="com.voidmain.pojo.Review"%>
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
		<h1>View Reviews</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">

			<tr>
				<th>Review ID</th>
				<th>Review</th>
				<th>Counselor</th>
				<th>Posted By</th>
				<th>Delete</th>
			</tr>

			<%
				for (Review review : HibernateDAO.getReviews()) 
				{
			%>
					<tr>
						<td><%=review.getId()%></td>
						<td><%=review.getReview()%></td>
						<td><%=review.getPostedto()%></td>
						<td><%=review.getPostedby()%></td>
						<td><a href="viewreviews.jsp?rid=<%=review.getId()%>">delete</a></td>
					</tr>
			<%
				}
			%>

		</table>

		<%
			String rid = request.getParameter("rid");

			if (rid != null) {
				
				if (HibernateTemplate.deleteObject(Review.class, rid) == 1) {
					response.sendRedirect("viewreviews.jsp?status=success");
				} else {
					response.sendRedirect("viewreviews.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>
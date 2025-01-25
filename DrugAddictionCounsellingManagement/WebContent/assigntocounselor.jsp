<%@page import="com.voidmain.pojo.Schedule"%>
<%@page import="com.voidmain.pojo.Counselor"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
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
	<h1>Assign Counselor</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="clientid" value="<%=request.getParameter("cid")%>">
		<input type="hidden" name="paymentstatus" value="no">
		<input type="hidden" name="type" value="com.voidmain.pojo.Schedule">
		<input type="hidden" name="redirect" value="viewclients.jsp"> 

		<div class="form_settings">
			<p>
				<span>Select Counselor</span> 
				<select name="assignedto">
					<%
						for (Counselor counselor : HibernateDAO.getCounselors()) 
						{
					%>
							<option value="<%=counselor.getUsername()%>"><%=counselor.getUsername()%>-<%=counselor.getSpecialization()%></option>
					<%		
						}
					%>
				</select>
			</p>
			<p>
				<span>From Date</span><input class="contact" type="date"
					name="fromdate" required="required" />
			</p>
			<p>
				<span>To Date</span><input class="contact" type="date"
					name="todate" required="required" />
			</p>
			<p>
				<span>Amount</span><input class="contact" type="text"
					name="amount" required="required" />
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Assign"
					onclick="return validate()" />
			</p>
		</div>
	</form>

</div>
<%@include file="footer.jsp"%>
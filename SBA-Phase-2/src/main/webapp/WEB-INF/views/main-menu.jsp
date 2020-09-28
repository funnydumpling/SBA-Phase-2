<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	
</head>
<body>
	<h1 style="text-align: center">Corona Prevention Kit Order Portal</h1>
	<hr/>
	<jsp:include page="header.jsp" />
	
	<p align="center">Hope you're safe and sound during this pandemic. Click on the below link to proceed.</p>
	<br>
	<nav style="text-align: center">
		<security:authorize access="hasRole('ADMIN')">
			<h3><a href="${pageContext.request.contextPath}/admin/home">Admin Dashboard</a></h3>
		</security:authorize>
		<security:authorize access="hasRole('USER')">
			<h3><a href="${pageContext.request.contextPath}/user/home">User Dashboard</a></h3>
		</security:authorize>
	</nav>
	<br><br><br>
	<div style="text-align: center;color:grey"><strong>Be informed!Be prepared!</strong></div><br>
	<div style="text-align: center;color:grey"><strong>Be smart!Be safe!</strong></div><br>
	<div style="text-align: center;color:grey"><strong>Be ready to fight <span style="color:forestgreen"><i>#Covid19</i></span></strong></div><br>
	
	
	<jsp:include page="footer.jsp" />
	
	
</body>

</html>
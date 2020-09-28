<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<style>
					.blinking{
							    animation:blinkingText 1.2s infinite;
							}
					@keyframes blinkingText{
					    0%{     color: #000;    }
					    49%{    color: #000; }
					    60%{    color: blue; }
					    99%{    color: orange;  }
					    100%{   color: #000;    }
					}
					
</style>
</head>
<body>
	<h1 style="text-align: center">Corona Prevention Kit Order Portal</h1>
	<hr/>
	<jsp:include page="header.jsp" />
	<nav style="text-align: center"	>
		 <security:authorize access="hasRole('ADMIN')">
			<a href="${pageContext.request.contextPath}/admin/home">Home</a>
		</security:authorize>
		<span>|</span>
		<security:authorize access="hasRole('ADMIN')">
			<a href="${pageContext.request.contextPath}/admin/product-entry">Add Product</a>
		</security:authorize>
		<span>|</span>
		<security:authorize access="hasRole('ADMIN')">
			<a href="${pageContext.request.contextPath}/admin/product-list">View Products</a>
		</security:authorize>
	</nav>
	<h3 style="color:darkSalmon" class="blinking">Welcome to the Admin Dashboard.</h3>
		<p>You can perform following two tasks as the Admin. <br>
		<br>[1] Add a new product to the Corona Prevention Kit<br>  
		<br>[2] View all the items added to the Corona Prevention Kit<br>  
		</p>
		
	<jsp:include page="footer.jsp" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard</title>
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
		 <security:authorize access="hasRole('USER')">
			<a href="${pageContext.request.contextPath}/user/home">Home</a>
		</security:authorize>
		<span>|</span>
		<security:authorize access="hasRole('USER')">
			<a href="${pageContext.request.contextPath}/user/show-list">View All Products</a>
		</security:authorize>
		<span>|</span>
		<security:authorize access="hasRole('USER')">
			<a href="${pageContext.request.contextPath}/user/show-kit">View Cart</a>
		</security:authorize>
	</nav>
	
	<h3 style="color:darkSalmon" class="blinking" >Welcome to the User Dashboard.</h3>
		<p>You can perform following two tasks as the User. <br>
		<br>[1] View all products in the Corona Prevention Kit<br>  
		<br>[2] View your Kit  
		</p>
		
		
	<jsp:include page="footer.jsp" />
	
</body>
</html>
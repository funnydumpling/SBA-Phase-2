<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<header>
<nav >
		<h2 style="color:teal">  <i>Welcome <security:authentication property="principal.username" /></i></h2>
		
		<spring-form:form action="${pageContext.request.contextPath}/logout" method="POST">			
		<input type="submit" value="Logout" style="float: right;">
		</spring-form:form>
	</nav>
</header>
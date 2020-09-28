<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login-page</title>

</head>
<body>
	<h1 style="text-align: center">Corona Prevention Kit Order Portal</h1>
		<hr/>
		
	<spring-form:form action="${pageContext.request.contextPath}/validate" method="POST">
				<h2 style="color:teal"><i>Welcome to Order Portal</i></h2>
				<p></p>
				<p>Enter your credentials in the form below.</p>
				<p style="color:red">
				<c:if test="${param.error ne null}">
					Invalid Credentials! Access Denied!
				</c:if>
				</p>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<label>UserName: <input type="text" name="username"/></label>
				<label>Password: <input type="password" name="password"/></label>
				<input type="submit" value="Login" />
				
				
			
			</spring-form:form>
		
	
<jsp:include page="footer.jsp"/>
	
</body>
</html>
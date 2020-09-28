<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Add New Product</title>
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
			<a href="${pageContext.request.contextPath}/admin/product-list">View Products</a>
		</security:authorize>
	</nav>
	

  	
<h2 align="center" style="font: normal; color: darkSalmon;">Add Product</h2>
  <div align="center" >
    <div align="left" style="display: inline-block; padding: 10px;">
      <form:form action="${pageContext.request.contextPath}/admin/product-save" method="post" modelAttribute="product">
      <div>
          <form:label path="productName">Product Name:</form:label>
          <form:input type="text" path="productName" required="required" maxlength="20" />
          <form:errors path="productName"/>
        </div>
        <br>
        <div>
          <form:label path="cost">Product Cost:</form:label>
          <form:input type="number" path="cost" required="required" />
          <form:errors path="cost"/>
        </div>
        <br>
        <div>
          <form:label path="productDescription">Product Description:</form:label>
          <form:input type="text" path="productDescription" maxlength="60" />
          <form:errors path="productDescription"/>
        </div>
        <br>
		<div style="text-align:center">  
		    <input type="submit" value="Add"/>  
		</div>  
      </form:form>
    </div>
  </div>
  <div>
	<jsp:include page="footer.jsp" />
	</div>
</body>

</html>
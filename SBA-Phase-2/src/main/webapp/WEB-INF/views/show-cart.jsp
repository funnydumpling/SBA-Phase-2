<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Cart</title>
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
	</nav>
	
	
	<h2 align="center" style="font: normal; color: darkSalmon;">Corona Prevention Kit - Cart Details</h2>
	<c:choose>
		<c:when test="${products==null || products.isEmpty() }">
			<br>
			<br>
			<div style="color:blue;" align="center" class="blinking"><i>Your cart is Empty! Kindly add some products to your Cart</i></div>
		</c:when>
		<c:otherwise>
			<div align="center">
				<div style="display: inline-block; padding: 10px;">
					<table border="1" cellspacing="5px" cellpadding="5px" width="100%" style="text-align:center;">
						<thead>
								<tr>
									<th>Product Name</th>
									<th>Product NameDescription</th>
									<th>Product Cost</th>
									<th>Quantity</th>
									<th>Total Amount</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${products }" var="product">
									<tr>
										<td>${product.productName }</td>
										<td>${product.productDescription }</td>
										<td>${product.cost }</td>
										<c:choose>
											<c:when test="${cart[product.id]==null}">
												<td></td>
												<td></td>
											</c:when>
											<c:otherwise>
											<td>${cart[product.id].quantity}</td>
											<td>${cart[product.id].amount}</td>
											</c:otherwise>
										</c:choose>
									<td><a href="${pageContext.request.contextPath}/user/delete/${product.id }">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
					<a href="${pageContext.request.contextPath}/user/checkout">Proceed with Order</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	
<jsp:include page="footer.jsp"/>	
</body>
</html>
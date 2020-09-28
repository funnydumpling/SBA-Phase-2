<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Summary</title>
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
	
	<h2 align="center" style="font: normal; color: darkSalmon;">Order Summary</h2>
	<div>
	<p style="color: black;font-size: 20px;" align="left">Billed to :<b> ${username }</b></p>
	<p style="color: black;font-size: 20px;" align="left">Amount to be paid : <b>&#8377; ${totalAmount }</b></p>
	</div>	
	<p align="center">Please find your order summary details as follows.</p>
	
	<c:choose>
		<c:when test="${product==null || product.isEmpty() }">
			
			<div style="color:blue;" align="center" class="blinking"><i>Your cart is Empty! Kindly add some products to your Corona Prevention Kit</i></div>
		</c:when>
		<c:otherwise>
			<div align="center">
			
					<table border="1" cellspacing="5px" cellpadding="5px" width="70%" style="text-align:center;">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Product Description</th>
								<th>Product Cost</th>
								<th>Quantity</th>
								<th>Total Amount</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${product }" var="product">
								<tr>
									<td>${product.productName }</td>
									<td>${product.productDescription }</td>
									<td>${product.cost }</td>
									<c:choose>
										<c:when test="${kit[product.id]==null}">
											<td>0</td>
											<td>0</td>
										</c:when>
										<c:otherwise>
											<td>${kit[product.id].quantity}</td>
											<td>${kit[product.id].amount}</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4" style="font-size:20px"><b>Bill Amount</b></td>
								<td style="color:purple;font-size:20px"><b>&#8377;${totalAmount }</b></td>
								
							</tr>
						</tbody>
					</table>
				</div>
				
				
				<div style="float:right;width:30%">
					<p><b><i>Delivery Address :</i></b></p>
					<span>${address }</span>
					<p><b><i>Contact details :</i></b></p>
					<span>${contact }</span>
					<br>
					<span>${email }</span>
				</div>
				
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>

</head>
<body>
	<h1 style="text-align: center">Corona Prevention Kit Order Portal</h1>
	<hr/>
	<jsp:include page="header.jsp" />
	<h2 align="center" style="font: normal; color: darkSalmon;">Shipping Address</h2>
	<p align="center"><b>Enter your details before proceeding with checkout.</b></p>
	<div align="center">
		<table>
			<tr>
				<td>
					<form action="${pageContext.request.contextPath}/user/finalize" method="post">
						<label><pre>Address</pre></label>
						<textarea name="address" rows="5" cols="60" required></textarea>
						<br>
						<label><pre>Contact Number      </pre> </label>    
			            <input type="number" name="contact"  required/>
			            <br>  
			            <label><pre>Email          </pre> </label>
			            <input type="email" name="email"  required/>
						<br><br>
						<div align="center">
							<button >View Order Summary</button>
						</div>
					</form>
				</td>
			</tr>
		</table>
	</div>
	
	
<jsp:include page="footer.jsp"/>
</body>
</html>
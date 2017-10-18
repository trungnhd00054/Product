
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products List</title>
<!-- Bootstrap CSS -->
<%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
.myrow-container {
	margin: 20px;
}
</style>
</head>
<body class=".container-fluid">


	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">
				<div align="center">
					<h2>Products List</h2>
				</div>
				<div align="right">
					<a href="createProduct">Add New Product</a>
				</div>
			</h3>
		</div>
		<div class="panel-body">
			<c:if test="${empty productList}">
                There are no Product
            </c:if>
			<c:if test="${not empty productList}">

				<form action="searchProduct">
					
					
					 <div class="form-group">
						<div class="col-xs-4" style="margin-bottom: 10px">
							<div class="control-label col-xs-3"><label for="usr">Search by Name:</label></div>							
							<div class="col-xs-9"><input class="form-control" type='text' name='searchName' id='searchName' placeholder="Search by Name Product" width: 300px;/></div>
						</div>
						<div class="col-xs-3">
							<input class="btn btn-success" type='submit' value='Search' />
						</div>
					</div>				
				</form>

				<table class="table table-hover table-bordered">
					<thead style="background-color: #bce8f1;">
						<tr>
							<!-- <th>Id</th> -->
							<th>Product Name</th>
							<th>Quantity</th>
							<th>UnitPrice</th>
							<th>Discount</th>
							<th>Total</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="pro">
							<tr>
								<%-- <th><c:out value="${pro.id}"/></th> --%>
								<th><c:out value="${pro.productName}" /></th>
								<th><c:out value="${pro.quantity}" /></th>
								<th><c:out value="${pro.unitPrice}" /></th>
								<th><c:out value="${pro.discount}" /></th>
								<th><c:out
										value="${(pro.unitPrice)*(pro.quantity)*((100-(pro.discount))/100)}" /></th>
								<th><a href="editProduct?id=<c:out value='${pro.id}'/>">Edit</a></th>
								<th><a href="deleteProduct?id=<c:out value='${pro.id}'/>">Delete</a></th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
     --%>

</body>
</html>
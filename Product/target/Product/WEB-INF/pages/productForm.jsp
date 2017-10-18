
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Ranga Reddy">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Information</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
    <div class="container myrow-container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Product Details
                </h3>
            </div>
            <div class="panel-body">
                <form:form id="productRegisterForm" cssClass="form-horizontal" modelAttribute="product" method="post" action="saveProduct">
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="productName" >productName</form:label> </div>
                        <div class="col-xs-6">
                            <form:hidden path="id" value="${productObject.id}"/>
                            <form:input cssClass="form-control" path="productName" value="${productObject.productName}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="quantity" cssClass="control-label col-xs-3">Quantity</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="quantity" value="${productObject.quantity}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="unitPrice">UnitPrice</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="unitPrice" value="${productObject.unitPrice}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="discount">Discount</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="discount" value="${productObject.discount}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">
                            </div>
                            <div class="col-xs-4">
                                <input type="submit" id="saveProduct" class="btn btn-primary" value="Save" onclick="return submitProductForm();"/>
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
    
                </form:form>
            </div>
        </div>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		function submitProductForm() {				
			
		    // getting the product form values
		    var name = $('#productName').val().trim();
		    var quantity = $('#quantity').val();
		    var unitPrice = $('#unitPrice').val();
		    var discount = $('#discount').val();
		    var patterns = !/^[0-9]+$/;
		    if(name.length ==0 ) {
		        alert('Please enter name');
		        $('#productName').focus();
		        return false;
		    }
			
		    if(quantity <= 0) {
		        alert('Please enter proper quantity');
		        $('#quantity').focus();
		        return false;
		    }
		    if(quantity.test(patterns) ) {
		        alert('Please enter name');
		        $('#productName').focus();
		        return false;
		    }
		    if(unitPrice <= 0) {
		        alert('Please enter proper unitPrice');
		        $('#unitPrice').focus();
		        return false;
		    }
		    if(unitPrice.test(patterns) ) {
		        alert('Please enter name');
		        $('#productName').focus();
		        return false;
		    }
		    if(discount <= 0) {
		        alert('Please enter proper discount');
		        $('#discount').focus();
		        return false;
		    }
		    if(discount.test(patterns) ) {
		        alert('Please enter name');
		        $('#productName').focus();
		        return false;
		    }
		    return true;
		};	
	</script>

</body>
</html>
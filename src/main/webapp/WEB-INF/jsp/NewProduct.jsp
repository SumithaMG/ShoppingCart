<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<head>
<title>First Web Application</title>
    <link href="<c:url value="/css/navigation.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/forrm.css"/>" rel="stylesheet" type="text/css">
    <style>
    body{
      background: rgb(238,174,202);
      background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,183,233,1) 100%);
    }
    </style>
</head>

<body>
<div id="navDiv">
      <ul>
           <li><a href="http://localhost:8081/login">Home</a></li>
           <li><a href="#news">News</a></li>
           <li class="dropdown">
             <a href="javascript:void(0)" class="dropbtn">Products</a>
             <div class="dropdown-content">
               <a href="http://localhost:8081/newProduct">Add new Product</a>
               <a href="http://localhost:8081/updateProducts">Update Product</a>
               <a href="http://localhost:8081/listProducts">View Products</a>
             </div>
           </li>
         </ul>
</div>
<div id="did">
    <form >
        <label for="productName">Product Name</label>
        <input type="text" name="productName" id="productName" placeholder="Product name..">

        <label for="productCategory">Product Category</label>
        <input type="text" name="productCategory" id="productCategory" placeholder="Product category..">

        <label for="productPrice">Product Price </label>
        <input type="text" name="productPrice" id="productPrice" placeholder="Product price.."></br>
        <input type="button" value="submit" id="btn"/>
    </form>
</div>
</body>
<script>

   $("#btn").click(function (event) {
          var formData = {
               productName : $("#productName").val(),
               productCategory : $("#productCategory").val(),
               productPrice : $("#productPrice").val(),
         };
                $.ajax({
                url: 'http://localhost:8081/addProduct', // url where to submit the request
                type : "POST", // type of action POST || GET
                dataType : 'json', // data type
                contentType : "application/json",
                data : JSON.stringify(formData), // post data || get data - {productName: 'rice', productCategory: 'food', productPrice: '12'}
                success : function(result) { //'{"productId":"56","productName":"dvds","productCategory":"fgd","productPrice":"444"}'
                  loadJsonData(); //
                  console.log(data);
                },
                error: function(xhr, resp, text) {
                console.log(xhr, resp, text);
                }
        });

});
 </script>


</html>
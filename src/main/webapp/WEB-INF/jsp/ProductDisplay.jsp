<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<head>
<title>First Web Application</title>

    <link href="<c:url value="/css/navigation.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/common.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/button.css"/>" rel="stylesheet" type="text/css">

       <meta name="description" content="Fully editable data table">
           <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

           <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
                <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>

                <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet" type="text/css" />
                <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js" type="text/javascript" ></script>

                <link href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
                <script src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js" type="text/javascript"></script>
                <meta charset=utf-8 />
            <style>
            body {

               background: rgb(238,174,202);
               background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,183,233,1) 100%);
            }
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #9e9e9e;
              text-align: center;
              padding: 8px;
            }

            tr:nth-child(even) {
              //background-color: grey;
            }

  </style>
 </head>
 <body>
<div id="navDiv">
        <ul>
           <li><a href="http://localhost:8081/login">Home</a></li>
           <li><a href="http://localhost:8081/orders">Orders</a></li>
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
 <div class="container">
  <table id="example"  width="100%">
              <thead>
                  <tr>
                      <th>Product ID</th>
                      <th>Product Name</th>
                      <th>Product Category</th>
                      <th>Product Price</th>
                  </tr>
              </thead>
              <tbody>
                  <c:forEach items="${lists}" var="product">
                      <tr >
                          <td>${product.productId} </td>
                          <td>${product.productName}</td>
                          <td>${product.productCategory}</td>
                          <td>${product.productPrice}</td>
                      </tr>
                  </c:forEach>
              </tbody>
          </table>
</body>
</html>
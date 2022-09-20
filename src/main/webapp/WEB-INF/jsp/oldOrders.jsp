<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<head>
<title>Orders</title>
    <link href="<c:url value="/css/navigation.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/common.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/button.css"/>" rel="stylesheet" type="text/css">
  <style>
     body {
              background: rgb(238,174,202);
              background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,183,233,1) 100%);
           }
  </style>
<body>
  <div id="navDiv">
          <ul>
             <li><a href="http://localhost:8081/login">Home</a></li>
             <li><a href="#Order">Orders</a></li>
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
<h3> Product info </h3>
                    <c:forEach items="${lists}" var="product">
                        <div id="eachId"">
                            <div id="pid" style="display: none" >
                            ${product.productId}</br>
                            </div>
                            <div id="pname" style="width: 100px; float:left; height:100px;  margin:50px">
                            ${product.productName}
                            </div>
                            <div id="pprice" style="width: 100px; float:left; height:100px; margin:50px">
                            ${product.productPrice}
                            </div>
                            <div style="display: none">
                            ${product.productCategory}</br>
                            </div>
                            <div>
                            <p style="width: 100px; float:left; height:100px; margin:60px">
                            <button id="cart" style="color:black; background-color: lightpink; font-size:15px;" onclick="cartDetails('eachId')">Add to Cart</button></p>
                            </div>

                            <hr style="width:100%;text-align:left;margin-left:0">
                    </div>
                    </c:forEach>



  </body>

 <script>
var jsndata=null;
function cartDetails(eachId)
   {
   var cid =  $('#pid').text().trim();
   var cn = $('#pname').text().trim();
   var cp = $('#pprice').text().trim();
var aa =[cid, cn, cp];
        var arr1 = ['productId','productName','productPrice'];
        const farr = new Map();

        // Set Map Values
        for(i = 0 ; i < arr1.length  ; i++){
        farr.set(arr1[i], aa[i]);
        }
                console.log(farr);
                const mapObj = Object.fromEntries(farr);
                 jsndata= JSON.stringify(mapObj);
                 console.log(jsndata);

                    $.ajax({
                       url: 'http://localhost:8081/addtoCart', // url where to submit the request
                       type : "POST", // type of action POST || GET
                       dataType : 'json', // data type
                       contentType : "application/json",
                       data : jsndata, // post data || get data
                       success : function(result) {
                       loadJsonData();
                       console.log(data);
                       },
                       error: function(xhr, resp, text) {
                           console.log(xhr, resp, text);
                        }
                      });

 };

  $(function()
   {
      $('#cart').on("click",cartDetails)
  });

 </script>

 </html>
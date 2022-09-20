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
             <li><a href="http://localhost:8081/orders">Orders</a></li>
             <li class="dropdown">
               <a href="javascript:void(0)" class="dropbtn">Products</a>
               <div class="dropdown-content">
                 <a href="http://localhost:8081/newProduct">Add new Product</a>
                 <a href="http://localhost:8081/updateProducts">Update Product</a>
                 <a href="http://localhost:8081/listProducts">View Products</a>
               </div>
                <li style="padding-left:1000px;"><a href="http://localhost:8081/getCart">View Cart</a></li>
             </li>
           </ul>
  </div>
  <div class="container">
<h3> Product info </h3>
      <table id="example" class="display nowrap" width="100%">
                  <thead>

                  </thead>
                  <tbody>
                      <c:forEach items="${lists}" var="product">
                          <tr >
                              <td style="display: none; " >${product.productId} </td>
                              <td style=" padding-top: 50px;">${product.productName}</td>
                              <td style="display: none" >${product.productCategory}</td>
                              <td style=" padding-left: 80px; padding-right: 100px; padding-top: 50px;">${product.productPrice}</td>
                              <td style="padding-right: 450px; padding-top: 60px;"> <button  type="button" id="cart" class="butn" style="color:black; background-color: lightpink; font-size:15px;">Add to Cart</button></p>

                          </tr>
                      </c:forEach>
                  </tbody>
              </table>

                    </div>

  </body>

 <script>
var jsndata=null;

/*
              <form action ="getCart" method="get">
<button style="margin: 150px;" class="button button2" name="order">View Cart</button>
</form>
function cartDetails()
   {


   $(this).closest('tr').index();

      alert($(this).closest('tr').index());

   $('.ok').on('click', function(e){
       alert($("#table tr.selected td:first").html());
   });
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

 }; */

$('#example').on('click', '.butn', function()
{//replace table selector with an id selector, if you are targetting a specific table
    var $row = $(this).closest('tr');
  $(this).prop('disabled', true);
       var $cells = $row.find('td');
      var s= [$cells[0].innerHTML,$cells[1].innerHTML,$cells[2].innerHTML,$cells[3].innerHTML] ;
 var arr1 = ['productId','productName','productCategory', 'productPrice'];
        const farr = new Map();

        // Set Map Values
        for(i = 0 ; i < arr1.length  ; i++){
        farr.set(arr1[i], s[i]);
        }

var cust =['custId','custName', 'custAddr'];
var c= [1,"Zen","London"];
const carr = new Map();
    for(i = 0 ; i < cust.length  ; i++){
        carr.set(cust[i], c[i]);
        }
  const farr2 = new Map();
 // var cartt =['cart']
var arr2=['customer','product','quantity','price','finalPrice'];
const far = Object.fromEntries(farr);
const car = Object.fromEntries(carr);
var s2=[car, far, 1,$cells[3].innerHTML,$cells[3].innerHTML];
   for(i = 0 ; i < arr2.length  ; i++){
        farr2.set(arr2[i], s2[i]);
        }

                console.log(farr);
                const mapObj = Object.fromEntries(farr2);
                 jsndata= JSON.stringify(mapObj);
                 console.log(jsndata);
        alert("product added to cart successfully!");
                    $.ajax({
                       url: 'http://localhost:8081/addtoCart', // url where to submit the request
                       type : "POST", // type of action POST || GET
                       dataType : 'json', // data type
                       contentType : "application/json",
                       data : jsndata, // post data || get data
                       success : function(result) {
                      alert("product added to cart successfully!");
                       console.log(data);
                       },
                       error: function(xhr, resp, text) {
                           console.log(xhr, resp, text);
                        }
                      });

});

 </script>

 </html>
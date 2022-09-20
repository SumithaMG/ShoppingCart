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
             </li>
           </ul>
  </div>
<form id="frm1">
<h3> Product info </h3>

 <table id="examplee" class="display nowrap" width="100%" >


                    <c:forEach items="${lists}" var="cart">
                    <tr style=" border-top-width : 100px;">
                            <td style="float:left; margin-right:300px; width:100%" id="cids">
                                <p name="cartid"  style="display:none"> ${cart.cartId}</br></p>
                                <p name="cid"  style="display:none">${cart.customer.custId}</br></p>
                                <h3>${cart.product.productName}</br></h3>
                                ${cart.product.productCategory}</br>
                                <p name ="pid" style="display:none">${cart.product.productId}</br></p>
                             </td>
                             <td id="price" style="float:left; margin-left:800px; margin-right:0px; width:50px; ">
                                ${cart.price}
                                <td style="float:left; margin-left:40px; width:50px; " id="quantity">
                                <input type="number" class="butn" name="quantity" min="1" max="500" value="${cart.quantity}" onChange="calculateTotal();" >Quantity</input>
                             </td>
                             <td id="fprice" name="tot" style="float:left; margin-left:50px; margin-right:0px; width:50px" >  ${cart.finalPrice}
                             <!-- <p id="fPrice" name ="tot"></p> -->

                             </td>
                                 <!-- <td  style="float:left; margin-left:50px; margin-top: 5px"> <p name="tot" id="demo"></p></td> -->
                    </tr>
                    </c:forEach>
            </table>
             <hr style="width:100%;text-align:left;margin-left:0">
             <div width="100%">
                     <p style="margin-left:700px; float:left; padding-top:100"  name="total" id="mrp">Total MRP</p>
                     <p style="margin-left:805px; " name="totmrp" id="totalmrp"></p>

                     <button class="button button2" id="buy" style="border-style: inset; margin-top:100px; padding-top: 10px; padding-right: 10px; padding-left: 10px; border-radius: 15px">Proceed to Buy</button>
        </div>
</form>
 </body>

 <script>

         function calculateTotal()
         {
                $('#examplee').on('change', '.butn', function()
                {
                    var finalprice=0;
                    var $row = $(this).closest('tr');
                    var $cells = $row.find('td');
                    var cqty = $row.find('td input[type=number][name=quantity]').val();
                    var s= [$cells[1].innerHTML,$cells[2].innerHTML,$cells[3].innerHTML] ;
                    var cprice= s[0].trim();
                    var ctotal= cprice * cqty;
                    // $row.find('td [name=tot]').html(ctotal);
                    $cells[3].innerHTML= ctotal;
                     var cartid = $row.find('td [name=cartid]').text();
                     var pid = $row.find('td [name=pid]').text();
                     var cid = $row.find('td [name=cid]').text();
                    updateCart(cartid,cqty, cprice,ctotal,pid,cid);
                    $('table > tbody  > tr').each(function(index, tr)
                    {
                             //var tds = $(this).find('td [id=fprice]').text();
                             var tds = $(this).find("td:eq(3)").text().trim();
                             var che= tds.length;
                             if(che==0)
                             {
                                 tds= $(this).find("td:eq(1)").text().trim();
                             }
                             finalprice = finalprice + parseInt(tds);
                    });
                    $('#frm1').find('#totalmrp').html(finalprice);
                });
         };

         function updateCart(cartid,cqty, cprice,ctotal,pid,cid){
          const farr2 = new Map();
                var arr= ['cartId', 'quantity', 'price', 'finalPrice'];
               var carr=[cartid, cqty, cprice, ctotal];
               for(i = 0 ; i < arr.length  ; i++){
                       farr2.set(arr[i], carr[i]);

            /*     fetch('lists')
                   .then(function (response) {
                     return response.json();
                   })
                   .then(function (data) {
                     appendData(data);
                   })
                   .catch(function (err) {
                     console.log(err);
                   }); */

               }

                               const mapObj = Object.fromEntries(farr2);
                               jsndata= JSON.stringify(mapObj);
                               console.log(jsndata);

                 $.ajax({
                                                   url: 'http://localhost:8081/updateCart', // url where to submit the request
                                                   type : "PUT", // type of action POST || GET
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

         };

        $(document).ready(function()
        {
              const data="${lists}";
              var d= JSON.stringify(data);
                var amt=0;
                $('table > tbody  > tr').each(function(index, tr)
                {
                       //var tds= $(this).find("td:eq(1)").text().trim();
                       var tds= data.finalPrice;
                       amt = amt + parseInt(tds);
                });
               //  var element = document.getElementById('cart');
                $('#frm1').find('#totalmrp').html(amt);
        });

$('#buy').on('click', function()
{
            var totalAmt= $('#frm1').find('#totalmrp').text();
            var oobj =[];
            var obj;
            var product=[];
            var person ;
            var customer;
            var qty =[];
            var quantity ={};
            var itemPrice={};
            var remoteControl ={};
            var items
            var totalmrp= $('#frm1').find('#totalmrp').text();
            $('table > tbody  > tr').each(function(index, tr)
            {
                  var quantity= $(this).find('td [name=quantity]').val();
                  var prod = $(this).find('td [name=pid]').text();
                  var cid = $(this).find('td [name=cid]').text();
                  var orderDate = new Date();
                  var cartid = $(this).find('td [name=cartid]').text();
                  var prd = prod; //,productName,productCategory,productPrice];
                   var pval= ["productId"];
                    const farr = new Map();
                                       for(i = 0 ; i < pval.length  ; i++)      //"product":[{"productId":57}], - required
                                          {
                                               farr.set(pval[i], prd);     //"product":{"productId":["57"]},
                                          }
                     var productc = Object.fromEntries(farr);
                     product.push(productc);

                     qty.push(quantity);
                     jsndata= JSON.stringify(qty);

                     cart={cartId,qty, finalprice};

                      var cval= "custId";
                      customer = {'custId': cid};
                   person = {
                         orderDate,
                         quantity,
                         product,
                         customer,
                         totalmrp
                  };
                  //oobj.push(person);

            });
                   //const mapObj1 = Object.fromEntries(oobj);
                 var arr=[];
                for (var i = 0; i < oobj.length; i++) {
                   arr.push(oobj[i]);
                 }
                  //obj= JSON.stringify(arr);

                 // var arr1 = "orders";
                 // var s = ['orderDate','quantity','product','customer'];
                  const farr = new Map();
                 // for(j=0; j < oobj.length; j++) // 4
                //  {
                   // for(i = 0 ; i < arr1.length  ; i++)
                    //   {
                     //       farr.set(arr1, oobj[j]);
                     //  }
                // }
                // const mapObj = Object.fromEntries(farr);
                  jsndata= JSON.stringify(person);
                  console.log(jsndata);
                    //'{"orders":[{"orderDate":"2022-07-27T17:17:34.625Z","quantity":"1","product":"57","customer":"1"},{"orderDate":"2022-07-27T17:17:39.466Z","quantity":"2","product":"56","customer":"1"}]}'
                    //'{"productId":"56","productName":"dvds","productCategory":"fgd","productPrice":"444"}'
                    // {productName: 'rice', productCategory: 'food', productPrice: '12'}
                             $.ajax({
                                   url: 'http://localhost:8081/createOrder', // url where to submit the request
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
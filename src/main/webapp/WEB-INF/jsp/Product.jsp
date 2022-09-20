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
           <title>DataTables - JS Bin</title>
           <style>
           body {
           //  font: 90%/1.45em "Helvetica Neue", HelveticaNeue, Verdana, Arial, Helvetica, sans-serif;
           font-family: arial, sans-serif;
             margin: 0;
             padding: 0;
             color: black;
              background: rgb(238,174,202);
              background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,183,233,1) 100%);
           }
           button.dt-button, div.dt-button, a.dt-button{
           color: black;
           background-image: linear-gradient(10deg, #03bbf4, #0503f4);
           box-sizing: content-box;
             padding: 15px 32px;
             text-align: center;
             text-decoration: none;
             display: inline-block;
             font-size: 16px;
             margin: 4px 2px;
             border-radius: 12px;
           }
    button.dt-button.disabled, div.dt-button.disabled, a.dt-button.disabled{
     background-image: linear-gradient(10deg, #03bbf4, #0503f4);
     box-sizing: content-box;
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

  <table id="example" class="display nowrap" width="100%">
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
                          <td >${product.productId} </td>
                          <td>${product.productName}</td>
                          <td>${product.productCategory}</td>
                          <td>${product.productPrice}</td>
                      </tr>
                  </c:forEach>
              </tbody>
          </table>
</body>
<script>
 var jsndata =null;
  var dataObject = null;
 var arr2 =null;
             $(document).ready(function () {
                 var table = $('#example').DataTable({
                     buttons: [{
                       text: "Edit", class :"excelButton",
                         extend: "selectedSingle",
                         action: function (e, dt, bt, config) { editRow(e, dt, bt, config); }
                     }, {
                         text: "Save",
                         extend: "selectedSingle",
                         action: function (e, dt, bt, config) { saveRow(e, dt, bt, config); }
                     }, {
                         text: "Add",
                         action: function (e, dt, bt, config) { addRow(e, dt, bt, config); }
                     }, {
                         text: "Delete",
                         extend: "selectedSingle",
                         action: function (e, dt, bt, config) { removeRow(e, dt, bt, config); }
                     }],
                     dom: "Btp",
                     select: "multi"
                 });

                 var dataObject = table.rows().data();

                 // keep the rows from deselection when you click on a textbox
                 // this means you have to click between textboxes to change edit rows when more than one is onpen
                 $("#example").on("click", "input", function (e) { e.stopPropagation(); return false; });

                 table.on('user-select', function (e, dt, type, cell, originalEvent) {

                     e.targetObject = originalEvent.target;
                     if ($('#example input').length > 0) {
                         e.preventDefault();
                         return false;
                     }
                 });
                             table.on('select', function (e, dt, type, cell, originalEvent) {


                     if ($('#example input').length > 0) {
                         e.preventDefault();
                         return false;
                     }
                 });
             });

             // Adds a new row in edit mode
             function addRow(e, dt, bt, config) {
                 if ($('#example input').length > 0) {
                     // only one row is allowed to be in edit mode at a time
                     return false;
                 }
                 var $nr = dt.row.add(["", "", "", "", "", ""]).draw(false).nodes().to$();
               $nr.addClass("newRow");
                 dt.rows($nr).select();
                 $nr.children("td").each(function (i, it) {
                     $(it).append("<input type='text'>");
                 });
               $(".editButton span").text("Cancel");
               // Puts
               dt.page("first").draw();
             }

              function removeRow(e, dt, bt, config){
                   var r = dt.rows(".selected").nodes()[0];
                var productId = $("td:first", r).text();
                if(!confirm("You are about to remove " + productId)){return;}
                 dt.rows(".selected").remove().draw();
                                  $.ajax({
                                     url: 'http://localhost:8081/deleteProduct', // url where to submit the request
                                     type : "DELETE", // type of action POST || GET
                                     data : {
                                                  productId
                                             },
                                     success : function(data) {
                                     console.log(data);
                                     },
                                     error: function(xhr, resp, text) {
                                         console.log(xhr, resp, text);
                                      }
                                    });
              }

             // Save the selected row (assuming its in edit mode)
             function saveRow(e, dt, bt, config) {
                 var r = dt.rows(".selected").nodes()[0];

                 // if row is not edit mode, just return.
                 if ($("input", r).length === 0) { return; }


                 var d = dt.rows(".selected").data()[0];
                 var containsText = false;
                  var arr1 = ['productId','productName', 'productCategory','productPrice'];
                 $(r).children("td").each(function (i, it) {
                     var di = $("input", it).val();
                        arr2 = arr1.reduce((obj, arrValue) => (obj[arrValue] = di, obj), {});
                     console.log("di"+ di);
                     if (di.length > 0) { containsText = true; }
                     $(it).html(di);
                     d[i] = di;
 });

const farr = new Map();

// Set Map Values
for(i = 0 ; i < arr1.length  ; i++){
farr.set(arr1[i], d[i]);
}
                console.log(farr);
                const mapObj = Object.fromEntries(farr);
                 jsndata= JSON.stringify(mapObj);
                 console.log(jsndata);
                 $.ajax({
                    url: 'http://localhost:8081/updateProduct', // url where to submit the request
                    type : "PUT", // type of action POST || GET
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
                 if (!containsText) {
                     alert("This row contains no data and will be removed");
                     dt.rows(".selected").remove().draw();
                 }
               $(".editButton span").text("Edit");
             }

             // Puts a row in edit mode
             function editRow(e, dt, bt, config) {
                var r = dt.rows(".selected").nodes()[0];
              if(  $("span", bt[0]).text() == "Cancel"){

                if($(r).hasClass("newRow")){
                   dt.rows(".selected").remove().draw();
                }
                else {
                $(r).children("td").each(function (i, it) {
                     var od = dt.cells(it).data();
                     $(it).html(od[0]);
                 });
                }

                $("span", bt[0]).text("Edit");
                return;
              }

                 // if row already in edit mode, just return.
                 if ($("input", r).length > 0) { return; }

                 $(r).children("td").each(function (i, it) {
                     var h = $("<input type='text'>");
                     h.val(it.innerText);
                     $(it).html(h);
                 });
               $("span", bt[0]).text("Cancel");
             }


</script>

</html>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<head>
<title>First Web Application</title>

  <link href="<c:url value="/css/button.css"/>" rel="stylesheet" type="text/css">

      <style>
      body{
        background: rgb(238,174,202);
        background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,183,233,1) 100%);
      }
      </style>
</head>


<body>
<form action ="listProducts" method="get">
<button class="button button1" value="product">Product</button>
</form>
<form action ="orders" method="get">
<button class="button button2" name="order">Order</button>
</form>
<button class="button button1" formaction="/customers/">Customer</button>
</form>
</body>
</html>
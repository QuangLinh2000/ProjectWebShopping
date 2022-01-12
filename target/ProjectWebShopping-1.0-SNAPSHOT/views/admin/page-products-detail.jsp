<%@ page import="com.example.projectwebshopping.dto.client.DetailProduct" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DetailProduct detailProduct = (DetailProduct) request.getAttribute("detailProduct");
    Product product = detailProduct.getProduct();
    System.out.println(product);
%>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>

</body>
</html>

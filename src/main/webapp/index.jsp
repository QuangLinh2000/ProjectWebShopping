<%@ page import="com.example.projectwebshopping.service.client.IHomeService" %>
<%@ page import="com.example.projectwebshopping.service.client.HomeSerVice" %>
<%@ page import="com.example.projectwebshopping.model.client.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.projectwebshopping.model.client.User" %>
<%@ page import="com.example.projectwebshopping.dao.client.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
    <title>Document</title>
    <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/assets/fontawesome-free-6.0.0-beta3-web/css/all.css" rel="stylesheet" />
    <%--    link notify--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/notify/simple-notify.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
    <% IHomeService iHomeService = new HomeSerVice();
        request.setAttribute("listLoaiSP", iHomeService.getAllLoaiSP());%>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%if (request.getAttribute("container_view") != null) {%>
<jsp:include page="${container_view}"></jsp:include>

<%
} else {
%>

<%}%>
<jsp:include page="footer.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/assets/notify/simple-notify.min.js"></script>
<script src="<%=request.getContextPath()%>/script/header.js"></script>

</body>
 <script>
     <%
     int quantity = 0;
     User user = (User) request.getSession().getAttribute("user");
     Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");

     if (user == null) {
     if (cartMap == null) {
         cartMap = new HashMap<>();
     }
             quantity = 0;
            for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
                quantity += entry.getValue().getQuantity();
            }


     %>
     $('.cart-count.color-red').text('<%=quantity%>');
     <%}
     %>

 </script>
</html>
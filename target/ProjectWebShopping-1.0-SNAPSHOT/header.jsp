<%@ page import="com.example.projectwebshopping.service.client.IHomeService" %>
<%@ page import="com.example.projectwebshopping.service.client.HomeSerVice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% IHomeService iHomeService = new HomeSerVice();
    List<LoaiSP> listLoaiSP = (List<LoaiSP>) request.getAttribute("listLoaiSP");
%>
<header id="header" class="header-signin-sigup">
    <div id="header-first">
        <div class="container">
            <div class="header-top">
                <div class="header-search" id="input-group-header">
                    <input id="searchtext" onkeyup="" name="q" value="" maxlength="40" class="input-search" type="text"
                           size="20" placeholder="Tìm kiếm ...." autocomplete="off">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                </div>
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="/Shopping/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                         alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>

                <div class="header-top-list">
                    <div class="nav-item">
                        <a class="nav-link btn-icon" href="#"> <i class="fa-regular fa-bell icon-header"></i></a>
                    </div>
                    <div>
                        <a href="#">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Giỏ hàng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <%
                        String username = (String) session.getAttribute("isusername");
                        if (username == null) {
                    %>
                    <div class="btn-signup">
                        <a href="<%=request.getContextPath()%>/signin" id="login-a" class="color-red">Đăng nhập </a>
                        <a href="<%=request.getContextPath()%>/signup">/ Đăng ký</a>
                    </div>
                    <%} else {%>
                    <div class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#">
                            <img class="img-xs rounded-circle"
                                 src="<%=request.getContextPath()%>/img/avatar.png" alt="User">
                            <i class="fa-solid fa-caret-down "></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" id="drop-top">
                            <a class="dropdown-item" href="page-seller-detail.html">Tài khoản</a>
                            <a class="dropdown-item" href="page-settings-1.html">Giỏ hàng</a>
                            <a class="dropdown-item text-danger" href="#">Đăng xuất</a>
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
            <nav class="nav-bar">
                <ul class="nav-list">
                    <%

                        for (int i = 0; i < listLoaiSP.size(); i++) {
                            LoaiSP loaiSP = listLoaiSP.get(i);%>
                    <li class="nav-item">
                        <a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=4&name=<%=loaiSP.getTenLoai()%>" class="text-hover text-hover-underline-goes-right">
                            <span><%=loaiSP.getTenLoai()%></span>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 0));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 1));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 2));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 3));%>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">

                            <ul class="list-sub">
                                <li class="item-sub-nav " stt="0"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=0&name=<%=loaiSP.getTenLoai()%>"
                                                                     class="text-hover text-hover-underline-goes-right active">Sản
                                    phẩm nổi bật</a></li>
                                <li class="item-sub-nav " stt="1"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                                                     class="text-hover text-hover-underline-goes-right ">Sản
                                    phẩm mới</a></li>
                                <li class="item-sub-nav " stt="2"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                                                     class="text-hover text-hover-underline-goes-right ">Best
                                    seller</a></li>
                                <li class="item-sub-nav " stt="3"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                                                     class="text-hover text-hover-underline-goes-right ">Khuyến
                                    mãi</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <%List<List<Product>> loaiSPS = loaiSP.getListProduct();%>
                                <%for (int j = 0; j < loaiSPS.size(); j++) {%>
                                <%List<Product> product = loaiSPS.get(j);
                               %>
                                <%for (int k = 0; k < product.size(); k++) {%>
                                <%if(j == 0){%>
                                <div class="sub-nav-img item<%=j%> active">
                                    <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                         alt="">
                                </div>
                                <%}else{%>
                                <div class="sub-nav-img item<%=j%>">
                                    <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                         alt="">
                                </div>
                                <%}%>

                                <%}%>

                                <%}%>
                                <%%>

                            </div>
                        </div>
                    </li>

                    <%}%>

                </ul>
            </nav>
        </div>
    </div>

    <div id="header-scroll">
        <div class="container">
            <div class="header-top">
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="/Shopping/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                         alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>
                <nav class="nav-bar">
                    <ul class="nav-list">
                        <%

                            for (int i = 0; i < listLoaiSP.size(); i++) {
                                LoaiSP loaiSP = listLoaiSP.get(i);%>
                        <li class="nav-item">
                            <a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=4&name=<%=loaiSP.getTenLoai()%>" class="text-hover text-hover-underline-goes-right">
                                <span><%=loaiSP.getTenLoai()%></span>
                                <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 0));%>
                                <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 1));%>
                                <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 2));%>
                                <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 3));%>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">

                                <ul class="list-sub">
                                    <li class="item-sub-nav " stt="0"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=0&name=<%=loaiSP.getTenLoai()%>"
                                                                         class="text-hover text-hover-underline-goes-right active">Sản
                                        phẩm nổi bật</a></li>
                                    <li class="item-sub-nav " stt="1"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                                                         class="text-hover text-hover-underline-goes-right ">Sản
                                        phẩm mới</a></li>
                                    <li class="item-sub-nav " stt="2"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                                                         class="text-hover text-hover-underline-goes-right ">Best
                                        seller</a></li>
                                    <li class="item-sub-nav " stt="3"><a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                                                         class="text-hover text-hover-underline-goes-right ">Khuyến
                                        mãi</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <%List<List<Product>> loaiSPS = loaiSP.getListProduct();%>
                                    <%for (int j = 0; j < loaiSPS.size(); j++) {%>
                                    <%List<Product> product = loaiSPS.get(j);
                                    %>
                                    <%for (int k = 0; k < product.size(); k++) {%>
                                    <%if(j == 0){%>
                                    <div class="sub-nav-img item<%=j%> active">
                                        <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                             alt="">
                                    </div>
                                    <%}else{%>
                                    <div class="sub-nav-img item<%=j%>">
                                        <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                             alt="">
                                    </div>
                                    <%}%>

                                    <%}%>

                                    <%}%>
                                    <%%>

                                </div>
                            </div>
                        </li>

                        <%}%>

                    </ul>
                </nav>
                <div class="header-top-list">
                    <div>
                        <i class="fa-solid fa-magnifying-glass search-icon"></i>
                    </div>
                    <div>
                        <a href="#">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Giỏ hàng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <%
                        if (username != null) {
                    %>
                    <div class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="img-xs rounded-circle"
                                 src="<%=request.getContextPath()%>/img/avatar.png" alt="User">
                            <i class="fa-solid fa-caret-down "></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" class="drop-top">
                            <a class="dropdown-item" href="page-seller-detail.html">Tài khoản</a>
                            <a class="dropdown-item" href="page-settings-1.html">Giỏ hàng</a>
                            <a class="dropdown-item text-danger" href="#">Đăng xuất</a>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    <div id="header-mobile">
        <div class="container">
            <div class="header-top">
                <div id="btn-bar-header">
                    <i class="fa-solid fa-bars-staggered icon-header icon-nav "></i>

                </div>
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="/Shopping/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                         alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>
                <nav class="nav-bar" id="nav-bar-active">
                    <div id="icon-close">
                        <i class="fa-solid fa-xmark icon-nav"></i>
                    </div>
                    <ul class="nav-list">
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="/Shopping/home" class="text-hover text-hover-underline-goes-right">
                                    <span>Trang chủ</span>
                                </a>
                            </div>
                        </li>
                        <c:forEach var="p" items="${listLoaiSP}">
                            <li class="nav-item">
                                <div class="nav-item-warper">
                                    <a href="/Shopping/search?id=${p.getMaLoai()}&slt=4&name=${p.getTenLoai()}" class="text-hover text-hover-underline-goes-right">
                                        <span>${p.tenLoai}</span>
                                    </a>
                                </div>
                            </li>
                        </c:forEach>
                        <%
                            if (username == null) {
                        %>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/signin" class="text-hover text-hover-underline-goes-right">
                                    <span>Đăng nhập</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/signup" class="text-hover text-hover-underline-goes-right">
                                    <span>Đăng ký</span>
                                </a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account" class="text-hover text-hover-underline-goes-right">
                                    <span>Tài khoản</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account" class="text-hover text-hover-underline-goes-right">
                                    <span>Thông báo</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Đăng xuất</span>
                                </a>
                            </div>
                        </li>
                        <%}%>

                    </ul>
                </nav>
                <div class="header-top-list">

                    <div>
                        <a href="#" class="btn-cart">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            <span class="cart-count color-red">0</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

<%--scroll top--%>
<a href="#" class="scrollup show-scroll" id="scroll-up">
    <i class="fa-solid fa-arrow-up"></i>
</a>

<script>
    $(".item-sub-nav").hover(function () {
        $(this).closest(".nav-item").find(".sub-nav-img").removeClass("active");
        $(this).closest(".nav-item").find(".text-hover").removeClass("active");
        //get attr
        var attr = $(this).attr("stt");
        //add class active
        $(this).closest(".nav-item").find(".item"+attr).addClass("active");
    }, function () {
        $(this).find(".text-hover").addClass("active");

    });
</script>
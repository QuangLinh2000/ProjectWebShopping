<%@ page import="com.example.projectwebshopping.service.client.IHomeService" %>
<%@ page import="com.example.projectwebshopping.service.client.HomeSerVice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %>
<%@ page import="com.example.projectwebshopping.model.client.User" %>
<%@ page import="com.example.projectwebshopping.model.client.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.projectwebshopping.dao.client.CartDao" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
    //get cookie


%>
<%
    int quantity = 0;
    User user = (User) request.getSession().getAttribute("userLognin");
    Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
    String userID="";
    if (user == null) {
        if (cartMap == null) {
            cartMap = new HashMap<>();
        }
        quantity = 0;
        for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
            quantity += entry.getValue().getQuantity();
        }
    } else {
        quantity = CartDao.getInstance().getSizeCart(user.getId());
        userID=user.getId();
    }
%>
<div class="comment">
    <form action="<%=request.getContextPath()%>/review" id="comment-dialog" method="post" enctype="multipart/form-data">
        <div class="comment-header">
            <h3 class="comment-header-title">Hộp Thoại Góp Ý</h3>
            <div class="comment-close"></div>
        </div>
        <div class="comment-body">
            <label for="comment-content">Vui lòng điền nhận xét của bạn :</label>
            <textarea name="comment-content" id="comment-content" cols="40" rows="6" ></textarea>
            <div class="comment-image">
                <label for="comment-image-input" class="btn btn-primary mt-3" id="label-comment-image">
                    <i class="material-icons fas fa-plus"></i>
                </label>
                <input  name="comment-image-input" class="d-none" id="comment-image-input" type="file" required accept="image/*" >
                <div id="comment-image-col" class="row gx-3 row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-xl-2 row-cols-xxl-2">
                </div>
            </div>
        </div>
        <div class="comment-footer">
            <h6 class="comment-footer-title">
                Nếu bạn có ý tưởng để cải thiện sản phẩm thì hãy cho chúng tôi biết nhé. Còn nếu cần trợ giúp để khắc phục vấn đề cụ thể, hãy truy cập <a href="<%=request.getContextPath()%>/term?index=1" style="color: rgb(0, 68, 255);">Trung tâm trợ giúp</a>.
            </h6>
            <div class="comment-footer-button">
                <div class="btn btn-light btn-cancel" style="margin-right: 10px;">Hủy</div>
                <div class="btn btn-primary btn-submit">GỬI</div>
            </div>
        </div>
    </form>
</div>
<header id="header" class="header-signin-sigup">
    <div id="header-first">
        <div class="container">
            <div class="header-top">
                <div class="header-search" id="input-group-header">
                    <input id="searchtext" name="q" value="" maxlength="40" class="input-search" type="text"
                           size="20" placeholder="Tìm kiếm ...." autocomplete="off">
                    <i class="fa-solid fa-magnifying-glass search-icon" onclick="redirectSearch(this)"></i>
                    <div class="wrapper-search box-shadow " id="wrapper-search1">

                    </div>
                </div>
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="/Shopping/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                                      alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>

                <div class="header-top-list">

                    <!--Icon chuông-->
                    <div class="nav-item nav-notify">
                        <i class="fa-regular fa-bell icon-header"></i>
                        <div class="nofification" id="nofification-1">
                            <div class="notify-header">
                                <div class="notify-title">
                                    <h4>Thông Báo</h4>
                                </div>
                                <div class="notify-filter">
                                    <a href="" class="notify-all">Tất Cả</a>
                                    <a href="" class="notify-orders">Đơn Hàng</a>
                                    <a href="" class="notify-sale">Khuyến Mãi</a>
                                    <a href="" class="notify-system">Hệ Thống</a>
                                </div>
                            </div>
                            <div class="notifys">
                                <!--Thông báo 1-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 2-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 3-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 4-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 5-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                            </div>
                            <a href="" class="link_all_noti">Xem tất cả</a>
                        </div>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/cart">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Giỏ hàng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <%
                        if (user == null) {
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
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/account">Tài khoản</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/cart">Giỏ hàng</a>
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
                        <a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=4&name=<%=loaiSP.getTenLoai()%>"
                           class="text-hover text-hover-underline-goes-right">
                            <span><%=loaiSP.getTenLoai()%></span>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 0));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 1));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 2));%>
                            <%loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 3));%>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">

                            <ul class="list-sub">
                                <li class="item-sub-nav " stt="0"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=0&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right active">Sản
                                    phẩm nổi bật</a></li>
                                <li class="item-sub-nav " stt="1"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">Sản
                                    phẩm mới</a></li>
                                <li class="item-sub-nav " stt="2"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">Best
                                    seller</a></li>
                                <li class="item-sub-nav " stt="3"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">Khuyến
                                    mãi</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <%List<List<Product>> loaiSPS = loaiSP.getListProduct();%>
                                <%for (int j = 0; j < loaiSPS.size(); j++) {%>
                                <%
                                    List<Product> product = loaiSPS.get(j);
                                %>
                                <%for (int k = 0; k < product.size(); k++) {%>
                                <%if (j == 0) {%>
                                <div class="sub-nav-img item<%=j%> active">
                                    <a href="/Shopping/detail?id=<%=product.get(k).getMaSP()%>">
                                        <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                             alt="">
                                    </a>
                                </div>
                                <%} else {%>
                                <div class="sub-nav-img item<%=j%>">

                                    <a href="/Shopping/detail?id=<%=product.get(k).getMaSP()%>">
                                        <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                             alt="">
                                    </a>
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
                            <a href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=4&name=<%=loaiSP.getTenLoai()%>"
                               class="text-hover text-hover-underline-goes-right">
                                <span><%=loaiSP.getTenLoai()%></span>
                                <%
                                    loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 0));%>
                                <%
                                    loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 1));%>
                                <%
                                    loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 2));%>
                                <%
                                    loaiSP.getListProduct().add(iHomeService.getSanPhamHeader(loaiSP.getMaLoai(), 3, 3));%>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">

                                <ul class="list-sub">
                                    <li class="item-sub-nav " stt="0"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=0&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right active">Sản
                                        phẩm nổi bật</a></li>
                                    <li class="item-sub-nav " stt="1"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">Sản
                                        phẩm mới</a></li>
                                    <li class="item-sub-nav " stt="2"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">Best
                                        seller</a></li>
                                    <li class="item-sub-nav " stt="3"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">Khuyến
                                        mãi</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <%List<List<Product>> loaiSPS = loaiSP.getListProduct();%>
                                    <%for (int j = 0; j < loaiSPS.size(); j++) {%>
                                    <%
                                        List<Product> product = loaiSPS.get(j);
                                    %>
                                    <%for (int k = 0; k < product.size(); k++) {%>
                                    <%if (j == 0) {%>
                                    <div class="sub-nav-img item<%=j%> active">

                                        <a href="/Shopping/detail?id=<%=product.get(k).getMaSP()%>">
                                            <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                                 alt="">
                                        </a>
                                    </div>
                                    <%} else {%>
                                    <div class="sub-nav-img item<%=j%>">
                                        <a href="/Shopping/detail?id=<%=product.get(k).getMaSP()%>">
                                            <img src="<%=request.getContextPath()%><%=product.get(k).getListUrlImg().get(0)%>"
                                                 alt="">
                                        </a>
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
                <div class="header-top-list nav-notify">
                    <div class="nav-item nav-notify">
                        <i class="fa-regular fa-bell icon-header"></i>
                        <div class="nofification" id="nofification-2">
                            <div class="notify-header">
                                <div class="notify-title">
                                    <h4>Thông Báo</h4>
                                </div>
                                <div class="notify-filter">
                                    <a href="" class="notify-all">Tất Cả</a>
                                    <a href="" class="notify-orders">Đơn Hàng</a>
                                    <a href="" class="notify-sale">Khuyến Mãi</a>
                                    <a href="" class="notify-system">Hệ Thống</a>
                                </div>
                            </div>
                            <div class="notifys">
                                <!--Thông báo 1-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 2-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 3-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 4-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Thông báo 5-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Giảm Giá Lớn !</p>
                                        <p class="notify-content">Sản phẩm Áo Dài Phối Hoa DH1234 đang giảm chỉ còn 1,000,000đ</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                            </div>
                            <a href="" class="link_all_noti">Xem tất cả</a>
                        </div>
                    </div>
                    <div id="search-scroll">
                        <i class="fa-solid fa-magnifying-glass search-icon" id="toogle-search"></i>
                        <div class="header-search" id="input-group-scroll">
                            <input id="searchtext2" name="q" value="" maxlength="40" class="input-search" type="text" size="20"
                                   placeholder="Tìm kiếm ...." autocomplete="off">
                            <i class="fa-solid fa-magnifying-glass search-icon" onclick="redirectSearch(this)"></i>
                            <div class="wrapper-search box-shadow " id="wrapper-search2">

                            </div>
                        </div>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/cart">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Giỏ hàng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <%
                        if (user != null) {
                    %>
                    <div class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="img-xs rounded-circle"
                                 src="<%=request.getContextPath()%>/img/avatar.png" alt="User">
                            <i class="fa-solid fa-caret-down "></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" class="drop-top">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/account">Tài khoản</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/cart">Giỏ hàng</a>
                            <a class="dropdown-item text-danger">Đăng xuất</a>
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
                                    <a href="/Shopping/search?id=${p.getMaLoai()}&slt=4&name=${p.getTenLoai()}"
                                       class="text-hover text-hover-underline-goes-right">
                                        <span>${p.tenLoai}</span>
                                    </a>
                                </div>
                            </li>
                        </c:forEach>
                        <%
                            if (user == null) {
                        %>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/signin"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>Đăng nhập</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/signup"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>Đăng ký</span>
                                </a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>Tài khoản</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account"
                                   class="text-hover text-hover-underline-goes-right">
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
                        <a href="<%=request.getContextPath()%>/cart" class="btn-cart">
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
        $(this).closest(".nav-item").find(".item" + attr).addClass("active");
    }, function () {
        $(this).find(".text-hover").addClass("active");

    });
    $('.cart-count.color-red').text(<%=quantity%>);

    //click dropdown-item text-danger
    $(".dropdown-item.text-danger").click(function () {
        //set attr
        //ajax sign out
        $.ajax({
            url: "<%=request.getContextPath()%>/signout",
            type: "POST",
            data: {
                "signout": "signout"
            },
            success: function (data) {
                //set attr
                $(".dropdown-item.text-danger").attr("href", "<%=request.getContextPath()%>/signin");
                //set text

            }
        });
    });
// bật tắt thông báo
    let notifycations=$('.nofification');
    let notifyButton=$('.fa-regular.fa-bell');
    $('#header-first .fa-regular.fa-bell').click(function (){
        $('#nofification-1').toggleClass('flex');
    });
    $('#header-scroll .fa-regular.fa-bell').click(function (){
        $('#nofification-2').toggleClass('flex');
    });
    $(document).click(function(e){
        if(!notifyButton.is(e.target)&&notifycations.has(e.target).length===0&& !notifycations.is(e.target)){
            notifycations.removeClass('flex')
        }
    })

    // search
    const search1 = document.getElementById('searchtext');
    const wrapperSearch1 = document.getElementById('wrapper-search1');
    search1.addEventListener('keyup', function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            redirectSearch(this);
        }
        if(search1.value.length === 0){
            wrapperSearch1.classList.remove('show');
        }else{
            wrapperSearch2.classList.remove('show');
            wrapperSearch1.classList.add('show');
            searchAjax(search1.value,wrapperSearch1);

        }
        event.preventDefault();

    });

    const search2 = document.getElementById('searchtext2');
    const wrapperSearch2 = document.getElementById('wrapper-search2');
    search2.addEventListener('keyup', function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            redirectSearch(this);
        }
        if (search2.value.length === 0) {
            wrapperSearch2.classList.remove('show');
        } else {
            wrapperSearch1.classList.remove('show');
            wrapperSearch2.classList.add('show');
            searchAjax(search2.value,wrapperSearch2);
        }
    })

    function pushNotify(status, message, title) {
        new Notify({
            status: status,
            title: title,
            text: message,
            effect: 'fade',
            speed: 300,
            customClass: '',
            customIcon: '',
            showIcon: true,
            showCloseButton: true,
            autoclose: true,
            autotimeout: 2000,
            gap: 20,
            distance: 20,
            type: 1,
            position: 'right top',
            customWrapper: '',
        })
    }
    //show comment image
    document.querySelector("#comment-image-input").addEventListener("change", function() {
        var files = this.files;
        var filesArr = Array.prototype.slice.call(files);
        filesArr.forEach(function(f) {
            if (!f.type.match("image.*")) {
                alert("Không phải file ảnh");
                return;
            }
            var reader = new FileReader();
            reader.onload = function(e) {
                var html = "<div class='col'>" +
                    "<div class='card card-product-grid'>" +
                    "<img src='" + e.target.result + "' class='card-img img-thumbnail' alt='...'>" +
                    "<input class='d-none' id='file-image-" + files.length + "' type='file' accept='image/*' />" +
                    "<div class='info-wrap'>" +
                    "<a href='#' class='title text-truncate'>" + f.name + "</a>" +
                    "<div id='delete-comment-image' class='btn btn-sm btn-outline-danger mt-0'>" +
                    "Xóa" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
                $('#comment-image-col').html(html);

            }
            reader.readAsDataURL(f);

        });
        if(filesArr.length>0){
            $("#label-comment-image").addClass("d-none")
        }
    });
    //click button "Xoa" in comment form to delete image anh show plus icon
    $("#delete-comment-image").click(function (){
        $('#comment-image-col').html("");
        $("#label-comment-image").removeClass("d-none")
    })
    //send comment
    //click when push button "Gui"
    $("#comment-dialog").submit(function (e){
        e.stopPropagation()
    })
    $(".btn-submit").click(function (){

        if(<%=user==null%>){
            pushNotify("error","Opps ! Vui lòng đăng nhập để tiếp tục.","Góp Ý́")
        }
        else {

            var commentForm= new FormData(document.getElementById("comment-dialog"));
            var userID="<%=userID%>"
            commentForm.append("idUser",userID)
            commentForm.append("comment-content",$("#comment-content").val())
            $.ajax({
                url: "<%=request.getContextPath()%>/review",
                type: "POST",
                data: commentForm,
                contentType: false,
                processData: false,
                success: function (data) {
                    //set attr
                    if(data=="success") {
                        pushNotify('success', 'Góp ý thành công. THANKS !', 'Nhận Xét');
                    }else if(data="lack"){
                        pushNotify('error', 'Vui lòng cung cấp đủ lời nhận xét và hình ảnh.', 'Nhận Xét');
                    }
                    else{
                        pushNotify('error', 'Góp ý thất bại.', 'Nhận Xét');
                    }
                },
                error: function(){
                    pushNotify('error', 'Góp ý thất bại.', 'Nhận Xét');
                }
            });
        }
    })
    });

    document.getElementById('toogle-search').addEventListener('click', function (event) {
        document.getElementById('input-group-scroll').classList.toggle('show');
    });
    // outclick div inputGroupHeader
    document.addEventListener('click', function (event) {
        if (event.target.closest('#input-group-header') === null) {
            wrapperSearch1.classList.remove('show');
        }
        if (event.target.closest('#input-group-scroll') === null) {
            wrapperSearch2.classList.remove('show');
        }
    });


    var req = null;

    function searchAjax(value,element) {
        if (req != null) req.abort();
        req = $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/searchAjax",
            data: {'txtSearch' : value, 'type' : 'SEARCHICON'},
            dataType: "text",
            success: function(msg){
                let data = JSON.parse(msg);
                let countSearch = data.count;
                let html = '';
                if (countSearch>0){
                    html += '<div class="search_prod_title">';
                    html += '<span class="left">Sản phẩm</span>';
                    html += '<a id="view_article" href="#" class="left">Xem thêm('+countSearch+')</a>';
                    html += '</div>';
                    html += '<ul class="list-search">';
                    let list =data.data;
                    for (let i = 0; i < list.length; i++) {
                        let gia = parseInt(list[i].gia);
                        let sale = parseFloat(list[i].sell);
                        html += '<li class="search-items">' +

                            '<div class="search-items-left">' +
                            '<a href="<%=request.getContextPath()%>/detail?id='+list[i].maSP+'" class="item-search-img">' +
                            '<img src="<%=request.getContextPath()%>/' + list[i].listUrlImg[0] + '" alt="">' +
                            '</a>' +
                            '</div>' +

                            '<div class="search-item-right">' +
                            '<a href="<%=request.getContextPath()%>/detail?id='+list[i].maSP+'">' +
                            '<h3 class="item-search-title text-one-line">' + list[i].tenSP + '</h3>' +

                            '<div class="search-item-wrap-price">';
                        sale = Math.ceil(gia*(1-sale));
                        html +='<span class="sale-price">' + formatPriceHome(sale) + 'đ</span>' ;
                        html += '</div>' +
                            '</a>'+
                            '</div>' +
                            '</li>';
                    }
                    html += '</ul>';
                }else {
                    html= "<h4 style='text-align: center;'>Không có sản phẩm phù hợp"+value+"</h4>";
                }
                element.innerHTML =html;
            }
        });
    }
    //function format price vietnamese
    function formatPriceHome(price){
        let priceFormat = price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return priceFormat;
    }
    function redirectSearch(ele){
        let par = ele.closest('.header-search');
        // select input type text
        let input = par.querySelector('input[type="text"]');
        let keyword = input.value;
        if(keyword.length == 0){
            pushNotify('warning','Vui lòng nhập từ khóa','Tìm kiếm');
        }else {
            window.location.href = '<%=request.getContextPath()%>/searchAjax?txt='+keyword;
        }

    };
</script>
<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
%>
<aside class="navbar-aside" id="offcanvas_aside">
    <div class="aside-top">
        <a href="page-index-1.html" class="brand-wrap">
            <img src="<%=request.getContextPath()%>/admin/images/logo.svg" height="46" class="logo" alt="Ecommerce dashboard template">
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"> <i class="text-muted material-icons md-menu_open"></i> </button>
        </div>
    </div> <!-- aside-top.// -->

    <nav>
        <ul class="menu-aside">
            <li class="menu-item active">
                <a class="menu-link" href="<%=request.getContextPath()%>/admin-dashboard"> <i class="icon material-icons md-home"></i>
                    <span class="text">Bảng điều khiển</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href=""> <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Sản phẩm</span>
                </a>
                <div class="submenu">
                    <a href="<%=request.getContextPath()%>/admin-list-view-product">Xem dạng danh sách</a>
                    <a href="<%=request.getContextPath()%>/admin-products-table">Xem dạng bảng</a>
                    <a href="<%=request.getContextPath()%>/admin-product-gird">Xem dạng lưới</a>
                    <a href="page-categories.html">Thể loại</a>
                    <a href="page-form-product-3.html">Thêm sản phẩm</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-orders-1.html"> <i class="icon material-icons md-shopping_cart"></i>
                    <span class="text">Đơn hàng</span>
                </a>
                <div class="submenu">
                    <a href="page-orders-2.html">Danh sách đơn hàng</a>
                    <a href="page-orders-detail.html">Chi tiết đơn hàng</a>
                </div>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="page-sellers-cards.html"> <i class="icon material-icons md-store"></i>
                    <span class="text">Nhân viên</span>
                </a>
                <div class="submenu">
                    <a href="page-sellers-cards.html">Thẻ nhân viên</a>
                    <a href="page-sellers-list.html">Danh sách nhân viên</a>
                    <a href="page-seller-detail.html">Hồ sơ nhân viên</a>
                    <a href="page-account-register.html">Thêm nhân viên</a>
                </div>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="<%=request.getContextPath()%>/admin-list-view-product"> <i class="icon material-icons md-monetization_on"></i>
                    <span class="text">Giao dịch</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-reviews.html"> <i class="icon material-icons md-comment"></i>
                    <span class="text">Nhận xét</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-brands.html"> <i class="icon material-icons md-stars"></i>
                    <span class="text">Thương hiệu</span> </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" disabled href="#"> <i class="icon material-icons md-pie_chart"></i>
                    <span class="text">Thống kê</span>
                </a>
            </li>
        </ul>
        <hr>
        <ul class="menu-aside">
            <li class="menu-item has-submenu">
                <a class="menu-link" href="#"> <i class="icon material-icons md-settings"></i>
                    <span class="text">Cài đặt</span>
                </a>
                <div class="submenu">
                    <a href="page-settings-1.html">Cài đặt tài khoản</a>
                    <a href="page-settings-2.html">Cài đặt trang web</a>
                </div>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="page-0-blank.html"> <i class="icon material-icons md-local_offer"></i>
                    <span class="text"> Thông tin liên hệ </span>
                </a>
            </li>
        </ul>
        <br>
        <br>
    </nav>
</aside>

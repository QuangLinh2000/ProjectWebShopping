<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 2/11/2022
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="col-lg-3 border-end">
    <nav class="nav nav-pills flex-lg-column mb-4">

        <ul class="menu-aside">
            <li class="menu-item  active">
                <a class="menu-link" href="<%=request.getContextPath()%>/account">
                    <span class="text">Tài khoản của tôi</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" style="cursor: pointer;" >
                    <span class="text">Thông báo</span>
                </a>
                <div class="submenu" style="display: block;">
                    <a href="<%=request.getContextPath()%>/views/notification.jsp">Tất Cả</a>
                    <a href="#">Cập nhật đơn hàng</a>
                    <a href="#">Khuyễn mãi</a>
                    <a href="#">Hệ thống</a>
                </div>
            </li>

            <li class="menu-item ">
                <a class="menu-link" href="<%=request.getContextPath()%>/order?status=all">
                    <span class="text">Đơn mua</span>
                </a>
            </li>
            <li class="menu-item ">
                <a class="menu-link" href="#">
                    <span class="text">Kho voucher</span>
                </a>
            </li>
        </ul>

    </nav>
</aside>

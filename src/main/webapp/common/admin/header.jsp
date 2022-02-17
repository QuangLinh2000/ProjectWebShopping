<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

</style>
<header class="main-header navbar">
    <div class="col-search">
        <form class="searchform">
            <div class="input-group">
                <input list="search_terms" type="text" class="form-control" placeholder="Tìm kiếm...">
                <button class="btn btn-light bg" type="button"> <i class="material-icons md-search"></i> </button>
            </div>
            <datalist id="search_terms">
                <option value="Products">
                <option value="New orders">
                <option value="Apple iphone">
                <option value="Ahmed Hassan">
            </datalist>
        </form>
    </div>
    <div class="col-nav">
        <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"> <i class="md-28 material-icons md-menu"></i> </button>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> <i class="material-icons md-nights_stay"></i> </a>
            </li>
            <li class="nav-item notifications position-relative" id="box">
                <a class="nav-link btn-icon" href="#" id="btn-notify"> <i class="material-icons md-notifications_active"></i> </a>
                <div class="dropdown-menu-custom px-3">
                    <div class="dropdown-header">
                        <h5>Thông báo</h5>
                    </div>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Tất cả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Mới đăt</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Đã giao</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đã huỷ</a>
                        </li>
                    </ul>
                    <div class="dropdown-body">
                        <div class="list-notifications">
                            <div class="list-notifications-item mb-2">
                                <div class="card">
                                    <div class="row g-0 px-4">
                                        <div class="col-md-2 d-flex align-items-center">
                                            <div>
                                                <img src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" class="rounded-circle" alt="..." style="width: 60px;">
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body py-0 ps-3">
                                                <h5 class="card-title mb-0 text-left">Đơn hàng </h5>
                                                <small class="text-muted text-right">25/11/2001</small>
                                                <p class="card-text mb-2">Có đơn hàng 1999 cần duyệt</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-notifications-item mb-2">
                                <div class="card">
                                    <div class="row g-0 px-4">
                                        <div class="col-md-2 d-flex align-items-center">
                                            <div>
                                                <img src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" class="rounded-circle" alt="..." style="width: 60px;">
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body py-0 ps-3">
                                                <h5 class="card-title mb-0 text-left">Đơn hàng </h5>
                                                <small class="text-muted text-right">25/11/2001</small>
                                                <p class="card-text mb-2">Có đơn hàng 1999 cần duyệt</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-notifications-item mb-2">
                                <div class="card">
                                    <div class="row g-0 px-4">
                                        <div class="col-md-2 d-flex align-items-center">
                                            <div>
                                                <img src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" class="rounded-circle" alt="..." style="width: 60px;">
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body py-0 ps-3">
                                                <h5 class="card-title mb-0 text-left">Đơn hàng </h5>
                                                <small class="text-muted text-right">25/11/2001</small>
                                                <p class="card-text mb-2">Có đơn hàng 1999 cần duyệt</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-notifications-item mb-2">
                                <div class="card">
                                    <div class="row g-0 px-4">
                                        <div class="col-md-2 d-flex align-items-center">
                                            <div>
                                                <img src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" class="rounded-circle" alt="..." style="width: 60px;">
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body py-0 ps-3">
                                                <h5 class="card-title mb-0 text-left">Đơn hàng </h5>
                                                <small class="text-muted text-right">25/11/2001</small>
                                                <p class="card-text mb-2">Có đơn hàng 1999 cần duyệt</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <a class="dropdown-header p-1 text-center nav-link" href="#">
                        <h6 class="m-0" >Xem tất cả</h6>
                    </a>
                </div>
            </li>
            <li class="dropdown nav-item">
                <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#"> <img class="img-xs rounded-circle" src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" alt="User"></a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="page-seller-detail.html">Tài khoản</a>
                    <a class="dropdown-item" href="page-settings-1.html">Cài đặt</a>
                    <a class="dropdown-item text-danger" href="#">Đăng xuất</a>
                </div>
            </li>
        </ul>
    </div>
</header>


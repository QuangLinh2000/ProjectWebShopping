<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<header id="header">
    <div id="header-first">
        <div class="container">
            <div class="header-top">
                <div class="header-search" id="input-group-header">
                    <input id="searchtext" onkeyup="" name="q" value="" maxlength="40" class="input-search" type="text" size="20" placeholder="Tìm kiếm ...." autocomplete="off">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                </div>
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="#"><img src="<%=request.getContextPath()%>/img/logo.png" alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>
                <div class="header-top-list">
                    <div>
                        <a href="#">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Giỏ hàng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <div class="btn-signup">
                        <a href="./signinvssignup.html" id="login-a" class="color-red">Đăng nhập </a>
                        <a href="./signinvssignup.html">/ Đăng ký</a>
                    </div>
                    <div class="nav-item">
                        <a class="nav-link btn-icon" href="#"> <i class="material-icons md-notifications_active"></i> </a>
                    </div>
                    <div class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#"> <img class="img-xs rounded-circle"
                                src="../admin/images/people/avatar1.jpg" alt="User"></a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item" href="page-seller-detail.html">Tài khoản</a>
                            <a class="dropdown-item" href="page-settings-1.html">Giỏ hàng</a>
                            <a class="dropdown-item text-danger" href="#">Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="nav-bar">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Hàng mới</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Đầm</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Áo</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Quần</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Juyp</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Jumpsuit</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-hover text-hover-underline-goes-right">
                            <span>Sale</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                        <div class="sub-nav">
                            <ul class="list-sub">
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                            </ul>
                            <div class="sub-nav-left">
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                                <div class="sub-nav-img">
                                    <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
            </nav>
        </div>
    </div>

    <div id="header-scroll">
        <div class="container">
            <div class="header-top">
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="#"><img src="<%=request.getContextPath()%>/img/logo.png" alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
                    </h1>
                </div>
                <nav class="nav-bar">
                    <ul class="nav-list">
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Hàng mới</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Đầm</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Áo</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Quần</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Juyp</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Jumpsuit</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="text-hover text-hover-underline-goes-right">
                                <span>Sale</span>
                                <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <div class="sub-nav">
                                <ul class="list-sub">
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">giày</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dép</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Dep</a></li>
                                    <li class="item-sub-nav "><a href="#" class="text-hover text-hover-underline-goes-right">Quần áo</a></li>
                                </ul>
                                <div class="sub-nav-left">
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                    <div class="sub-nav-img">
                                        <img src="<%=request.getContextPath()%>/img/subimgtem1.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </li>
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
                        <a href="#"><img src="<%=request.getContextPath()%>/img/logo.png"
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
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Trang chủ</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Sản phẩm mới nhất</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Đầm</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Quần</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Juyp</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Sale</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>Bộ sưu tập</span>
                                </a>
                            </div>
                        </li>
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
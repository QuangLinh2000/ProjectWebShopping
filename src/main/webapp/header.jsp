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
<%@ page import="com.example.projectwebshopping.dao.client.ThongBaoDao" %><%--
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
    //hello

%>
<%
    int quantity = 0;
    User user = (User) request.getSession().getAttribute("userLognin");
    Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");

    int countNotify = 0;

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

        countNotify = ThongBaoDao.getInstance().countNotify(user.getId());
        userID=user.getId();
    }
%>

<header id="header" class="header-signin-sigup">
    <div id="header-first">
        <div class="container">
            <div class="header-top">
                <div class="header-search" id="input-group-header">
                    <input id="searchtext" name="q" value="" maxlength="40" class="input-search" type="text"
                           size="20" placeholder="T??m ki???m ...." autocomplete="off">
                    <i class="fa-solid fa-magnifying-glass search-icon" onclick="redirectSearch(this)"></i>
                    <div class="wrapper-search box-shadow " id="wrapper-search1">

                    </div>
                </div>
                <div class="header-top-wrap-logo">
                    <h1>
                        <a href="/Shopping/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                                      alt="Th???i trang c??ng s??? Seven.AM: V??y ?????m, qu???n ??o, vest n???"></a>
                    </h1>
                </div>

                <div class="header-top-list">

                    <!--Icon chu??ng-->
                    <%if(user != null){%>
                    <div class="nav-item nav-notify">
                        <%if(countNotify > 0){%>
                        <span><%=countNotify%></span>
                        <%}%>
                        <i class="fa-regular fa-bell icon-header"></i>
                        <div class="nofification" id="nofification-1">
                            <div class="notify-header">
                                <div class="notify-title">
                                    <h4>Th??ng Ba??o</h4>
                                </div>
<%--                                <div class="notify-filter">--%>
<%--                                    <a href="" class="notify-all">T????t Ca??</a>--%>
<%--                                    <a href="" class="notify-orders">????n Ha??ng</a>--%>
<%--                                    <a href="" class="notify-sale">Khuy????n Ma??i</a>--%>
<%--                                    <a href="" class="notify-system">H???? Th????ng</a>--%>
<%--                                </div>--%>
                            </div>
                            <div class="notifys">
                                <!--Th??ng ba??o 1-->

                            </div>
                            <a href="" class="link_all_noti">Xem t???t c???</a>
                        </div>
                    </div>
                    <%}%>
                    <div>
                        <a href="<%=request.getContextPath()%>/cart">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Gi??? h??ng(<span class="cart-count color-red">0</span>)
                        </a>
                    </div>
                    <%
                        if (user == null) {
                    %>
                    <div class="btn-signup">
                        <a href="<%=request.getContextPath()%>/signin" id="login-a" class="color-red">????ng nh???p </a>
                        <a href="<%=request.getContextPath()%>/signup">/ ????ng k??</a>
                    </div>
                    <%} else {%>
                    <div class="dropdown nav-item">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#">
                            <img class="img-xs rounded-circle"
                                 src="<%=request.getContextPath()%>/img/avatar.png" alt="User">
                            <i class="fa-solid fa-caret-down "></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" id="drop-top">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/account">T??i kho???n</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/cart">Gi??? h??ng</a>
                            <a class="dropdown-item text-danger" href="#">????ng xu???t</a>
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
                                        class="text-hover text-hover-underline-goes-right active">S???n
                                    ph???m n???i b???t</a></li>
                                <li class="item-sub-nav " stt="1"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">S???n
                                    ph???m m???i</a></li>
                                <li class="item-sub-nav " stt="2"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">Best
                                    seller</a></li>
                                <li class="item-sub-nav " stt="3"><a
                                        href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                        class="text-hover text-hover-underline-goes-right ">Khuy???n
                                    m??i</a></li>
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
                                                      alt="Th???i trang c??ng s??? Seven.AM: V??y ?????m, qu???n ??o, vest n???"></a>
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
                                            class="text-hover text-hover-underline-goes-right active">S???n
                                        ph???m n???i b???t</a></li>
                                    <li class="item-sub-nav " stt="1"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=1&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">S???n
                                        ph???m m???i</a></li>
                                    <li class="item-sub-nav " stt="2"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=2&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">Best
                                        seller</a></li>
                                    <li class="item-sub-nav " stt="3"><a
                                            href="/Shopping/search?id=<%=loaiSP.getMaLoai()%>&slt=3&name=<%=loaiSP.getTenLoai()%>"
                                            class="text-hover text-hover-underline-goes-right ">Khuy???n
                                        m??i</a></li>
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
                    <%if(user != null){%>
                    <div class="nav-item nav-notify">
                        <%if(countNotify > 0){%>
                        <span><%=countNotify%></span>
                        <%}%>
                        <i class="fa-regular fa-bell icon-header"></i>
                        <div class="nofification" id="nofification-2">
                            <div class="notify-header">
                                <div class="notify-title">
                                    <h4>Th??ng Ba??o</h4>
                                </div>
<%--                                <div class="notify-filter">--%>
<%--                                    <a href="" class="notify-all">T????t Ca??</a>--%>
<%--                                    <a href="" class="notify-orders">????n Ha??ng</a>--%>
<%--                                    <a href="" class="notify-sale">Khuy????n Ma??i</a>--%>
<%--                                    <a href="" class="notify-system">H???? Th????ng</a>--%>
<%--                                </div>--%>
                            </div>
                            <div class="notifys">
                                <!--Th??ng ba??o 1-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Gia??m Gia?? L????n !</p>
                                        <p class="notify-content">Sa??n ph????m A??o Da??i Ph????i Hoa DH1234 ??ang gia??m chi?? co??n 1,000,000??</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Th??ng ba??o 2-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Gia??m Gia?? L????n !</p>
                                        <p class="notify-content">Sa??n ph????m A??o Da??i Ph????i Hoa DH1234 ??ang gia??m chi?? co??n 1,000,000??</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Th??ng ba??o 3-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Gia??m Gia?? L????n !</p>
                                        <p class="notify-content">Sa??n ph????m A??o Da??i Ph????i Hoa DH1234 ??ang gia??m chi?? co??n 1,000,000??</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Th??ng ba??o 4-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Gia??m Gia?? L????n !</p>
                                        <p class="notify-content">Sa??n ph????m A??o Da??i Ph????i Hoa DH1234 ??ang gia??m chi?? co??n 1,000,000??</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                                <!--Th??ng ba??o 5-->
                                <div class="notify">
                                    <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon">
                                    <div class="notify-contents">
                                        <p class="notify-subject">Gia??m Gia?? L????n !</p>
                                        <p class="notify-content">Sa??n ph????m A??o Da??i Ph????i Hoa DH1234 ??ang gia??m chi?? co??n 1,000,000??</p>
                                        <p class="notify-time">12-01-2022</p>
                                    </div>
                                </div>
                            </div>
                            <a href="" class="link_all_noti">Xem t???t c???</a>
                        </div>
                    </div>
                    <%}%>
                    <div id="search-scroll">
                        <i class="fa-solid fa-magnifying-glass search-icon" id="toogle-search"></i>
                        <div class="header-search" id="input-group-scroll">
                            <input id="searchtext2" name="q" value="" maxlength="40" class="input-search" type="text" size="20"
                                   placeholder="T??m ki???m ...." autocomplete="off">
                            <i class="fa-solid fa-magnifying-glass search-icon" onclick="redirectSearch(this)"></i>
                            <div class="wrapper-search box-shadow " id="wrapper-search2">

                            </div>
                        </div>
                    </div>
                    <div>
                        <a href="<%=request.getContextPath()%>/cart">
                            <i class="fa-solid fa-cart-shopping icon-header"></i>
                            Gi??? h??ng(<span class="cart-count color-red">0</span>)
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
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/account">T??i kho???n</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/cart">Gi??? h??ng</a>
                            <a class="dropdown-item text-danger">????ng xu???t</a>
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
                                                      alt="Th???i trang c??ng s??? Seven.AM: V??y ?????m, qu???n ??o, vest n???"></a>
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
                                    <span>Trang ch???</span>
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
                                    <span>????ng nh???p</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/signup"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>????ng k??</span>
                                </a>
                            </div>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>T??i kho???n</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="<%=request.getContextPath()%>/account"
                                   class="text-hover text-hover-underline-goes-right">
                                    <span>Th??ng b??o</span>
                                </a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-item-warper">
                                <a href="#" class="text-hover text-hover-underline-goes-right">
                                    <span>????ng xu???t</span>
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
// b????t t????t th??ng ba??o
    let notifycations=$('.nofification');
    let notifyButton=$('.fa-regular.fa-bell');
    $('#header-first .fa-regular.fa-bell').click(function (){
        sendAjaxnotify(-1);
        $('#nofification-1').toggleClass('flex');
    });
    $('#header-scroll .fa-regular.fa-bell').click(function (){
        sendAjaxnotify(-1);
        $('#nofification-2').toggleClass('flex');
    });
    $(document).click(function(e){
        if(!notifyButton.is(e.target)&&notifycations.has(e.target).length===0&& !notifycations.is(e.target)){
            notifycations.removeClass('flex')
        }
    })

    function sendAjaxnotify(type) {
        $('.notifys').html('');
        $.ajax({
            url: "<%=request.getContextPath()%>/header-user",
            type: "POST",
            data: {
                type: type
            },
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    $('.notifys').append(
                        '<a href="<%=request.getContextPath()%>'+item.link+'">' +
                        ' <div class="notify"> '+
                        ' <img src="<%=request.getContextPath()%>/img/discount.png" alt="" class="notify-icon"> '+
                        ' <div class="notify-contents"> '+
                        ' <p class="notify-subject">'+item.title+'</p> '+
                        ' <p class="notify-content">'+item.mota+'</p> '+
                        ' <p class="notify-time">'+item.ngayCapNhat+'</p> '+
                        ' </div> '+
                        ' </div> '+
                        ' </a>'

                    );
                }
            }
        });
    }

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
                    html += '<span class="left">S???n ph???m</span>';
                    html += '<a id="view_article" href="#" class="left">Xem th??m('+countSearch+')</a>';
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
                        html +='<span class="sale-price">' + formatPriceHome(sale) + '??</span>' ;
                        html += '</div>' +
                            '</a>'+
                            '</div>' +
                            '</li>';
                    }
                    html += '</ul>';
                }else {
                    html= "<h4 style='text-align: center;'>Kh??ng c?? s???n ph???m ph?? h???p"+value+"</h4>";
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
            pushNotify('warning','Vui l??ng nh???p t??? kh??a','T??m ki???m');
        }else {
            window.location.href = '<%=request.getContextPath()%>/searchAjax?txt='+keyword;
        }

    };
</script>
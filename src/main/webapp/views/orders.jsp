<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.admin.Order" %>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    int pagenumber = (int) request.getAttribute("page");
    String xemTrangThaiDonHang = (String) request.getAttribute("xemTrangThaiDonHang");
%>

<link href="<%=request.getContextPath()%>/css/bootstrapf9e3.css?v=1.1" rel="stylesheet"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/fonts/material-icon/css/round.css"/>
<!-- custom style -->
<link href="<%=request.getContextPath()%>/css/uif9e3.css?v=1.1" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/responsivef9e3.css?v=1.1" rel="stylesheet"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/orders.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/acount.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
      integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/notify/simple-notify.min.css">


<b class="screen-overlay"></b>
<main class="main-wrap container">
    <section class="content-main">

        <div class="content-header">
            <h2 class="content-title">Tủy chỉnh hồ sơ </h2>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="row gx-5">
                    <jsp:include page="lefmenuaccount.jsp"></jsp:include>
                    <div class="col-lg-9">

                        <section class="content-body p-xl-4 ">
                            <div class="status-bar">
                                <a href="<%=request.getContextPath()%>/order?status=all" class="status-bar-all">Tất Cả</a>
                                <a href="<%=request.getContextPath()%>/order?status=0" class="status-bar-0">Chờ Xác Nhận</a>
                                <a href="<%=request.getContextPath()%>/order?status=2" class="status-bar-2">Đã Xác Nhận</a>
                                <a href="<%=request.getContextPath()%>/order?status=3" class="status-bar-3">Đang Giao</a>
                                <a href="<%=request.getContextPath()%>/order?status=4" class="status-bar-4">Đã Nhận</a>
                                <a href="<%=request.getContextPath()%>/order?status=1" class="status-bar-1">Đã Hủy</a>
                            </div>
                            <div class="view-mode">
                                <div class="search col-lg-12">
                                    <div class="search__icon">
                                        <i class="fas fa-search"></i>
                                    </div>
                                    <input class="search__input col-lg-12" type="text"
                                           placeholder="Nhập Đơn Hàng Muốn Tìm Kiếm">
                                    <div class="search__button">
                                        Tìm Kiếm
                                    </div>
                                </div>
                            </div>
                            <ul class="list-orders col-lg-12">
                                <%
                                    for (int i = 0; i < orders.size(); i++) {
                                        Order order = orders.get(i);
                                        if (order.getStatus() == 0) {
                                %>
                                <!--Đơn Hàng 3-->
                                <li class="order col-lg-12">
                                    <div class="order-status">
                                        <div class="order-status-infor">

                                            <img src="<%=request.getContextPath()%>/img/package-box.png" alt=""
                                                 class="status-image">
                                            <p class="status__text">Đang Xử Lý</p>
                                        </div>
                                        <i class="fas fa-angle-left"></i>
                                    </div>
                                    <div class="order-body">

                                        <div class="order-details">

                                        </div>
                                    </div>
                                    <div class="order-summary">
                                        <div class="order-infor">
                                            <p class="order-date">Ngày Đặt
                                                Hàng: <%=order.formatDate(order.getOrderDate())%>
                                            </p>
                                            <p class="order-id">Mã Đơn Hàng:
                                            <p class="order-id-item"><%=order.getOrderId()%>
                                            </p></p>

                                        </div>
                                        <div class="order-footer">
                                            <div class="order-total-price">
                                                Tổng
                                                Tiền: <%=Product.formatMoney(Double.parseDouble(order.getTotalPrice() + ""))%>
                                                đ
                                            </div>
                                            <div class="button-group">
                                                <a style="cursor: pointer" class="cancel-button cancel-button-xu-ly" idOrder="<%=order.getOrderId()%>">
                                                    <img src="<%=request.getContextPath()%>/img/exclamation.png" alt="">
                                                    Hủy</a>
                                            </div>
                                        </div>

                                    </div>
                                </li>
                                <%}%>

                                <%if (order.getStatus() == 1) {%>
                                <!--Đơn Hàng 2-->
                                <li class="order col-lg-12">
                                    <div class="order-status">
                                        <div class="order-status-infor">
                                            <img src="<%=request.getContextPath()%>/img/traffic-signal.png" alt=""
                                                 class="status-image">
                                            <p class="status__text">Đã Hủy</p>
                                        </div>
                                        <i class="fas fa-angle-left"></i>

                                    </div>
                                    <div class="order-body">

                                        <div class="order-details">
                                        </div>
                                    </div>

                                    <div class="order-summary">
                                        <div class="order-infor">
                                            <p class="order-date">Ngày Đặt
                                                Hàng: <%=order.formatDate(order.getOrderDate())%>
                                            </p>
                                            <p class="order-receive-date">Ngày
                                                Hủy: <%=order.formatDate(order.getNgayNhanHang())%>
                                            </p>
                                            <p class="order-id">Mã Đơn Hàng:
                                            <p class="order-id-item"><%=order.getOrderId()%>
                                            </p></p>

                                        </div>
                                        <div class="order-footer">
                                            <div class="order-total-price">
                                                Tổng Tiền:
                                                <s><%=Product.formatMoney(Double.parseDouble(order.getTotalPrice() + ""))%>
                                                    đ</s>
                                            </div>
                                            <div class="button-group">

                                            </div>
                                        </div>

                                    </div>
                                </li>
                                <%}%>
                                <%if (order.getStatus() == 2) {%>
                                <!--Đơn Hàng 4-->
                                <li class="order col-lg-12">
                                    <div class="order-status">
                                        <div class="order-status-infor">
                                            <img src="<%=request.getContextPath()%>/img/fast-delivery.png" alt=""
                                                 class="status-image">
                                            <p class="status__text">Đã xác nhận</p>

                                        </div>
                                        <i class="fas fa-angle-left"></i>
                                    </div>
                                    <div class="order-body">

                                        <div class="order-details">
                                        </div>
                                    </div>
                                    <div class="order-summary">
                                        <div class="order-infor">
                                            <p class="order-date">Ngày Đặt
                                                Hàng: <%=order.formatDate(order.getOrderDate())%>
                                            </p>
                                            <p class="order-receive-date">Ngày Nhận Hàng Dự
                                                Kiến: <%=order.getSoNgayDuKien()%>
                                            </p>
                                            <p class="order-id">Mã Đơn Hàng:
                                            <p class="order-id-item"><%=order.getOrderId()%>
                                            </p></p>
                                        </div>
                                        <div class="order-footer">
                                            <div class="order-total-price">
                                                Tổng
                                                Tiền: <%=Product.formatMoney(Double.parseDouble(order.getTotalPrice() + ""))%>
                                                đ
                                            </div>
                                            <div class="button-group">
                                                <a style="cursor: pointer" class="cancel-button cancel-button-da-xac-nhan" idOrder="<%=order.getOrderId()%>">
                                                    <img src="<%=request.getContextPath()%>/img/exclamation.png" alt="">
                                                    Hủy</a>
                                            </div>
                                        </div>

                                    </div>
                                </li>
                                <%}%>

                                <%if (order.getStatus() == 3) {%>
                                <!--Đơn Hàng 4-->
                                <li class="order col-lg-12">
                                    <div class="order-status">
                                        <div class="order-status-infor">
                                            <img src="<%=request.getContextPath()%>/img/fast-delivery.png" alt=""
                                                 class="status-image">
                                            <p class="status__text">Đang Vận Chuyển</p>

                                        </div>
                                        <i class="fas fa-angle-left"></i>
                                    </div>
                                    <div class="order-body">

                                        <div class="order-details">

                                        </div>
                                    </div>
                                    <div class="order-summary">
                                        <div class="order-infor">
                                            <p class="order-date">Ngày Đặt
                                                Hàng: <%=order.formatDate(order.getOrderDate())%>
                                            </p>
                                            <p class="order-receive-date">Ngày Nhận Hàng Dự
                                                Kiến: <%=order.getSoNgayDuKien()%>
                                            </p>
                                            <p class="order-id">Mã Đơn Hàng:
                                            <p class="order-id-item"><%=order.getOrderId()%>
                                            </p></p>
                                        </div>
                                        <div class="order-footer">
                                            <div class="order-total-price">
                                                Tổng
                                                Tiền: <%=Product.formatMoney(Double.parseDouble(order.getTotalPrice() + ""))%>
                                                đ
                                            </div>
                                            <div class="button-group">
                                                <a style="cursor: pointer" class="buy-again buy-again-nhan-hang" idOrder="<%=order.getOrderId()%>">Nhận hàng</a>

                                            </div>
                                        </div>

                                    </div>
                                </li>
                                <%}%>

                                <%if (order.getStatus() == 4) {%>
                                <!--Đơn Hàng 1-->
                                <li class="order col-lg-12">
                                    <div class="order-status">
                                        <div class="order-status-infor">
                                            <img src="<%=request.getContextPath()%>/img/package.png" alt=""
                                                 class="status-image">
                                            <p class="status__text">Đã Nhận Được Hàng</p>
                                        </div>
                                        <i class="fas fa-angle-left"></i>
                                    </div>
                                    <div class="order-body">
                                        <div class="order-details">

                                        </div>
                                    </div>

                                    <div class="order-summary">
                                        <div class="order-infor">
                                            <p class="order-date">Ngày Đặt
                                                Hàng: <%=order.formatDate(order.getOrderDate())%>
                                            </p>
                                            <p class="order-receive-date">Ngày Nhận
                                                Hàng: <%=order.formatDate(order.getNgayNhanHang())%>
                                            </p>
                                            <p class="order-id">Mã Đơn Hàng:
                                            <p class="order-id-item"><%=order.getOrderId()%>
                                            </p></p>
                                        </div>
                                        <div class="order-footer">
                                            <div class="order-total-price">
                                                Tổng
                                                Tiền: <%=Product.formatMoney(Double.parseDouble(order.getTotalPrice() + ""))%>
                                                đ
                                            </div>
                                            <div class="button-group">
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <%}%>
                                <%}%>


                            </ul>
                            <div class="more-order">
                                <div class="pagination">
                                    <a class="page-item-pe" href="#">&laquo;</a>
                                    <%for (int i = 1; i <= pagenumber;i++){
                                        if(i == 1){
                                    %>
                                    <a class="active page-item" href="#"><%=i%></a>
                                    <%}else{%>
                                    <a href="#" class="page-item"><%=i%></a>
                                    <%}%>
                                    <%}%>
                                    <a class="page-item-next" href="#">&raquo;</a>
                                </div>
                            </div>

                        </section> <!-- content-body .// -->

                    </div> <!-- col.// -->
                </div> <!-- row.// -->

            </div> <!-- card body end// -->
        </div> <!-- card end// -->


    </section> <!-- content-main end// -->
</main>
<!-- ============================ COMPONENT END// ============================ -->
<script>
    if (localStorage.getItem("darkmode")) {
        var body_el = document.body;
        body_el.className += 'dark';
    }
   show();
    function show(){
        let listShow = document.querySelectorAll('.order')
        for (var i = 0; i < listShow.length; i++) {
            listShow[i].querySelector('.order-status').addEventListener('click', function () {
                var clickItemShow = this.parentElement.classList.toggle('show');
                var parent = this.closest('.order').querySelector('.order-details');
                var idHoaDon = this.closest('.order').querySelector('.order-id-item').innerHTML;
                if (clickItemShow) {
                    getItemOrderDetails(parent, idHoaDon);
                }
            })
        }
    }

    function getItemOrderDetails(parent, idHoaDon) {
        parent.innerHTML = '';
        //send ajax jquery
            $.ajax({
                url: '<%=request.getContextPath()%>/order',
                type: 'POST',
                data: {
                    idHoaDon: idHoaDon
                },
                success: function (data) {
                    // console.log(data);
                    var listItem = data;

                    for (var i = 0; i < listItem.length; i++) {
                        var item = listItem[i];
                        var itemHtml = '<div class="order-detail">' +
                            '               <div class="product-infor">' +
                            '                <img src="<%=request.getContextPath()%>'+item.urlImg+'" alt="" class="product-image">' +
                            '                <div class="product-info-general">' +
                            '                <p class="product-name">'+item.name+'</p>' +
                            '                 <p class="product-size">Size: '+item.size+'</p>' +
                            '                  <p class="product-quantity">Số Lượng: '+item.soLuong+'</p>' +
                            '                  </div>' +
                            '                   </div>' +
                            '                    <div class="product-price">' +
                            '                    <span>'+(formatPrice(item.gia))+' đ</span>' +
                            '                    </div>' +
                            '                     </div>';
                        parent.innerHTML += itemHtml;
                    }
                }
            });

    }
//format price
    function formatPrice(price) {
        return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
    }


    //----------------click page -----------
    let listPage = document.querySelectorAll('.page-item');
    for (var i = 0; i < listPage.length; i++) {
        listPage[i].addEventListener('click', function () {
            var page = this.innerHTML;
            var pageActive = document.querySelector('.page-item.active');
            pageActive.classList.remove('active');
            this.classList.add('active');

            if(page != pageActive.innerHTML){
                getOrder(page);
            }
        })
    }
    var pagenumber = <%=pagenumber%>;
    var xemTrangThaiDonHang = '<%=xemTrangThaiDonHang%>';

    document.querySelector('.status-bar-'+xemTrangThaiDonHang).classList.add('select');

    if(pagenumber > 1){
        //click class="page-item-pe"
        document.querySelector('.page-item-pe').addEventListener('click', function () {
            var pageActive = document.querySelector('.page-item.active');
            var page = pageActive.innerHTML;
            if(page != 1){
                pageActive.classList.remove('active');
                pageActive.previousElementSibling.classList.add('active');
                getOrder(pageActive.previousElementSibling.innerHTML);
            }
        })
        //click class="page-item-next"

        document.querySelector('.page-item-next').addEventListener('click', function () {
            var pageActive = document.querySelector('.page-item.active');
            var page = pageActive.innerHTML;
            if(page != pagenumber){
                pageActive.classList.remove('active');
                pageActive.nextElementSibling.classList.add('active');
                getOrder(pageActive.nextElementSibling.innerHTML);
            }
        })
    }


    function getOrder(page) {
        var listOrder = document.querySelector('.list-orders');
        listOrder.innerHTML = '';
        //send ajax jquery
        $.ajax({
            url: '<%=request.getContextPath()%>/order',
            type: 'POST',
            data: {
                page: page,
                xemTrangThaiDonHang:xemTrangThaiDonHang
            },
            success: function (data) {
                 // console.log(data);
                var listItem = data;
                for (var i = 0; i < listItem.length; i++) {
                    var order = listItem[i];
                    var  status = order.status;
                    var itemHtml = '';
                    if (status == 0) {
                        itemHtml=
                        '<!--Đơn Hàng 3-->'+
                        '<li class="order col-lg-12">'+
                        '<div class="order-status">'+
                        '<div class="order-status-infor">'+
                        '<img src="<%=request.getContextPath()%>/img/package-box.png" alt=""'+
                        'class="status-image">'+
                        '<p class="status__text">Đang Xử Lý</p>'+
                        '</div>'+
                        '<i class="fas fa-angle-left"></i>'+
                        '</div>'+
                        '<div class="order-body">'+
                        '<div class="order-details">'+
                        '</div>'+
                        '</div>'+
                        '<div class="order-summary">'+
                        '<div class="order-infor">'+
                        '<p class="order-date">Ngày Đặt'+
                        'Hàng: '+formatDate(order.orderDate)+
                        '</p>'+
                        '<p class="order-id">Mã Đơn Hàng:'+
                        '<p class="order-id-item">'+order.orderId+
                        '</p></p>'+
                        '</div>'+
                        '<div class="order-footer">'+
                        '<div class="order-total-price">'+
                        'Tổng'+
                        'Tiền: '+formatPrice(order.totalPrice)+
                        'đ'+
                        '</div>'+
                        '<div class="button-group">'+
                        '<a style="cursor: pointer" class="cancel-button cancel-button-xu-ly" idOrder="'+order.orderId+'">'+
                        '<img src="<%=request.getContextPath()%>/img/exclamation.png" alt="">'+
                        'Hủy</a>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</li>'
                        }
                    if (status == 1) {
                        itemHtml+=
                        '<!--Đơn Hàng 2-->'+
                        '<li class="order col-lg-12">'+
                        '<div class="order-status">'+
                        '<div class="order-status-infor">'+
                        '<img src="<%=request.getContextPath()%>/img/traffic-signal.png" alt=""'+
                        'class="status-image">'+
                        '<p class="status__text">Đã Hủy</p>'+
                        '</div>'+
                        '<i class="fas fa-angle-left"></i>'+
                        '</div>'+
                        '<div class="order-body">'+
                        '<div class="order-details">'+
                        '</div>'+
                        '</div>'+
                        '<div class="order-summary">'+
                        '<div class="order-infor">'+
                        '<p class="order-date">Ngày Đặt'+
                            'Hàng: '+formatDate(order.orderDate)+
                        '</p>'+
                        '<p class="order-receive-date">Ngày'+
                        'Hủy: '+formatDate(order.ngayNhanHang)+
                        '</p>'+
                        '<p class="order-id">Mã Đơn Hàng:'+
                        '<p class="order-id-item">'+order.orderId+
                        '</p></p>'+
                        '</div>'+
                        '<div class="order-footer">'+
                        '<div class="order-total-price">'+
                        'Tổng Tiền:'+
                        '<s>Tiền: '+formatPrice(order.totalPrice)+
                        'đ</s>'+
                        '</div>'+
                        '<div class="button-group">'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</li>'
                        }
                    if (status == 2) {
                        itemHtml+=
                        '<!--Đơn Hàng 4-->'+
                        '<li class="order col-lg-12">'+
                        '<div class="order-status">'+
                        '<div class="order-status-infor">'+
                        '<img src="<%=request.getContextPath()%>/img/fast-delivery.png" alt=""'+
                        'class="status-image">'+
                        '<p class="status__text">Đã xác nhận</p>'+
                        '</div>'+
                        '<i class="fas fa-angle-left"></i>'+
                        '</div>'+
                        '<div class="order-body">'+
                        '<div class="order-details">'+
                        '</div>'+
                        '</div>'+
                        '<div class="order-summary">'+
                        '<div class="order-infor">'+
                        '<p class="order-date">Ngày Đặt'+
                            'Hàng: '+formatDate(order.orderDate)+
                        '</p>'+
                        '<p class="order-receive-date">Ngày Nhận Hàng Dự'+
                        'Kiến: '+order.soNgayDuKien+
                        '</p>'+
                        '<p class="order-id">Mã Đơn Hàng:'+
                        '<p class="order-id-item">'+order.orderId+
                        '</p></p>'+
                        '</div>'+
                        '<div class="order-footer">'+
                        '<div class="order-total-price">'+
                        'Tổng'+
                        'Tiền: '+formatPrice(order.totalPrice)+
                        'đ'+
                        '</div>'+
                        '<div class="button-group">'+
                            '<a style="cursor: pointer" class="cancel-button cancel-button-da-xac-nhan" idOrder="'+order.orderId+'>'+
                            '<img src="<%=request.getContextPath()%>/img/exclamation.png" alt="">'+
                            'Hủy</a>'+
                        '</div>'+
                        '</div>'+
                        '</li>'
                    }
                    if (status == 3) {
                        itemHtml+=
                        '<!--Đơn Hàng 4-->'+
                        '<li class="order col-lg-12">'+
                        '<div class="order-status">'+
                        '<div class="order-status-infor">'+
                        '<img src="<%=request.getContextPath()%>/img/fast-delivery.png" alt=""'+
                        'class="status-image">'+
                        '<p class="status__text">Đang Vận Chuyển</p>'+
                        '</div>'+
                        '<i class="fas fa-angle-left"></i>'+
                        '</div>'+
                        '<div class="order-body">'+
                        '<div class="order-details">'+
                        '</div>'+
                        '</div>'+
                        '<div class="order-summary">'+
                        '<div class="order-infor">'+
                        '<p class="order-date">Ngày Đặt'+
                            'Hàng: '+formatDate(order.orderDate)+
                        '</p>'+
                        '<p class="order-receive-date">Ngày Nhận Hàng Dự'+
                        'Kiến: '+order.soNgayDuKien+
                        '</p>'+
                        '<p class="order-id">Mã Đơn Hàng:'+
                            '<p class="order-id-item">'+order.orderId+
                        '</p></p>'+
                        '</div>'+
                        '<div class="order-footer">'+
                        '<div class="order-total-price">'+
                        'Tổng'+
                        'Tiền: '+formatPrice(order.totalPrice)+
                        'đ'+
                        '</div>'+
                        '<div class="button-group">'+
                        '<a style="cursor: pointer" class="buy-again buy-again-nhan-hang" idOrder="'+order.orderId+'>Nhận hàng</a>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</li>'
                    }
                    if (status == 4) {
                        itemHtml+=
                        '<!--Đơn Hàng 1-->'+
                        '<li class="order col-lg-12">'+
                        '<div class="order-status">'+
                        '<div class="order-status-infor">'+
                        '<img src="<%=request.getContextPath()%>/img/package.png" alt=""'+
                        'class="status-image">'+
                        '<p class="status__text">Đã Nhận Được Hàng</p>'+
                        '</div>'+
                        '<i class="fas fa-angle-left"></i>'+
                        '</div>'+
                        '<div class="order-body">'+
                        '<div class="order-details">'+
                        '</div>'+
                        '</div>'+
                        '<div class="order-summary">'+
                        '<div class="order-infor">'+
                        '<p class="order-date">Ngày Đặt'+
                            'Hàng: '+formatDate(order.orderDate)+
                        '</p>'+
                        '<p class="order-receive-date">Ngày Nhận'+
                        'Hàng: '+formatDate(order.ngayNhanHang)+
                        '</p>'+
                        '<p class="order-id">Mã Đơn Hàng:'+
                            '<p class="order-id-item">'+order.orderId+
                        '</p></p>'+
                        '</div>'+
                        '<div class="order-footer">'+
                        '<div class="order-total-price">'+
                        'Tổng'+
                        'Tiền: '+formatPrice(order.totalPrice)+
                        'đ'+
                        '</div>'+
                        '<div class="button-group">'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</li>'
                        }
                    listOrder.innerHTML += itemHtml;
                }
                show();

            }
        });
    }
    //format date

    function formatDate(date){
        var date = new Date(date);
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        return day + "/" + month + "/" + year;
    }

    var cancelOrderDangXuLy = document.querySelectorAll('.cancel-button-xu-ly');
    if(cancelOrderDangXuLy != null){
        for(var i = 0; i < cancelOrderDangXuLy.length; i++){
            cancelOrderDangXuLy[i].addEventListener('click', function(e) {
                var idOrder = e.target.getAttribute('idOrder');
                sendAjaxCancelOrder(idOrder, 1)

            });
        }

    }
    var cancelOrderDaXacNhan = document.querySelectorAll('.cancel-button-da-xac-nhan');
    if(cancelOrderDaXacNhan != null){
        for(var i = 0; i < cancelOrderDaXacNhan.length; i++){
            cancelOrderDaXacNhan[i].addEventListener('click', function(e) {
                var idOrder = e.target.getAttribute('idOrder');
                sendAjaxCancelOrder(idOrder, 5);

            });
        }

    }
    var cancelOrderDaNhanHang = document.querySelectorAll('.buy-again-nhan-hang');
    if(cancelOrderDaNhanHang != null){
        for(var i = 0; i < cancelOrderDaNhanHang.length; i++){
            cancelOrderDaNhanHang[i].addEventListener('click', function(e) {
                var idOrder = e.target.getAttribute('idOrder');
                sendAjaxCancelOrder(idOrder, 4)
            });
        }

    }
    //send ajax
    function sendAjaxCancelOrder(idOrder, status){
        if(idOrder == null){
            return;
        }
        $.ajax({
            url: '<%=request.getContextPath()%>'+'/cancel-order',
            type: 'POST',
            data:{
                idOrder: idOrder,
                status: status
            },
            success: function(response){
                if(response != 0){
                    if(status == 1) {
                        pushNotify('success', 'Đơn Hàng Đã Được Huỷ', 'Thông Báo');
                    }
                    if(response == 4 ){
                        pushNotify('success', 'Cập nhật đơn hàng thành công', 'Thông Báo');

                    }
                    if(response == 5){
                        pushNotify('success', 'Gửi yêu cầu thành công', 'Thông Báo');

                    }
                    setTimeout(function(){
                        window.location.reload();
                    }, 1000);
                }else{
                    pushNotify('error', 'Đơn Hàng Không Thể Huỷ', 'Thông Báo');
                }
            }
        });
    }

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
</script>

<script>
    if (localStorage.getItem("darkmode")) {
        var body_el = document.body;
        body_el.className += 'dark';
    }
</script>
<script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
<script src="<%=request.getContextPath()%>/script/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script src="<%=request.getContextPath()%>/script/scriptc619.js?v=1.0"></script>


if (order.status == 0)
{
<!--Đơn Hàng 3-->
<li class="order col-lg-12">
    <div class="order-status">
        <div class="order-status-infor">

            <img src="../img/package-box.png" alt=""
                 class="status-image">
            <p class="status__text">Đang Xử Lý</p>
        </div>
        <i class="fas fa-angle-left"></i>
    </div>
    <div class="order-body">

        <div class="order-details">

        </div>
    </div>
    <div class="order-summary">
        <div class="order-infor">
            <p class="order-date">Ngày Đặt
                Hàng: @order.formatDate(order.orderDate)
            </p>
            <p class="order-id">Mã Đơn Hàng:
            <p class="order-id-item">@order.orderId
            </p></p>

        </div>
        <div class="order-footer">
            <div class="order-total-price">
                Tổng
                Tiền: @formatPrice(order.totalPrice)
                đ
            </div>
            <div class="button-group">
                <a style="cursor: pointer" class="cancel-button cancel-button-xu-ly" idOrder="@order.orderId">
                    <img src="../img/exclamation.png" alt="">
                    Hủy</a>
            </div>
        </div>

    </div>
</li>
}
else if(order.status == 1)
{
<!--Đơn Hàng 2-->
<li class="order col-lg-12">
    <div class="order-status">
        <div class="order-status-infor">
            <img src="../img/traffic-signal.png" alt=""
                 class="status-image">
            <p class="status__text">Đã Hủy</p>
        </div>
        <i class="fas fa-angle-left"></i>

    </div>
    <div class="order-body">

        <div class="order-details">
        </div>
    </div>

    <div class="order-summary">
        <div class="order-infor">
            <p class="order-date">Ngày Đặt
                Hàng:  @order.formatDate(order.orderDate)
            </p>
            <p class="order-receive-date">Ngày
                Hủy:  @order.formatDate(order.ngayNhanHang)
            </p>
            <p class="order-id">Mã Đơn Hàng:
            <p class="order-id-item">@order.orderId
            </p></p>

        </div>
        <div class="order-footer">
            <div class="order-total-price">
                Tổng Tiền:
                <s>@formatPrice(order.totalPrice)
                    đ</s>
            </div>
            <div class="button-group">

            </div>
        </div>

    </div>
</li>
}
else if(order.status == 2)
{
<li class="order col-lg-12">
    <div class="order-status">
        <div class="order-status-infor">
            <img src="../img/fast-delivery.png" alt=""
                 class="status-image">
            <p class="status__text">Đã xác nhận</p>

        </div>
        <i class="fas fa-angle-left"></i>
    </div>
    <div class="order-body">

        <div class="order-details">
        </div>
    </div>
    <div class="order-summary">
        <div class="order-infor">
            <p class="order-date">Ngày Đặt
                Hàng: @order.formatDate(order.orderDate)
            </p>
            <p class="order-receive-date">Ngày Nhận Hàng Dự
                Kiến: @order.soNgayDuKien
            </p>
            <p class="order-id">Mã Đơn Hàng:
            <p class="order-id-item">@order.orderId
            </p></p>
        </div>
        <div class="order-footer">
            <div class="order-total-price">
                Tổng
                Tiền: @formatPrice(order.totalPrice)
                đ
            </div>
            <div class="button-group">
                <a style="cursor: pointer" class="cancel-button cancel-button-da-xac-nhan" idOrder="@order.orderId">
                    <img src="../img/exclamation.png" alt="">
                    Hủy</a>
            </div>
        </div>

    </div>
</li>
}
else if(order.status == 3)
{
<li class="order col-lg-12">
    <div class="order-status">
        <div class="order-status-infor">
            <img src="../img/fast-delivery.png" alt=""
                 class="status-image">
            <p class="status__text">Đang Vận Chuyển</p>

        </div>
        <i class="fas fa-angle-left"></i>
    </div>
    <div class="order-body">

        <div class="order-details">

        </div>
    </div>
    <div class="order-summary">
        <div class="order-infor">
            <p class="order-date">Ngày Đặt
                Hàng:@order.formatDate(order.orderDate)
            </p>
            <p class="order-receive-date">Ngày Nhận Hàng Dự
                Kiến: @order.soNgayDuKien
            </p>
            <p class="order-id">Mã Đơn Hàng:
            <p class="order-id-item">@order.orderId
            </p></p>
        </div>
        <div class="order-footer">
            <div class="order-total-price">
                Tổng
                Tiền: @formatPrice(order.totalPrice)
                đ
            </div>
            <div class="button-group">
                <a style="cursor: pointer" class="buy-again buy-again-nhan-hang" idOrder="@order.orderId">Nhận hàng</a>

            </div>
        </div>

    </div>
</li>
}
else if(order.status == 4)
{
<li class="order col-lg-12">
    <div class="order-status">
        <div class="order-status-infor">
            <img src="../img/package.png" alt=""
                 class="status-image">
            <p class="status__text">Đã Nhận Được Hàng</p>
        </div>
        <i class="fas fa-angle-left"></i>
    </div>
    <div class="order-body">
        <div class="order-details">

        </div>
    </div>

    <div class="order-summary">
        <div class="order-infor">
            <p class="order-date">Ngày Đặt
                Hàng: @order.formatDate(order.orderDate)
            </p>
            <p class="order-receive-date">Ngày Nhận
                Hàng:@order.soNgayDuKien
            </p>
            <p class="order-id">Mã Đơn Hàng:
            <p class="order-id-item">@order.orderId
            </p></p>
        </div>
        <div class="order-footer">
            <div class="order-total-price">
                Tổng
                Tiền:  @formatPrice(order.totalPrice)
                đ
            </div>
            <div class="button-group">
            </div>
        </div>
    </div>
</li>
}
   

    
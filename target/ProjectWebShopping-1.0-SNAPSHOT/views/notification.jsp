<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <link href="<%=request.getContextPath()%>/css/bootstrapf9e3.css?v=1.1" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/fonts/material-icon/css/round.css" />
    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/css/uif9e3.css?v=1.1" rel="stylesheet"  />
    <link href="<%=request.getContextPath()%>/css/responsivef9e3.css?v=1.1" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/notification.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    <b class="screen-overlay"></b>
    <main class="main-wrap container">
        <section class="content-main">

            <div class="content-header">
                <h2 class="content-title">Tủy chỉnh hồ sơ </h2>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row gx-5">
                        <aside class="col-lg-3 border-end">
                            <nav class="nav nav-pills flex-lg-column mb-4">

                                <ul class="menu-aside">
                                    <li class="menu-item  active">
                                        <a class="menu-link" href="<%=request.getContextPath()%>/views/account.jsp">
                                            <span class="text">Tài khoản của tôi</span>
                                        </a>
                                    </li>
                                    <li class="menu-item has-submenu">
                                        <a class="menu-link" style="cursor: pointer;">
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
                                        <a class="menu-link" href="<%=request.getContextPath()%>/views/orders.jsp">
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
                        <div class="col-lg-9">

                            <section class="content-body p-xl-4 ">
                                <div class="notify-header">
                                    <h3>Tất Cả</h3>
                                    <span></span>
                                </div>
                                <div class="notify-body">
                                    <!--Thông Báo 1-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/order.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Nhắc nhở: Bạn đã nhận được hàng chưa?
                                            </p>
                                            <p class="notify-content">
                                                Nếu bạn chưa nhận được hàng hoặc gặp vấn đề với đơn hàng <b>21122772PVRGBY</b>
                                                , hãy nhấn Trả hàng/Hoàn tiền trước ngày <b>11-01-2022</b>
                                                . Sau thời gian này, Shopee sẽ thanh toán cho Người bán.
                                            </p>
                                            <p class="notify-time">
                                                07:30 11-01-2022
                                            </p>
                                        </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>
                                    <!--Thông Báo 2-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/order.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Nhắc nhở: Bạn đã nhận được hàng chưa?
                                            </p>
                                            <p class="notify-content">
                                                Nếu bạn chưa nhận được hàng hoặc gặp vấn đề với đơn hàng <b>21122772PVRGBY</b>
                                                , hãy nhấn Trả hàng/Hoàn tiền trước ngày <b>11-01-2022</b>
                                                . Sau thời gian này, Shopee sẽ thanh toán cho Người bán.
                                            </p>
                                            <p class="notify-time">
                                                07:30 11-01-2022
                                            </p>
                                           </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>
                                    <!--Thông Báo 3-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/system.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Bạn có đơn hàng đang trên đường giao
                                            </p>
                                            <p class="notify-content">
                                                📣Shipper bảo rằng: đơn hàng <b>220101KH1R6XH5</b>
                                                của bạn vẫn đang trong quá trình vận chuyển và dự kiến được giao trong 1-2 ngày tới. 
                                                Vui lòng bỏ qua thông báo này nếu bạn đã nhận được hàng nhé!😊
                                            </p>
                                            <p class="notify-time">
                                                08:20 10-01-2022
                                            </p>
                                           </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>
                                    <!--Thông Báo 4-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/discount.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Giảm Giá Lớn !
                                            </p>
                                            <p class="notify-content">
                                                Sản phẩm Áo Dài Phối Họa Tiết Hoa DX1007 giảm chỉ còn 1,050,000đ! Săn ngay!
                                            </p>
                                            <p class="notify-time">
                                                07:30 11-01-2022
                                            </p>
                                           </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>
                                    <!--Thông Báo 5-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/order.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Nhắc nhở: Bạn đã nhận được hàng chưa?
                                            </p>
                                            <p class="notify-content">
                                                Nếu bạn chưa nhận được hàng hoặc gặp vấn đề với đơn hàng <b>21122772PVRGBY</b>
                                                , hãy nhấn Trả hàng/Hoàn tiền trước ngày <b>11-01-2022</b>
                                                . Sau thời gian này, Shopee sẽ thanh toán cho Người bán.
                                            </p>
                                            <p class="notify-time">
                                                07:30 11-01-2022
                                            </p>
                                           </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>
                                    <!--Thông Báo 6-->
                                    <div class="notify-item">
                                        <img src="<%=request.getContextPath()%>/img/system.png" alt="">
                                        <div class="notify-infor">
                                            <p class="notify-title">
                                                Bạn có đơn hàng đang trên đường giao
                                            </p>
                                            <p class="notify-content">
                                                📣Shipper bảo rằng: đơn hàng <b>220101KH1R6XH5</b>
                                                của bạn vẫn đang trong quá trình vận chuyển và dự kiến được giao trong 1-2 ngày tới. 
                                                Vui lòng bỏ qua thông báo này nếu bạn đã nhận được hàng nhé!😊
                                            </p>
                                            <p class="notify-time">
                                                08:20 10-01-2022
                                            </p>
                                           </div>
                                        <a href="" class="notify-button">Xem Chi Tiết</a>
                                    </div>                                                                                                                                            
                                </div>
                                <div class="notify-footer">

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
    </script>

   <script>
    if (localStorage.getItem("darkmode")) {
        var body_el = document.body;
        body_el.className += 'dark';
    }
    </script>
    <script src="/script/jquery-3.5.0.min.js"></script>
    <script src="/script/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="/script/scriptc619.js?v=1.0"></script>


   

    
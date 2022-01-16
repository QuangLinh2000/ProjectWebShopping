<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="<%=request.getContextPath()%>/css/bootstrapf9e3.css?v=1.1" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/fonts/material-icon/css/round.css" />
    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/css/uif9e3.css?v=1.1" rel="stylesheet"  />
    <link href="<%=request.getContextPath()%>/css/responsivef9e3.css?v=1.1" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/orders.css">
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
                                <div class="status-bar">
                                    <a href="" class="select">Tất Cả</a>
                                    <a href="" class="">Chờ Xác Nhận</a>
                                    <a href="" class="">Đã Xác Nhận</a>
                                    <a href="" class="">Đang Giao</a>
                                    <a href="" class="">Đã Nhận</a>
                                    <a href="" class="">Đã Hủy</a>
                                </div>
                                <div class="view-mode">
                                    <div class="search col-lg-12">
                                        <div class="search__icon">
                                            <i class="fas fa-search"></i>
                                        </div>
                                        <input class="search__input col-lg-12" type="text" placeholder="Nhập Đơn Hàng Muốn Tìm Kiếm">
                                        <div class="search__button">
                                            Tìm Kiếm
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-orders col-lg-12">
                                    <!--Đơn Hàng 1-->
                                    <li class="order col-lg-12">
                                        <div class="order-status">
                                            <div class="order-status-infor">
                                                <img src="<%=request.getContextPath()%>/img/package.png" alt="" class="status-image">
                                                <p class="status__text">Đã Nhận Được Hàng</p>
                                            </div>
                                            <i class="fas fa-angle-left"></i>
                                        </div>
                                        <div class="order-body">
                                            <div class="order-details">
                                                <!--Sản Phẩm 1-->                                     
                                                 <div class="order-detail">
                                                    <div class="product-infor">
                                                        <img src="<%=request.getContextPath()%>/img/AK62546/1.jpg" alt="" class="product-image">
                                                        <div class="product-info-general">
                                                            <p class="product-name">Đầm Tay Xoan</p>
                                                            <p class="product-size">Size: L</p>
                                                           <p class="product-quantity">Số Lượng: 2</p>
                                                       </div>
                                                    </div>
                                                    <div class="product-price">
                                                        <span>1,200,000 đ</span>
                                                     </div>
                                                 </div>
                                                 <!--Sản Phẩm 2-->
                                                 <div class="order-detail">
                                                     <div class="product-infor">
                                                         <img src="<%=request.getContextPath()%>/img/AK62546/1.jpg" alt="" class="product-image">
                                                        <div class="product-info-general">
                                                             <p class="product-name">Đầm Tay Xoan</p>
                                                             <p class="product-size">Size: L</p>
                                                             <p class="product-quantity">Số Lượng: 2</p>
                                                         </div>
                                                    </div>
                                                     <div class="product-price">
                                                        <span>1,200,000 đ</span>
                                                     </div>
                                                     </div>
     
                                             </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <div class="order-infor">
                                                <p class="order-date">Ngày Đặt Hàng: 11-01-2022</p>
                                                <p class="order-receive-date">Ngày Nhận Hàng: 20-01-2022</p>
                                                <p class="order-id">Mã Đơn Hàng: DX1003</p>
                                            </div>
                                            <div class="order-footer">
                                                <div class="order-total-price">
                                                    Tổng Tiền: <span>2,400,000 đ</span>
                                                </div>
                                                <div class="button-group">
                                                    <a href="" class="buy-again">Mua Lại</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                     <!--Đơn Hàng 2-->
                                    <li class="order col-lg-12">
                                        <div class="order-status">
                                            <div class="order-status-infor">
                                                <img src="<%=request.getContextPath()%>/img/traffic-signal.png" alt="" class="status-image">
                                                <p class="status__text">Đã Hủy</p>
                                            </div>
                                            <i class="fas fa-angle-left"></i>

                                        </div>
                                        <div class="order-body">

                                            <div class="order-details">
                                                <div class="order-detail">
                                                    <div class="product-infor">
                                                        <img src="<%=request.getContextPath()%>/img/AK62546/1.jpg" alt="" class="product-image">
                                                        <div class="product-info-general">
                                                            <p class="product-name">Đầm Tay Xoan</p>
                                                            <p class="product-size">Size: L</p>
                                                            <p class="product-quantity">Số Lượng: 2</p>
                                                        </div>
                                                    </div>
                                                    <div class="product-price">
                                                        <span>1,200,000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <div class="order-infor">
                                                <p class="order-date">Ngày Đặt Hàng: 11-01-2022</p>
                                                <p class="order-receive-date">Ngày Hủy: 12-01-2022</p>
                                            </div>
                                            <div class="order-footer">
                                                <div class="order-total-price">
                                                    Tổng Tiền: <s>2,400,000 đ</s>
                                                </div>
                                                <div class="button-group">
                                                    <a href="" class="buy-again">
                                                        Mua Lại</a>
                                                </div>
                                            </div>

                                        </div>
                                    </li>
                                     <!--Đơn Hàng 3-->
                                    <li class="order col-lg-12">
                                        <div class="order-status">
                                            <div class="order-status-infor">

                                                <img src="<%=request.getContextPath()%>/img/package-box.png" alt="" class="status-image">
                                                <p class="status__text">Đang Xử Lý</p>
                                            </div>
                                            <i class="fas fa-angle-left"></i>
                                        </div>
                                        <div class="order-body">

                                            <div class="order-details">
    
                                                <div class="order-detail">
                                                    <div class="product-infor">
                                                        <img src="<%=request.getContextPath()%>/img/AK62546/1.jpg" alt="" class="product-image">
                                                        <div class="product-info-general">
                                                            <p class="product-name">Đầm Tay Xoan</p>
                                                            <p class="product-size">Size: L</p>
                                                            <p class="product-quantity">Số Lượng: 2</p>
                                                        </div>
                                                    </div>
                                                    <div class="product-price">
                                                        <span>1,200,000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-summary">
                                            <div class="order-infor">
                                                <p class="order-date">Ngày Đặt Hàng: 11-01-2022</p>
                                            </div>
                                            <div class="order-footer">
                                                <div class="order-total-price">
                                                    Tổng Tiền: <span>2,400,000 đ</span>
                                                </div>
                                                <div class="button-group">
                                                    <a href="" class="buy-again">Mua Lại</a>
                                                    <a href="" class="cancel-button">
                                                        <img src="<%=request.getContextPath()%>/img/exclamation.png" alt="">
                                                        Hủy</a>
                                                </div>
                                            </div>

                                        </div>
                                    </li>
                                     <!--Đơn Hàng 4-->
                                    <li class="order col-lg-12">
                                        <div class="order-status">
                                            <div class="order-status-infor">
                                                <img src="<%=request.getContextPath()%>/img/fast-delivery.png" alt="" class="status-image">
                                                <p class="status__text">Đang Vận Chuyển</p>

                                            </div>
                                            <i class="fas fa-angle-left"></i>
                                        </div>
                                        <div class="order-body">

                                            <div class="order-details">
    
                                                <div class="order-detail">
                                                    <div class="product-infor">
                                                        <img src="<%=request.getContextPath()%>/img/AK62546/1.jpg" alt="" class="product-image">
                                                        <div class="product-info-general">
                                                            <p class="product-name">Đầm Tay Xoan</p>
                                                            <p class="product-size">Size: L</p>
                                                            <p class="product-quantity">Số Lượng: 2</p>
                                                        </div>
                                                    </div>
                                                    <div class="product-price">
                                                        <span>1,200,000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-summary">
                                            <div class="order-infor">
                                                <p class="order-date">Ngày Đặt Hàng: 11-01-2022</p>
                                                <p class="order-receive-date">Ngày Nhận Hàng Dự Kiến: 20-01-2022</p>
                                                <p class="order-id">Mã Đơn Hàng: DX1003</p>
                                            </div>
                                            <div class="order-footer">
                                                <div class="order-total-price">
                                                    Tổng Tiền: <span>2,400,000 đ</span>
                                                </div>
                                                <div class="button-group">
                                                    <a href="" class="buy-again">Mua Lại</a>
                                                </div>
                                            </div>

                                        </div>
                                    </li>

                                </ul>
                                <udiv class="more-order">
                                    <div class="pagination">
                                        <a href="#">&laquo;</a>
                                        <a class="active" href="#">1</a>
                                        <a  href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#">5</a>
                                        <a href="#">6</a>
                                        <a href="#">7</a>
                                        <a href="#">&raquo;</a>
                                      </div>
                                </udiv>

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
        let listShow=document.querySelectorAll('.order')
        console.log(listShow.length)
        for(var i=0;i<listShow.length;i++){
            listShow[i].querySelector('.order-status').addEventListener('click',function(){
                this.parentElement.classList.toggle('show')
            })
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


   

    
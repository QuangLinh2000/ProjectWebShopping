<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="<%=request.getContextPath()%>/css/bootstrapf9e3.css?v=1.1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/material-icon/css/round.css" />
    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/responsivef9e3.css?v=1.1" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/acount.css">
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
                                        <a class="menu-link" href="#">
                                            <span class="text">Tài khoản của tôi</span>
                                        </a>
                                    </li>
                                    <li class="menu-item has-submenu">
                                        <a class="menu-link" style="cursor: pointer;">
                                            <span class="text">Thông báo</span>
                                        </a>
                                        <div class="submenu" style="display: block;">
                                            <a href="#">Cập nhật đơn hàng</a>
                                            <a href="#">Khuyễn mãi</a>
                                            <a href="#">Hệ thống</a>
                                        </div>
                                    </li>

                                    <li class="menu-item ">
                                        <a class="menu-link" href="#">
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

                            <section class="content-body p-xl-4">
                                <form>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="row gx-3">
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Tên đăng nhập</label>
                                                    <input class="form-control" type="text" placeholder="Nhập tại đây" value="linh" readonly>
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Họ và tên</label>
                                                    <input class="form-control" type="text" placeholder="Nhập tại đây">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6  mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input class="form-control" type="email" placeholder="example@mail.com" readonly>
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6  mb-3">
                                                    <label class="form-label">Điện thoại</label>
                                                    <input class="form-control" type="tel" placeholder="+1234567890">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Địa chỉ</label>
                                                    <input class="form-control" type="text" placeholder="Nhập tại đây">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6  mb-3">
                                                    <label class="form-label">Ngày sinh</label>
                                                    <input class="form-control" type="date">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6 mb-3">
                                                    <label class="form-label">Giới tính</label>
                                                    <select class="form-select mb-3 form-control">
                                                        <option value="1">Nam</option>
                                                        <option value="2">Nữ</option>
                                                        <option value="3">Khác</option>
                                                    </select>
                                                </div>
                                            </div> <!-- row.// -->
                                        </div> <!-- col.// -->
                                        <aside class="col-lg-4">
                                            <figure class="text-lg-center d-flex flex-column align-items-center justify-content-center">
                                                <img class="img-lg mb-3 img-avatar" src="<%=request.getContextPath()%>/img/avatar.png"
                                                    alt="User Photo">
                                                <figcaption>
                                                    <a class="btn btn-outline-primary" href="#">
                                                        <i class="icons material-icons md-backup"></i> Chọn ảnh
                                                    </a>
                                                </figcaption>
                                            </figure>
                                            <p class="text-center font-weight-light text-secondary">
                                                Dụng lượng file tối đa 1 MB
                                                <br>
                                                Định dạng: .JPEG, .PNG
                                            </p>

                                        </aside> <!-- col.// -->
                                    </div> <!-- row.// -->
                                    <br>
                                    <div class="center-cus">
                                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                    </div>
                                </form>

                                <hr class="my-5">

                                <div class="row" style="max-width:920px">
                                    <div class="col-md">
                                        <article class="box mb-3 bg-light">
                                            <a class="btn float-end btn-light " href="#">Đổi</a>
                                            <h6>Mật khẩu</h6>
                                            <small class="text-muted d-block" style="width:70%">
                                                Bạn có thể thay đổi mật khẩu của mình bằng cách nhấn vào đây</small>
                                        </article>
                                    </div> <!-- col.// -->
                                    <div class="col-md">
                                        <article class="box mb-3 bg-light">
                                            <a class="btn float-end btn-outline-danger " href="#">Xoá</a>
                                            <h6>Xoá tải khoản</h6>
                                            <small class="text-muted d-block" style="width:70%">Sau khi bạn xóa tài khoản của mình, bạn sẽ không thể quay lại</small>
                                        </article>
                                    </div> <!-- col.// -->
                                </div> <!-- row.// -->


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
    <script src="<%=request.getContextPath()%>/script/header.js"></script>
    <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/script/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="<%=request.getContextPath()%>/script/scriptc619.js?v=1.0"></script>

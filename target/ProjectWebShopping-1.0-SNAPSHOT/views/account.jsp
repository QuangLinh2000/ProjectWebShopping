<%@ page import="com.example.projectwebshopping.model.client.KhachHang" %>
<%@ page import="com.example.projectwebshopping.model.client.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="<%=request.getContextPath()%>/css/bootstrapf9e3.css?v=1.1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/material-icon/css/round.css" />
    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/acount.css">

 <%
     KhachHang khachHang = (KhachHang) request.getAttribute("khachHang");
     User user = (User) request.getAttribute("user");
 %>

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
                                <div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="row gx-3">
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Tên đăng nhập</label>
                                                    <input class="form-control" type="text" placeholder="Nhập tại đây" value="<%=user.getUsername()%>" readonly>
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Họ và tên</label>
                                                    <input id="name-customer" class="form-control" type="text" placeholder="Nhập tại đây">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6  mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input id="email-customer" class="form-control" type="email" placeholder="example@mail.com" value="<%=user.getEmail()%>" readonly>
                                                </div> <!-- col .// -->
                                                <div class="col-lg-6  mb-3">
                                                    <label class="form-label">Điện thoại</label>
                                                    <input id="phone-customer" class="form-control" type="tel" placeholder="+1234567890">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Địa chỉ</label>
                                                    <input id="address-customer" class="form-control" type="text" placeholder="Nhập tại đây">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12 row dia-diem">
                                                    <div  class="input-item-content-box col-lg-4 row ">
                                                        <select class="diem-diem-item col-lg-12 pb-3" onChange="clickTinhThanhPho(this)" id="tinh-thanh-pho" >
                                                            <option   value="">Tỉnh/Thành Phố</option>
                                                        </select>

                                                    </div>
                                                    <div class="input-item-content-box col-lg-4 row ">
                                                        <select class="diem-diem-item col-lg-12 pb-3" onchange="clickQuanHuyen(this)"   id="quan-huyen" >
                                                            <option   value="">Quận/Huyện</option>
                                                        </select>

                                                    </div>
                                                    <div class="input-item-content-box col-lg-4 row ">

                                                        <select class="diem-diem-item col-lg-12 pb-3" id="phuong-xa" >
                                                            <option   value="">Phường/xã</option>
                                                        </select>
                                                    </div>

                                                </div>


<%--                                                <div class="col-lg-6  mb-3">--%>
<%--                                                    <label class="form-label">Ngày sinh</label>--%>
<%--                                                    <input id="birthday-customer"  class="form-control" type="date">--%>
<%--                                                </div> <!-- col .// -->--%>
<%--                                                <div class="col-lg-6 mb-3">--%>
<%--                                                    <label class="form-label">Giới tính</label>--%>
<%--                                                    <select id="sex-customer" class="form-select mb-3 form-control">--%>
<%--                                                        <option value="1">Nam</option>--%>
<%--                                                        <option value="2">Nữ</option>--%>
<%--                                                        <option value="3">Khác</option>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
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
                                        <button class="btn btn-primary" onclick="clickCapNhat()">Lưu thay đổi</button>
                                    </div>
                                </div>

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



    var array;
    var valueTinhThanhPho = "Tỉnh/Thành Phố";
    var arrayQuanHuyen;
    var valueQuanHUyen = "Quận / Huyện";
    var arrayPhuongXa;
    $.getJSON("<%=request.getContextPath()%>/data/local.json", function (json) {
        // console.log(json); // this will show the info it in firebug console
        array = json;
        // console.log(array[0]);
        $("#tinh-thanh-pho").html('<option value="">Tỉnh/Thành Phố</option>');
        array.forEach((element) => {
            $("#tinh-thanh-pho").append(
                '<option value="' + element.name + '">' + element.name + "</option>"
            );
        });
        <%if(khachHang!=null){%>
        $("#tinh-thanh-pho").val("<%=khachHang.getTinhTP()%>").change();
        clickTinhThanhPho(document.getElementById("tinh-thanh-pho"));
        $("#quan-huyen").val("<%=khachHang.getQuanHuyen()%>").change();
        $("#phuong-xa").val("<%=khachHang.getPhuongXa()%>").change();
        <%}%>
    });
    function clickTinhThanhPho(sel) {
        valueTinhThanhPho = sel.options[sel.selectedIndex].text;

        array.forEach((element) => {
            if (element.name === valueTinhThanhPho) {
                arrayQuanHuyen = element.districts;
            }
        });

        $("#quan-huyen").html("");
        $("#quan-huyen").append('<option value="">Quận/Huyện</option>');
        $("#phuong-xa").html('<option value="">Phường/xã</option>');

        arrayQuanHuyen.forEach((element) => {
            $("#quan-huyen").append('<option value="' + element.name + '">' + element.name + "</option>");
        });
    }



    function clickQuanHuyen(el) {
        valueQuanHUyen = el.options[el.selectedIndex].text;

        arrayQuanHuyen.forEach((element) => {
            if (element.name === valueQuanHUyen) {
                arrayPhuongXa = element.wards;
            }
        });

        $("#phuong-xa").html('<option value="">Phường/xã</option>');
        arrayPhuongXa.forEach((element) => {
            $("#phuong-xa").append('<option value="' + element.name + '">' + element.name + "</option>");
        });
    }
    //get element class name billing_address_2 envent click

    <%if(khachHang!=null){%>
    $("#name-customer").val("<%=khachHang.getTenKH()%>");
    $("#phone-customer").val("<%=khachHang.getSdt()%>");
    $("#email-customer").val("<%=khachHang.getEmail()%>");
    $("#address-customer").val("<%=khachHang.getDiaChi()%>");
    <%}%>

    function clickCapNhat() {
        var check = true;
        <%if(khachHang==null){%>
        check = false;
        <%}%>
        var name = $("#name-customer").val();
        var phone = $("#phone-customer").val();
        var email = $("#email-customer").val();
        var address = $("#address-customer").val();
        var tinhTP = $("#tinh-thanh-pho").val();
        var quanHuyen = $("#quan-huyen").val();
        var phuongXa = $("#phuong-xa").val();
        console.log(name + " " + phone + " " + email + " " + address + " " + tinhTP + " " + quanHuyen + " " + phuongXa);
        if(name.trim().length > 0 && phone.trim().length > 0
            && checkEmailp(email)
            &&checkPhonep(phone)
            && address.trim().length > 0
            && tinhTP.trim().length > 0
            && quanHuyen.trim().length > 0 && phuongXa.trim().length > 0) {

            //ajax
            $.ajax({
                url: "<%=request.getContextPath()%>/account",
                type: "POST",
                data: {
                    name: name,
                    phone: phone,
                    email: email,
                    address: address,
                    tinhTP: tinhTP,
                    quanHuyen: quanHuyen,
                    phuongXa: phuongXa,
                    check: check
                },
                success: function (data) {
                    if (data.trim() === "success") {
                        pushNotify("success", "Cập nhật thành công","cập nhật thông tin");
                        //refesh page
                        location.reload();
                    } else {
                        pushNotify("warning", "Cập nhật thất bại","cập nhật thông tin");
                    }
                }
            });
        }

    }
    function checkEmailp(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }
    //check format phone
    function checkPhonep(phone) {
        var re = /^[0-9]{10,11}$/;
        return re.test(String(phone).toLowerCase());
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
    <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/script/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="<%=request.getContextPath()%>/script/scriptc619.js?v=1.0"></script>

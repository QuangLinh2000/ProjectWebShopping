<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 10/01/2022
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
    <title>Shop thoi trang</title>
    <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/assets/fontawesome-free-6.0.0-beta3-web/css/all.css" rel="stylesheet" />
    <%--    link notify--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/notify/simple-notify.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset-pass.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/loader.css">
    <style>
        .wrapper-loader{
            position: fixed;

            background-color: rgba(255, 255, 255, 0.6);
            z-index: 9999;
        }
        .lds-ellipsis {
            transform: scale(1.5);
        }
    </style>
</head>
<body>
<header>
    <div class="header-top-wrap-logo">
        <h1>
            <a href="<%=request.getContextPath()%>/home"><img src="<%=request.getContextPath()%>/img/logo.png"
                                                              alt="Thời trang công sở Seven.AM: Váy đầm, quần áo, vest nữ"></a>
        </h1>
    </div>
</header>
<div class="wrapper-loader" id="load-1">
    <div class="lds-ellipsis">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<section id="resetpass">
    <div class="container resetpass-wrapper">
        <div class="modal">
            <div class="modal-header">
                <div class="header-icon">
                    <a href="<%=request.getContextPath()%>/signin"><i class="fa-solid fa-arrow-left"></i></a>
                </div>
                <div class="wraper-title">
                    <h3 class="modal-title">Đặt Lại Mật Khẩu</h3>
                </div>
            </div>
            <div class="modal-body">
                <div class="input-wrapper">
                    <input class="input-modal" type="text" name="user-name" id="user-name" required placeholder="Tên đăng nhập">
                    <div id="validation1" class="invalid-feedback">
                        Không được để trống
                    </div>
                </div>
                <div class="modal-btn">
                    <a  class="btn btn-modal" id="btn-send">Tiếp tục</a>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
    const load = document.querySelector('#load-1');
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
    const userName = document.getElementById('user-name');
    // click button ajax check email
    const btnSend = document.getElementById('btn-send');
    btnSend.addEventListener('click', function (e) {
        if (userName.value.trim().length != 0) {
            load.classList.add('active');
            $.ajax({
                url: '<%=request.getContextPath()%>/reset',
                type: 'POST',
                data: {
                    userName: userName.value
                },
                success: function (data) {
                    // res get status
                    // parse data
                    const dataParse = JSON.parse(data);
                    console.log(dataParse);
                    if (data!=null&&dataParse.status === 'success') {
                        <%--window.location.href = '<%=request.getContextPath()%>/resetpass/' + res.data.id;--%>
                        pushNotify('success', 'Tên đăng nhập hợp lệ', 'Để tiếp tục vui lòng vào email để đặt lại mật khẩu');
                        $('.input-wrapper').html(`<p class="text-p-modal">Mã xác minh đã được gửi đến địa chỉ email<br><span class="email-text">`+dataParse.email+`</span>
                                <br>Vui lòng xác minh.
                            </p>`)
                        btnSend.innerText="ok";
                        //redirect  page signin
                        btnSend.addEventListener('click', function (e) {
                            window.location.href = '<%=request.getContextPath()%>/signin';
                        })

                    } else {
                        pushNotify('error', 'Tên đăng nhập không hợp lệ', 'Vui lòng kiểm tra lại thông tin');
                    }
                    load.classList.remove('active');

                }
            });
        } else {
            userName.parentElement.classList.add('err');
            load.classList.remove('active');
        }

    });

</script>
<script src="<%=request.getContextPath()%>/assets/notify/simple-notify.min.js"></script>

</html>
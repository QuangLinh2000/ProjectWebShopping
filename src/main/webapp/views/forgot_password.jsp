<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 10/01/2022
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  String userName = request.getParameter("username");
    String email = request.getParameter("email");
    String code = request.getParameter("code");
    // userName nul vs email null code null status 400
    if (userName == null || email == null || code == null) {
        response.sendError(404);
        return;
    }
%>
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
    <%--    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/notify/simple-notify.min.css">--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset-pass.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">

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
            <form class="modal-body" action="/change-pass" type="POST">

                <p class="text-p-modal">
                    Tạo mật khẩu mới cho
                    <br><%=userName%>.
                </p>

                <div class="input-wrapper">
                    <input class="input-modal" type="password" name="user-name" id="pass" required placeholder="Mật khẩu">
                    <div id="validation1" class="invalid-feedback">
                        Mật khẩu phải trên 6 ký tự
                    </div>
                </div>
                <div class="modal-btn">
                    <a  class="btn btn-modal" id="btn-send">Đổi mật khẩu</a>
                </div>
            </form>
        </div>
    </div>
</section>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
    // check pass

    // click redirect page change-pass method post
    const btnSend = document.getElementById('btn-send');
    const pass = document.getElementById('pass');
    btnSend.addEventListener('click', function () {
        if (pass.value.length > 6) {
            btnSend.style.pointerEvents = 'none';
            pass.parentElement.classList.remove('err');
            console.log("pass")
            $.ajax({
                url: '<%=request.getContextPath()%>/change-pass',
                type: 'post',
                data: {
                    userName: '<%=userName%>',
                    email: '<%=email%>',
                    code: '<%=code%>',
                    password: $('#pass').val(),
                },
                success: function (data) {
                    if (data === "success") {
                        // redirect to signin
                        window.location.href = "<%=request.getContextPath()%>/signin";
                    } else {
                        alert("Đổi mật khẩu thất bại");
                        btnSend.style.pointerEvents = 'auto';
                    }
                }
            });
        }   else {
            pass.parentElement.classList.add('err');
        }
    });
</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/11/2022
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/admin/tablib.jsp"%>
<html>
<head>
    <title> <decorator:title default="Trình điều khiển"></decorator:title></title>
    <link href="<%=request.getContextPath()%>/admin/images/favicon.ico" rel="shortcut icon" type="image/x-icon">

    <link href="<%=request.getContextPath()%>/admin/css/bootstrapf9e3.css?v=1.1" rel="stylesheet" type="text/css"/>

    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/admin/css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/admin/css/responsivef9e3.css?v=1.1" rel="stylesheet" />

    <!-- iconfont -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/fonts/material-icon/css/round.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/notify/simple-notify.min.css">

    <decorator:head/>
</head>
<body>
<b class="screen-overlay"></b>
<!-- * modal delete -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Xoá sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xoá sản phẩm này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                <button type="button" class="btn btn-primary bg-danger btn-accept">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/common/admin/lefmenu.jsp"></jsp:include>
<main class="main-wrap">
    <jsp:include page="/common/admin/header.jsp"></jsp:include>
    <decorator:body/>
</main>
<script type="text/javascript">
    //document.onload
    window.onload = function(e){
        // toogle notify
        $('#btn-notify').click(function () {
            $('.dropdown-menu-custom').toggleClass('show');
        });
        // click outsize dropdown-menu close
        $(document).click(function (event) {
            if (!$(event.target).closest('.notifications').length) {
                $('.dropdown-menu-custom').removeClass('show');
            }
        });
    };
    if(localStorage.getItem("darkmode")){
        var body_el = document.body;
        body_el.className += 'dark';
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
</body>

<script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/bootstrap.bundle.min.js"></script>


<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
<script src="<%=request.getContextPath()%>/admin/js/bootstrap.min.js"></script>
<!-- ChartJS files-->

<!-- Custom JS -->
<script src="<%=request.getContextPath()%>/admin/js/scriptc619.js?v=1.0" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/notify/simple-notify.min.js"></script>

</html>

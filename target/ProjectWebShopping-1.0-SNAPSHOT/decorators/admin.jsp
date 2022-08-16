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

<jsp:include page="/common/admin/lefmenu.jsp"></jsp:include>
<main class="main-wrap">
    <jsp:include page="/common/admin/header.jsp"></jsp:include>
    <decorator:body/>
</main>
<script type="text/javascript">

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
    //document.onload
    window.onload = function(e){
        // toogle notify
        $('#btn-notify').click(function () {
            sendAjaxNotify(-1);
            $('.dropdown-menu-custom').toggleClass('show');
        });
        // click outsize dropdown-menu close
        $(document).click(function (event) {
            if (!$(event.target).closest('.notifications').length) {
                $('.dropdown-menu-custom').removeClass('show');
            }
        });
    };

    document.querySelector('#moi-dat').addEventListener('click', function () {
        //remove class active
        document.querySelectorAll('.nav-link').forEach(function (el) {
            el.classList.remove('active');
        });
        //add class active
        document.querySelector('#moi-dat').classList.add('active');
        sendAjaxNotify(0);
    });
    document.querySelector('#da-giao').addEventListener('click', function () {
        //remove class active
        document.querySelectorAll('.nav-link').forEach(function (el) {
            el.classList.remove('active');
        });
        //add class active
        document.querySelector('#da-giao').classList.add('active');
        sendAjaxNotify(4);
    });
    document.querySelector('#muon-huy').addEventListener('click', function () {
        //remove class active
        document.querySelectorAll('.nav-link').forEach(function (el) {
            el.classList.remove('active');
        });
        //add class active
        document.querySelector('#muon-huy').classList.add('active');
        sendAjaxNotify(5);
    });
    document.querySelector('#all-notify').addEventListener('click', function () {
        //remove class active
        document.querySelectorAll('.nav-link').forEach(function (el) {
            el.classList.remove('active');
        });
        //add class active
        document.querySelector('#all-notify').classList.add('active');
        sendAjaxNotify(-1);
    });

    function sendAjaxNotify(style){
        $('.list-notifications').html('');
        $.ajax({
            url: '<%=request.getContextPath()%>/admin-header',
            type: 'POST',
            data: {
                style: style
            },
            success: function (data) {
               for (var i = 0; i < data.length; i++) {
                   var item = data[i];
                   $('.list-notifications').append(
                       '<a href="<%=request.getContextPath()%>'+item.link+'">' +
                       ' <div class="list-notifications-item mb-2"> '+
                       ' <div class="card"> '+
                       ' <div class="row g-0 px-4"> '+
                       ' <div class="col-md-2 d-flex align-items-center"> '+
                       ' <div> '+
                       ' <img src="<%=request.getContextPath()%>/admin/images/people/avatar1.jpg" class="rounded-circle" alt="..." style="width: 60px;"> '+
                       ' </div> '+
                       ' </div> '+
                       ' <div class="col-md-10"> '+
                       ' <div class="card-body py-0 ps-3"> '+
                       ' <h5 class="card-title mb-0 text-left">'+item.title+' </h5> '+
                       ' <small class="text-muted text-right">'+item.ngayCapNhat+'</small> '+
                       ' <p class="card-text mb-2">'+item.mota+'</p> '+
                       ' </div> '+
                       ' </div> '+
                       ' </div> '+
                       ' </div> '+
                       ' </div> '+
                       ' </a>'
                   );
               }
            }
        });
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
<script>
    $(".log-out").click(function () {
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
</script>
</html>

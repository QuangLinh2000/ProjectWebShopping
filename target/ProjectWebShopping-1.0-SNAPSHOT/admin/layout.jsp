<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/10/2022
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-index-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 07 Dec 2021 02:38:57 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Sample title - Ecommerce admin dashboard template</title>

    <link href="<%=request.getContextPath()%>/admin/images/favicon.ico" rel="shortcut icon" type="image/x-icon">

    <link href="<%=request.getContextPath()%>/admin/css/bootstrapf9e3.css?v=1.1" rel="stylesheet" type="text/css"/>

    <!-- custom style -->
    <link href="<%=request.getContextPath()%>/admin/css/uif9e3.css?v=1.1" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/admin/css/responsivef9e3.css?v=1.1" rel="stylesheet" />

    <!-- iconfont -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/fonts/material-icon/css/round.css"/>

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
                <button type="button" class="btn btn-primary bg-danger">Đồng ý</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="lefmenu.jsp"></jsp:include>
<main class="main-wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="${container_view}"></jsp:include>

</main>

<script type="text/javascript">
    if(localStorage.getItem("darkmode")){
        var body_el = document.body;
        body_el.className += 'dark';
    }
</script>

<script src="<%=request.getContextPath()%>/admin/js/jquery-3.5.0.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/bootstrap.bundle.min.js"></script>


<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
<script src="<%=request.getContextPath()%>/admin/js/bootstrap.min.js"></script>
<!-- ChartJS files-->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- Custom JS -->
<script src="<%=request.getContextPath()%>/admin/js/scriptc619.js?v=1.0" type="text/javascript"></script>

<!-- ChartJS customize-->
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',

        // The data for our dataset
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [
                {
                    label: 'Sales',
                    backgroundColor: 'rgb(44, 120, 220)',
                    borderColor: 'rgb(44, 120, 220)',
                    data: [18, 17, 4, 3, 2, 20, 25, 31, 25, 22, 20, 9]
                },
                {
                    label: 'Visitors',
                    backgroundColor: 'rgb(180, 200, 230)',
                    borderColor: 'rgb(180, 200, 230)',
                    data: [40, 20, 17, 9, 23, 35, 39, 30, 34, 25, 27,18]
                }

            ]
        },

        // Configuration options go here
        options: {}
    });

</script>

</body>

</html>

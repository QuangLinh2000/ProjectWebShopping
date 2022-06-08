<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/12/2022
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> productList =(List<Product>) request.getAttribute("products");
    List<LoaiSP> loaiSPS = (List<LoaiSP>) request.getAttribute("loaiSPs");
    int totalPage = (int) request.getAttribute("total");

%>
<html>
<head>
    <title>Xem dạng bảng</title>
</head>
<body>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Xoá sản phẩm</h5>
                <button type="button" class="close dismis-model-item" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body notify-delete-product">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary dismis-model-item" >Thoát</button>
                <button id="delete-product" type="button" class="btn btn-primary bg-danger btn-accept dismis-model-item">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<%----------model thong bao -----------%>

<div class="modal fade" id="notyleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Hủy Đơn hàng</h5>
                <button type="button" class="close dismis-model-item" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn hủy đơn hàng và xóa sản phẩm này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary dismis-model-item" >Thoát</button>
                <button id="btn-delete-huy" type="button" class="btn btn-primary bg-danger btn-accept dismis-model-item">Đồng ý</button>
            </div>
        </div>
    </div>
</div>

<%------------modle co don hang dang giao---------%>
<div class="modal fade" id="cancel-order" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Thông báo</h5>
                <button type="button" class="close dismis-model-item" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body notify-delete-product-3">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary dismis-model-item" >Thoát</button>
                <button id="btn-tam-ngung-kinh-doanh" type="button" class="btn btn-primary bg-danger btn-accept dismis-model-item">Đồng ý</button>
            </div>
        </div>
    </div>
</div>


<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Sản phẩm (Dạng bảng) </h2>
        <div>
            <a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Tạo mới</a>
        </div>
    </div>

    <div class="card mb-4">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col col-check flex-grow-0">
                    <div class="form-check ms-2">
                        <input class="form-check-input" type="checkbox" value="">
                    </div>
                </div>
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                    <select id="loai-product" class="form-select">
                        <option>Loại</option>
                        <%for (int i = 0; i < loaiSPS.size(); i++) {
                            LoaiSP loaiSP = loaiSPS.get(i);
                        %>
                        <option value="<%=loaiSP.getMaLoai()%>"><%=loaiSP.getTenLoai()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="col-md-2 col-6" style="padding: 0 2px;">
                    <input id="filter-date" type="date" class="form-control">
                </div>
                <div class="col-md-2 col-6">
                    <select id="status-product" class="form-select">
                        <option value="-1">Trạng thái</option>
                        <option value="1">Còn hàng</option>
                        <option value="0">Hết hàng</option>
                        <option value="2">Tạm ngừng</option>
                        <option value="-1">Hiện tất cả</option>
                    </select>
                </div>
            </div>
        </header> <!-- card-header end// -->
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox">
                            </div>
                        </th>
                        <th>STT</th>
                        <th>Sản phẩm</th>
                        <th>Loại</th>
                        <th>Trạng thái</th>
                        <th>Ngày</th>
                        <th class="text-end">  </th>
                    </tr>
                    </thead>
                    <tbody id="list-product">
                    <%for (int i = 0; i < productList.size();i++){
                        Product product = productList.get(i);
                        Date ngayNhap = product.getNayNhap();
                    %>
                    <tr>
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox">
                            </div>
                        </td>
                        <td><%=i%></td>
                        <td style="max-width: 200px"><b ><%=product.getTenSP()%></b></td>
                        <td><%=product.getNamLoaiSP()%></td>
                        <td><span class="badge rounded-pill <%=product.getClassTrangThai()%>"><%=product.getTrangThaiProduct()%></span></td>
                        <td><%=ngayNhap.getDate()+"/"+(ngayNhap.getMonth()+1)+"/"+(ngayNhap.getYear()+1900)%></td>
                        <td class="text-end">
                            <a href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>" class="btn btn-light">Chi tiết</a>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                        class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Xem chi tiết</a>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Chỉnh sửa</a>
                                    <a idsp ="<%=product.getMaSP()%>" class="dropdown-item  text-danger delete-product-item"  style="cursor: pointer">Xoá</a>
                                </div>
                            </div> <!-- dropdown //end -->
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div> <!-- table-responsive end // -->

            <div id="page-index">


                <%if(totalPage > 1){%>

                <nav class="float-end mt-4" aria-label="Page navigation">
                    <ul class="pagination">
                        <li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>
                        <%for (int i = 1; i <= totalPage; i++) {
                            if(i == 1){
                        %>
                        <li class="page-item page-item-child active"><a class="page-link" href="#"><%=i%></a></li>
                        <%}else{%>
                        <li  class="page-item page-item-child"><a class="page-link" href="#"><%=i%></a></li>

                        <%}%>
                        <%}%>

                        <li id="page-item-next" class="page-item"><a class="page-link" href="#">Sau</a></li>
                    </ul>
                </nav>
                <%}%>
            </div>


        </div> <!-- card-body end// -->
    </div> <!-- card end// -->


</section>
<script>
    var date;
    var  satus = -1;
    var loai = "Loại";
    var page = 1;
    var total = <%=totalPage%>;
    setNonePageItemChild();
    //event onchange filter-date use dom
    document.getElementById("filter-date").addEventListener("change", function () {
        var value = this.value;
        date = value;
        page = -1;
        sendAjax();
        setNonePageItemChild();

    });
    //event onchange status-product use dom
    document.getElementById("status-product").addEventListener("change", function () {
        var value = this.value;
        satus = value;
        page = -1;
        sendAjax();
        setNonePageItemChild();

    });
    //event onchange  loai-product use dom
    document.getElementById("loai-product").addEventListener("change", function () {
        var value = this.value;
        loai = value;
        page = -1;
        sendAjax();
        setNonePageItemChild();

    });
    clickPage();
    function clickPage() {
        if(total > 1){
            //event onclick page-index use dom
            document.querySelectorAll(".page-item-child").forEach(function (item) {
                item.addEventListener("click", function () {
                    page = this.innerText;
                    document.querySelectorAll(".page-item").forEach(function (item) {
                        item.classList.remove("active");
                    });
                    this.classList.add("active");
                    if(page == 1) {
                        document.getElementById("page-item-pre").classList.add("disabled");
                        document.getElementById("page-item-next").classList.remove("disabled");
                    }else{
                        if(page == total) {
                            document.getElementById("page-item-next").classList.add("disabled");
                            document.getElementById("page-item-pre").classList.remove("disabled");
                        }else{
                            document.getElementById("page-item-pre").classList.remove("disabled");
                            document.getElementById("page-item-next").classList.remove("disabled");
                        }
                    }

                    sendAjax();
                    setNonePageItemChild();

                })
            });

            document.getElementById("page-item-pre").addEventListener("click", function () {
                if (page > 1) {
                    page--;
                    document.querySelectorAll(".page-item").forEach(function (item) {
                        if(item.innerText == page){
                            item.classList.add("active");
                        }else{
                            item.classList.remove("active");

                        }
                        if(page == 1) {
                            document.getElementById("page-item-pre").classList.add("disabled");
                            document.getElementById("page-item-next").classList.remove("disabled");
                        }else{
                            if(page == total) {
                                document.getElementById("page-item-next").classList.add("disabled");
                                document.getElementById("page-item-pre").classList.remove("disabled");
                            }else{
                                document.getElementById("page-item-pre").classList.remove("disabled");
                                document.getElementById("page-item-next").classList.remove("disabled");
                            }
                        }
                    });
                    sendAjax();
                    setNonePageItemChild();

                }
            });
            document.getElementById("page-item-next").addEventListener("click", function () {
                if (page < total) {
                    page++;
                    document.querySelectorAll(".page-item").forEach(function (item) {
                        if(item.innerText == page){
                            item.classList.add("active");
                        }else{
                            item.classList.remove("active");

                        }
                        if(page == 1) {
                            document.getElementById("page-item-pre").classList.add("disabled");
                            document.getElementById("page-item-next").classList.remove("disabled");
                        }else{
                            if(page == total) {
                                document.getElementById("page-item-next").classList.add("disabled");
                                document.getElementById("page-item-pre").classList.remove("disabled");
                            }else{
                                document.getElementById("page-item-pre").classList.remove("disabled");
                                document.getElementById("page-item-next").classList.remove("disabled");
                            }
                        }
                    });
                    sendAjax();
                    setNonePageItemChild();


                }
            });
        }



    }
    function sendAjax() {
        // ajax jquery
        $.ajax({
            url: "<%=request.getContextPath()%>/admin-list-view-product",
            type: "POST",
            data: {
                date: date,
                status: satus,
                loai: loai,
                page: page
            },
            success: function (data) {
                var totalPage = data.total;
                var listProduct = data.data;
                $("#list-product").html("");
                var count = 0;
                if(page <= 1) {
                    count = 0;
                }else{
                    count = (page - 1) * 10;
                }
                for (var i = 0; i < listProduct.length; i++) {
                    var product = listProduct[i];
                    $("#list-product").append(' <tr>'+
                        '                        <td>'+
                        '                            <div class="form-check">'+
                        '                                <input class="form-check-input" type="checkbox">'+
                        '                            </div>'+
                        '                        </td>'+
                        '                        <td>'+count+'</td>'+
                        '                        <td style="max-width: 200px"><b >'+product.tenSP+'</b></td>'+
                        '                        <td>'+product.namLoaiSP+'</td>'+
                        '                        <td><span class="badge rounded-pill ' + getClassTrangThai(product.trangThai) + '">' + getTrangThaiProduct(product.trangThai) + '</span></td>'+
                        '                        <td>' + formatDate(product.nayNhap) + '</td>'+
                        '                        <td class="text-end">'+
                        '                            <a href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '" class="btn btn-light">Chi tiết</a>'+
                        '                            <div class="dropdown">'+
                        '                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i'+
                        '                                        class="material-icons md-more_horiz"></i> </a>'+
                        '                                <div class="dropdown-menu">'+
                        '                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Xem chi tiết</a>'+
                        '                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Chỉnh sửa</a>'+
                        '                                    <a idsp = "'+product.maSP+'" class="dropdown-item text-danger delete-product-item" style="cursor: pointer">Xoá</a>' +
                        '                                </div>'+
                        '                            </div> <!-- dropdown //end -->'+
                        '                        </td>'+
                        '                    </tr>');
                    count++;

                }

                //pagination
                if (totalPage != -1){
                    var htmlPagination = '<li id="page-item-pre" class="page-item disabled"><a class="page-link" href="#">Trước</a></li>';
                    for (var i = 1; i <= getPageCount(10,totalPage); i++) {
                        if (i == 1) {
                            htmlPagination += '<li class="page-item page-item-child active"><a class="page-link" href="#">' + i + '</a></li>';
                        } else {
                            htmlPagination += '<li class="page-item page-item-child"><a class="page-link" href="#">' + i + '</a></li>';
                        }
                    }
                    htmlPagination += '<li id="page-item-next"  class="page-item"><a class="page-link" href="#">Sau</a></li>';
                    if(getPageCount(10,totalPage) <= 1) {

                        $('.pagination').html('') ;
                    }else{
                        $('.pagination').html(htmlPagination);

                    }
                    total = getPageCount(10,totalPage);
                    page = 1;
                    clickPage();
                    setNonePageItemChild();


                }
                clickDelete();

            }
        });

    }
    //set none page-item-child
    function setNonePageItemChild(){
        var pageItem =  document.getElementsByClassName('page-item-child');
        for (var i = 0; i <pageItem.length; i++) {
            pageItem[i].style.display = 'none';
        }
        var count = 0;
        for (var i = page-1; i < pageItem.length; i++) {
            if(i >= 0){
                pageItem[i].style.display = 'block';
                count++;

            }
            if (count >= 5){
                break;
            }
        }
    }

    //format price
    function formatPrice(price) {
        //cast double to int
        var priceInt = parseInt(price);
        return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
    }
    function getTrangThaiProduct(status) {
        switch (status) {
            case 0:
                return "Hết hàng";
            case 1:
                return "Còn hàng";
            case 2:
                return "Tạm ngừng";
            default:
                return "";
        }
    }


    function getClassTrangThai(status) {
        switch (status) {
            case 0:
                return "alert-danger";
            case 1:
                return "alert-success";
            case 2:
                return "alert-warning";
            default:
                return "";
        }
    }
    //format date
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [day, month, year].join('-');
    }

    function getPageCount( pageSize, sum) {
        if(sum % pageSize == 0) {
            return sum / pageSize;
        }
        return parseInt(sum / pageSize )+ 1;
    }

    var idSP;
    clickDelete();
    function clickDelete() {
        //---------delete product------------
        document.querySelectorAll('.delete-product-item').forEach(function (item) {
            item.addEventListener('click', function (e) {
                var id = e.target.getAttribute('idSP');
                // $('#exampleModalCenter').modal('show');
                sendAjaxCheckDelete(id);
                idSP = id;

            });

        });
    }
    var checkDangGiao = false;
    var checkXoa = false;
    var xacNhan = false;
    var listMHD ;
    function sendAjaxCheckDelete(id) {
        $.ajax({
            url: '<%=request.getContextPath()%>'+'/admin-delete-product',
            type: 'POST',
            data:{
                id: id,
                type:'check'
            },
            success: function (res) {
                checkDangGiao = false;
                checkXoa = false;
                xacNhan = false;
                listMHD = res.listMaHoaDon;
                console.log(listMHD);
                if(res.list.length == 0){
                    checkXoa = true;
                }
                $('.notify-delete-product').html('');
                for (var i = 0; i < res.list.length; i++) {
                    $('.notify-delete-product').append('<p>'+res.list[i]+'</p>');
                    if(res.list[i].indexOf('hóa đơn đang giao') > -1){
                        checkDangGiao = true;
                    }else{
                        xacNhan = true;
                    }
                }
                $('.notify-delete-product').append('<p> bạn có chắc chắn muốn xoá sản phẩm này không?</p>');
                $('#exampleModalCenter').modal('show');

            }
        });


    }
    document.querySelectorAll(".dismis-model-item").forEach(function (item) {
        item.addEventListener('click', function (e) {
            $('#exampleModalCenter').modal('hide');
            $('#notyleModalCenter').modal('hide');
            $('#cancel-order').modal('hide');


        });
    });

    // có 3 trường hơp
    // 1. xoá sản phẩm không có hóa đơn nào
    // 2. xoá sản phẩm có hóa đơn nhưng chưa giao
    // 3. xoá sản phẩm có hóa đơn đang giao

    document.querySelector("#delete-product").addEventListener('click', function (e) {
        $('.notify-delete-product-3').html('');
        if(checkXoa == false){
            if(checkDangGiao){
                if(xacNhan){
                    $('.notify-delete-product-3').append('<p>không thể xóa sản phẩm này do có đơn hàng đang giao.' +
                        'Bạn có muốn hủy các đơn hàng đang chờ' +
                        ' xác nhận và đã xác nhận và tạm ngừng kinh doanh sản phẩm này không</p>');
                }else{
                    $('.notify-delete-product-3').append('<p>không thể xóa sản phẩm này do có đơn hàng đang giao' +
                        ' nhưng bạn có thể tạm ngừng doanh sản phẩm này, ' +
                        'bạn có muốn tạm ngừng kinh doanh sản phẩm này không</p>');
                }

                $('#cancel-order').modal('show');


            }else{
                $('#notyleModalCenter').modal('show');
            }
        }else{
            // 1. xoá sản phẩm không có hóa đơn nào

            sendAjaxDelete(0);

        }


    });

    // 2. xoá sản phẩm có hóa đơn nhưng chưa giao
    document.querySelector('#btn-delete-huy').addEventListener('click', function (e) {

        sendAjaxDelete(1);
    });
    // 3. xoá sản phẩm có hóa đơn đang giao
    document.querySelector("#btn-tam-ngung-kinh-doanh").addEventListener('click', function (e) {
        sendAjaxDelete(2);

    });

    // 0.xóa sản phẩm không có hóa dơn nào
    // 1. xóa sản phẩm có hóa đơn nhưng chưa giao
    // 2. xóa sản phẩm có hóa đơn đang giao

    function sendAjaxDelete(typeDelete) {
        //convert listMHD to json
        var listMHDJson = JSON.stringify(listMHD);

        $.ajax({
            url: '<%=request.getContextPath()%>'+'/admin-delete-product',
            type: 'POST',
            data:{
                id: idSP,
                type:'delete',
                typeDelete:typeDelete,
                listMaHoaDon:listMHDJson
            },
            success: function (res) {
                if(res == 1){
                    pushNotify('success', 'Xóa sản phẩm thành công', 'success');

                }else if(res == 0){
                    pushNotify('warning', 'Xóa sản phẩm thất bại', 'warning');
                }else{
                    pushNotify('success', 'Đã tạm ngừng kinh doanh sản phẩm', 'success');
                }
                //setTimeout
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            }
        });


    }
</script>

</body>
</html>

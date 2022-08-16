<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 18/02/2022
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.projectwebshopping.model.client.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.LoaiSP" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="com.example.projectwebshopping.model.client.BoSuaTap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> productList =(List<Product>) request.getAttribute("products");
    List<LoaiSP> loaiSPS = (List<LoaiSP>) request.getAttribute("loaiSPs");
    int totalPage = (int) request.getAttribute("total");
%>
<html>
<head>
    <title>Danh sách giảm giá</title>
</head>
<body>
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Danh sách sản phẩm giảm giá</h2>

        <div>
            <a href="#" class="btn btn-danger"><i class="material-icons md-remove_circle"></i>Xoá</a>

            <a href="#" class="btn btn-primary" data-toggle="modal"
               data-target="#modalAddDiscount">Chỉnh sửa</a>
        </div>
    </div>

    <div class="card mb-4">
        <header class="card-header">
            <div class="row align-items-center">
<%--                <div class="col col-check flex-grow-0">--%>
<%--                    <div class="form-check ms-2">--%>
<%--                        <input class="form-check-input" type="checkbox" value="">--%>
<%--                    </div>--%>
<%--                </div>--%>
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

                <div class="col-md-6 row d-flex flex-row">
                    <div class="input-group col-6 w-50">
                        <span class="input-group-text">Từ</span>
                        <input id="filter-date-start" type="date" class="form-control">
                    </div>

                    <div class="input-group col-6 w-50">
                        <span class="input-group-text">Đến</span>
                        <input id="filter-date" type="date" class="form-control">
                    </div>
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
                        <th>Giá gốc</th>
                        <th>Giá sell</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th class="text-end">  </th>
                    </tr>
                    </thead>
                    <tbody id="list-product">
                    <%for (int i = 0; i < productList.size();i++){
                        Product product = productList.get(i);
                        Date ngayNhap = product.getNayNhap();
                        double discount = product.getSell();
                        Date ngayBatDau = product.getNgayBatDausell();
                        Date ngayKetThuc = product.getNgayHetHansell();
                    %>
                    <tr>
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="<%=product.getMaSP()%>" onchange="changeCheckbox(this)">
                            </div>
                        </td>
                        <td><%=i%></td>
                        <td style="max-width: 200px"><b ><%=product.getTenSP()%></b></td>
                        <td><%=product.getNamLoaiSP()%></td>
                        <td><%=ProductManager.getInstance().formatPrice(product.getGia())%>đ</td>
                        <td> <%=ProductManager.getInstance().formatPrice(Math.round(product.getGia()*(1-discount)))%>đ</td>
                        <td><%=ngayBatDau.getDate()+"/"+(ngayBatDau.getMonth()+1)+"/"+(ngayBatDau.getYear()+1900)%></td>
                        <td><%=ngayKetThuc.getDate()+"/"+(ngayKetThuc.getMonth()+1)+"/"+(ngayKetThuc.getYear()+1900)%></td>
                        <td class="text-end">

                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i
                                        class="material-icons md-more_horiz"></i> </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Xem chi tiết</a>
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=<%=product.getMaSP()%>">Chỉnh sửa</a>
                                    <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#exampleModalCenter">Xóa</a>
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
<div class="modal fade" id="modalAddDiscount" tabindex="-1" role="dialog" aria-labelledby="modalAddDiscountTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalAddDiscountTitle">Giảm giá sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="row">
                            <label for="product_price_sale" class="form-label">Giá sale</label>
                            <div class="input-group">
                                <input type="number" placeholder="Giá sale" class="form-control" id="product_price_sale"
                                       name="product_price_sale" min="0" max="100" value="0">
                                <div class="input-group-append">
                                    <span class="input-group-text">%</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-2">
                                <label for="product_date_start" class="form-label">Ngày bắt đầu</label>
                                <input type="date" class="form-control" min="2010-02-01" id="product_date_start" name="product_date_start">
                            </div>
                            <div class="mb-4">
                                <label for="product_date_end" class="form-label">Ngày Kết thúc</label>
                                <input type="date" class="form-control" min="2010-02-01" id="product_date_end" name="product_date_end">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                <button type="button" class="btn btn-primary bg-danger" id="btn-add-discount" data-dismiss="modal">Giảm giá</button>
            </div>
        </div>
    </div>
</div>
<script>
    var dateStart;
    var dateEnd;
    var  satus = -1;
    var loai = "Loại";
    var page = 1;
    var total = <%=totalPage%>;
    setNonePageItemChild();
    //event onchange filter-date use dom
    const filterDateEnd = document.getElementById("filter-date");
    const filterDateStart = document.getElementById("filter-date-start");
    filterDateEnd.addEventListener("change", function () {
        dateEnd = this.value;
        console.log('ok end'+dateEnd);
        filterDateStart.max = dateEnd;
        page = -1;
        sendAjax();
        setNonePageItemChild();

    });
    //event onchange filter-date-start use dom
    filterDateStart.addEventListener("change", function () {
        dateStart =  this.value;
        console.log('ok start'+dateStart);
        filterDateEnd.min = dateStart;
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
            url: "<%=request.getContextPath()%>/admin-products-discount",
            type: "POST",
            data: {
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: satus,
                loai: loai,
                serviceName:"getProductDiscount",
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
                    var price = product.gia;
                    var sell = product.sell;
                    $("#list-product").append(' <tr>'+
                        '                        <td>'+
                        '                            <div class="form-check">'+
                        '                                <input class="form-check-input" type="checkbox" value="'+product.maSP+'" onchange="changeCheckbox(this)" >'+
                        '                            </div>'+
                        '                        </td>'+
                        '                        <td>'+count+'</td>'+
                        '                        <td style="max-width: 200px"><b >'+product.tenSP+'</b></td>'+
                        '                        <td>'+product.namLoaiSP+'</td>'+
                        '                        <td>' +formatPrice( price )+ 'đ</td>'+
                        '                        <td>' +formatPrice(Math. round(price*(1-sell))) + 'đ</td>'+
                        '                        <td>' + formatDate(product.ngayBatDausell) + '</td>'+
                        '                        <td>' + formatDate(product.ngayHetHansell) + '</td>'+
                        '                        <td class="text-end">'+

                        '                            <div class="dropdown">'+
                        '                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i'+
                        '                                        class="material-icons md-more_horiz"></i> </a>'+
                        '                                <div class="dropdown-menu">'+
                        '                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Xem chi tiết</a>'+
                        '                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin-detail-product?id=' + product.maSP + '">Chỉnh sửa</a>'+
                        '                                    <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#exampleModalCenter">Xóa</a>'+
                        '                                </div>'+
                        '                            </div> <!-- dropdown //end -->'+
                        '                        </td>'+
                        '                    </tr>');
                    if (listProductCheck.includes(product.maSP)){
                        document.querySelector('input[value="'+product.maSP+'"]').checked =true;
                    }

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
    let listProductCheck=[];
    function changeCheckbox(event){
        let val = event.value;
        if (event.checked&&!listProductCheck.includes(val)){
                listProductCheck.push(val);
            }
        if (!event.checked){
            listProductCheck = listProductCheck.filter(x => x !== val);
        }
        console.log(listProductCheck);
    }

    const discountDOM = document.getElementById('product_price_sale');
    const startDateDOM = document.getElementById('product_date_start');
    const endDateDOM = document.getElementById('product_date_end');
    document.getElementById('btn-add-discount').addEventListener('click', function () {
        let discount = discountDOM.value;
        let startDate = startDateDOM.value;
        let endDate = endDateDOM.value;
        let arrId;
        console.log( discount, startDate, endDate,arrId);
        if(listProductCheck.length == 0){
            pushNotify('warning', 'Bạn chưa chọn sản phẩm nào');
        }else {
            arrId = JSON.stringify(listProductCheck);
            if (discount<=0 && discount>=100){
                pushNotify('warning', 'Vui lòng nhập mức giảm giá từ 0% đến 100%',"Thêm giảm giá");
            }else if (startDate == '' || endDate == ''){
                pushNotify('warning', 'Vui lòng nhập ngày bắt đầu và kết thúc',"Thêm giảm giá");
            }else if (startDate > endDate){
                pushNotify('warning', 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc',"Thêm giảm giá");
            }else{
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin-products-discount',
                    type: 'POST',
                    data: {
                        serviceName: 'add-discount',
                        discount: discount/100,
                        startDate: startDate,
                        endDate: endDate,
                        arrId: arrId
                    },
                    success: function (res) {
                        if (res == 'true') {
                            pushNotify('success', 'Thêm giảm giá thành công',"Giảm giá");
                            discountDOM.value = '';
                            startDateDOM.value = '';
                            endDateDOM.value = '';
                            listProductCheck = [];
                            $('input:checked').prop('checked', false);
                        } else {
                            pushNotify('danger', 'Thêm giảm giá thất bại',"Giảm giá");
                        }
                    }
                });
            }
        }
    });
</script>

</body>
</html>


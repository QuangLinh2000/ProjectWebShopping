<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dto.client.LoaiSPAdmin" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/12/2022
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<LoaiSPAdmin> categories = (List<LoaiSPAdmin>) request.getAttribute("categories");

%>
<html>
<head>
    <title>Thể loại</title>
</head>
<body>
<section class="content-main">
    <div class="content-header">
        <h2 class="content-title">Thể loại</h2>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4 mt-lg-4" >
                    <div>
                        <div class="mb-4">
                            <label for="product_name" class="form-label">Tên</label>
                            <input type="text" placeholder="Nhập tại đây" class="form-control" id="product_name" />
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Mô tả</label>
                            <textarea id="product_mota" placeholder="Nhập tại đây" class="form-control" rows="5"></textarea>
                        </div>
                        <div class="d-grid">
                            <button onclick="clickThem()" class="btn btn-primary">Tạo chuyên mục</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">

                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" />
                                </div>
                            </th>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Mô Tả</th>
                            <th>Số Lượng Sản Phẩm</th>
                            <th>Order</th>
                            <th class="text-end"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        for (int i = 0; i < categories.size(); i++) {
                            LoaiSPAdmin category = categories.get(i);
                            String mota = "";
                            if (category.getMota() != null) {
                                mota = category.getMota();
                            }
                        %>
                        <tr>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" />
                                </div>
                            </td>
                            <td><%=i%></td>
                            <td><b><%=category.getNameLoai()%></b></td>
                            <td><%=mota%></td>
                            <td><%=category.getSoluongSP()%></td>
                            <td><%=category.getSoluongSPBan()%></td>
                            <td class="text-end">
                                <div class="dropdown">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Xem chi tiết</a>
                                        <a class="dropdown-item" href="#">Chỉnh sửa</a>
                                        <a class="dropdown-item text-danger" href="#">Xóa</a>
                                    </div>
                                </div>
                                <!-- dropdown //end -->
                            </td>
                        </tr>

                        <%}%>

                        </tbody>
                    </table>

                </div> <!-- .col// -->
            </div> <!-- .row // -->
        </div> <!-- card body .// -->
    </div> <!-- card .// -->
</section> <!-- content-main end// -->
<script>
    var arr = [];
    <%for (int i = 0; i < categories.size();i++){%>
      arr.push('<%=categories.get(i).getNameLoai()%>');
    <%}%>
    function clickThem(){
        var name = $("#product_name").val();
        var mota = $("#product_mota").val();
        console.log(arr);

        if(name.length == 0){
            pushNotify('warning','Tên loại không được trống','Thêm loại');
            return;
        }
        for (var i = 0; i < arr.length; i++) {
            if(arr[i].toLowerCase() == name.toLowerCase()){
                pushNotify('warning','Tên loại đã tồn tại','Thêm loại');
                return;
            }
        }

        $.ajax({
            url: "<%=request.getContextPath()%>/admin-categories",
            type: "POST",
            data: {
                name: name,
                mota: mota
            },
            success: function(data){
                if(data == 'success') {
                    pushNotify('success', 'Thêm thành công', 'Thêm loại');
                    //settimeout
                    setTimeout(function(){
                        window.location.reload();
                    }, 1000);
                }else{
                    pushNotify('error', 'Thêm thất bại', 'Thêm loại');
                }
            },
            error: function(data){
                pushNotify('error', 'Thêm thất bại', 'Thêm loại');
            }
        });
    }

</script>
</body>
</html>

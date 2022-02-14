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
    System.out.println(categories.size());

%>
<html>

<head>
    <title>Thể loại</title>
    <style>
        .edit-form{
            position: absolute;
            left: 50%;
            transform: translate(-50%,0);
            z-index: 4;
            padding: 10px;
            animation: slideIn 0.5s ease-in;
            display: none;
            min-width: 400px;
            box-shadow: rgba(3, 102, 214, 0.3) 0px 0px 0px 3px;
            background-color: rgb(255, 255, 255);
        }
        @keyframes slideIn{
            from{
                transform: translate(-50%,-70%);
            }
            to{
                transform: translate(-50%,0);
            }
        }
        .card{
            overflow: hidden;
        }
    </style>
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
                        <tr idtype="<%=category.getIdLoai()%>">
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" />
                                </div>
                            </td>
                            <td><%=i%></td>
                            <td class="typename"><b><%=category.getNameLoai()%></b></td>
                            <td class="typedecription"><%=mota%></td>
                            <td><%=category.getSoluongSP()%></td>
                            <td><%=category.getSoluongSPBan()%></td>
                            <td class="text-end">
                                <div class="dropdown">
                                    <a href="#" data-bs-toggle="dropdown" class="btn btn-light"> <i class="material-icons md-more_horiz"></i> </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Xem chi tiết</a>
                                        <a onclick="showForm(this)" class="edit-button dropdown-item" href="#">Chỉnh sửa</a>
                                        <a class="dropdown-item text-danger" href="#">Xóa</a>
                                    </div>
                                </div>
                                <!-- dropdown //end -->
                            </td>
                        </tr>

                        <%}%>
                        <div class="edit-form">
                            <div class="mb-1 "><b>Sửa Đổi</b></div>
                            <label for="typename-new">Tên</label>
                            <input type="text" id="typename-new" class="form-control mb-3">
                            <label for="decription-new">Mô Tả</label>
                            <input type="text" class="form-control mb-2" id="decription-new">
                            <input type="button" value="Hủy" class="btn btn-light btn-cancel">
                            <input  type="submit" value="Sửa" class="btn btn-primary m-2 btn-submit">
                        </div>
                        </tbody>
                    </table>

                </div> <!-- .col// -->
            </div> <!-- .row // -->
        </div> <!-- card body .// -->
    </div> <!-- card .// -->
</section> <!-- content-main end// -->
<script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>
<!--open form-->
<script>
    $('.btn-cancel').click(function(){
        $('.edit-form').removeClass('d-block')
    })

    $('.btn-submit').click(function(){
        $('.edit-form').removeClass('d-block')
    })
    $('.edit-button').click(function(){
        $('.edit-form').addClass('d-block')
    })
</script>
<script>
    var arr = [];
    <%for (int i = 0; i < categories.size();i++){%>
      arr.push('<%=categories.get(i).getNameLoai()%>');
    <%}%>
    function clickThem(){
        var name = $("#product_name").val();
        var mota = $("#product_mota").val();

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
                mota: mota,
                action: 'add'
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
    function showForm(e){

        var id=$(e).closest("tr").attr("idtype");
        document.querySelector(".btn-submit").addEventListener("click",function (){
            clickSua(id)
        })

    }
    function clickSua(id){
        var name = document.getElementById("typename-new").value;
        var mota = document.getElementById("decription-new").value;
        alert(name)
        $.ajax({
            url: "<%=request.getContextPath()%>/admin-categories",
            type: "POST",
            data: {
                name: name,
                mota: mota,
                action: 'edit',
                idtype:id
            },
            success: function(data){
                if(data == 'success') {
                    pushNotify('success', 'Sửa thành công', 'Sửa loại');
                    //settimeout
                    setTimeout(function(){
                        window.location.reload();
                    }, 1000);
                }else{
                    pushNotify('error', 'Sửa thất bại', 'Sửa loại');
                }
            },
            error: function(data){
                pushNotify('error', 'Sửa thất bại', 'Sửa loại');
            }
        });
    }
</script>

</body>
</html>

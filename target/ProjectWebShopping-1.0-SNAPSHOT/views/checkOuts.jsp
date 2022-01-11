<<<<<<< HEAD
<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.dto.client.CartProduct" %>
<%@ page import="com.example.projectwebshopping.model.client.CartJson" %>
<%@ page import="com.example.projectwebshopping.model.client.ProductManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.projectwebshopping.model.client.User" %>
<%@ page import="com.example.projectwebshopping.model.client.KhachHang" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkOuts.css">
<%
    List<CartJson> carts= (List<CartJson>) request.getAttribute("list_cart");
    KhachHang khachHang= (KhachHang) request.getAttribute("khachHang");
    User user= (User) request.getSession().getAttribute("userLognin");
    if (carts==null) {
        carts=new ArrayList<>();
    }
    double total=0;
    for(CartJson cart: carts){
        total+=cart.getPrice()*cart.getQuantity();
    }
%>

<div class="container">
    <div class="top">
        <div class="top-title-container">
            <p class="title-top title-top-start">Giỏ hàng</p>
            <p class="title-top title-top-betwent ">Thông tin vận chuyển</p>
            <p class="title-top title-top-end">Thanh toán</p>

        </div>
        <div class="top-container">
            <div class="icon-top-container">
                <div class="item-top-icon">
                    <div class="icon-top">
                        <i class="fa fa-shopping-cart"></i>
                    </div>

                </div>

                <div class="bar-top bar-top-1"></div>
            </div>

            <div class="icon-top-container">
                <div class="item-top-icon">
                    <div class="icon-top">
                        <i class="fa-solid fa-truck-fast"></i>
                    </div>
                </div>
                <div class="bar-top"></div>

            </div>
            <div class="icon-top-container end">
                <div class="item-top-icon">

                    <div class="icon-top">
                        <i class="fa fa-credit-card"></i>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <%if (carts.size() > 0){%>
    <div class="end-container-bottom">
        <div class="content-left">
            <p class="title-content-left">Thông tin thanh toán</p>
            <div class="box-content-left">
                <div class="input-item-content-box">
                    <input id="name-customer" onkeyup="checkName(this)" class="input-item" placeholder="Họ và Nhập tại đây" type="text" pattern="^((\s*[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+\s*)+)$">
                    <div class="error-box">
                        <p class="error-text">Họ và tên không được để trống</p>
                    </div>
                </div>
                <div class="input-item-content-box" >
                    <input id="email-customer" value="<%=user.getEmail()%>" onkeyup="checkEmail(this)" class="input-item" placeholder="Email" type="email" pattern="^(\w+@gmail.com)$">
                    <div class="error-box">
                        <p class="error-text">Email không được để trống</p>
                    </div>
                </div>
                <div  class="input-item-content-box">
                    <input  id="phone-customer" onkeyup="checkPhone(this)" class="input-item" placeholder="Điện Thoại" type="number" pattern="^(^0\d{8,})$">
                    <div class="error-box">
                        <p class="error-text">Số điện thoại không được để trống</p>
                    </div>
                </div>
                <div class="input-item-content-box">
                    <input id="address-customer"  class="input-item" placeholder="Địa chỉ" type="text">
                    <div class="error-box">
                        <p class="error-text">Địa chỉ không được để trống</p>
                    </div>
                </div>

                <div class="dia-diem">
                    <div class="input-item-content-box">
                        <select class="diem-diem-item" onChange="clickTinhThanhPho(this)" id="tinh-thanh-pho" >
                            <option   value="">Tỉnh/Thành Phố</option>
                        </select>
                        <div class="error-box">
                            <p class="error-text">không được để trống</p>
                        </div>
                    </div>
                    <div class="input-item-content-box">
                        <select class="diem-diem-item" onchange="clickQuanHuyen(this)"   id="quan-huyen" >
                            <option   value="">Quận/Huyện</option>
                        </select>
                        <div class="error-box">
                            <p class="error-text">không được để trống</p>
                        </div>
                    </div>
                    <div class="input-item-content-box">

                        <select class="diem-diem-item" id="phuong-xa" >
                            <option   value="">Phường/xã</option>
                        </select>
                        <div class="error-box">
                            <p class="error-text">không được để trống</p>
                        </div>
                    </div>

                </div>
                <div class="button-click">
                    <a href="<%=request.getContextPath()%>/cart"><input class="billing_address billing_address_1" type="button" value="Giỏ hàng"></a>
                    <input class="billing_address billing_address_2" type="button" value="Đặt Hàng">
                </div>


            </div>
        </div>
        <div class="bettwent-content"></div>
        <div class="content-right-box">
            <p class="title-content-right">Sản Phẩm</p>
            <div class="box-item-content-right">
                <%for (int i = 0; i < carts.size();i++){
                    CartJson cart=carts.get(i);
                %>
                <div class="item-content-right">
                    <img class="img-item-content-right" src="<%=request.getContextPath()%><%=cart.getImg()%>" alt="">
                    <p class="name-product-item"><%=cart.getName()%><br>
                        size: <%=cart.getSize()%> </p>
                    <input disabled min="1" class="so-luong" value="<%=cart.getQuantity()%>" type="number">
                    <p class="price-product-item"><%=ProductManager.getInstance().formatPrice(cart.getPrice()*cart.getQuantity())%>đ</p>
                </div>
                <%}%>
            </div>
            <div class="bar-content-right-box"></div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out">Tạm tính</p>
                <p class="title-right-check-out"><%=ProductManager.getInstance().formatPrice(total)%>đ</p>

            </div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out">Phí ship</p>
                <p class="title-right-check-out">0 đ</p>
            </div>
            <div class="bar-content-right-box"></div>
            <div class="box-check-out-mony">
                <p class="title-left-check-out title-left-check-out-sum">Tổng tiền</p>
                <p class="title-right-check-out"><%=ProductManager.getInstance().formatPrice(total)%>đ</p>

            </div>
        </div>


    </div>
    <%}else{%>
    <div class="list-cart-zero">
        <h1>Vui lòng chọn sản Phẩm để thanh toán</h1>

    </div>
    <%}%>
</div>

<script >
    <%if(carts.size()>0){%>

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
    document.querySelectorAll('.input-item-content-box .input-item').forEach(function (item) {
        item.addEventListener('keyup', function () {
            let err = item.closest('.input-item-content-box').querySelector('.error-box')

            if (err) {
                if (item.value.trim() === '' || checkPattern(item)===false) {
                    err.classList.add('active');

                } else {
                    err.classList.remove('active');

                }
            }
        });

    });
    document.getElementsByClassName('billing_address_2')[0].addEventListener('click', function () {
        clickDatHang();

        document.querySelectorAll('.input-item-content-box .input-item').forEach(function (item) {
            let err = item.closest('.input-item-content-box').querySelector('.error-box')
            if(err) {
                if (item.value.trim() === '') {
                    err.classList.add('active');
                } else {
                    err.classList.remove('active');
                }
            }
        });
        document.querySelectorAll('.dia-diem .diem-diem-item').forEach(function (item) {
            select_event(item);
        });
    });
    //fuction event select != index 1
    function select_event(select) {
        let index = select.selectedIndex;
        let err = select.closest('.input-item-content-box').querySelector('.error-box')
        // get index select
        if (index===0) {
            err.classList.add('active');
        }else {
            err.classList.remove('active');
        }
    }
    document.querySelectorAll('.dia-diem .diem-diem-item').forEach(function (item) {
        item.addEventListener('change', function () {
            select_event(item);
        });
    });

    <%if(khachHang!=null){%>
    $("#name-customer").val("<%=khachHang.getTenKH()%>");
    $("#phone-customer").val("<%=khachHang.getSdt()%>");
    $("#address-customer").val("<%=khachHang.getDiaChi()%>");


    <%}%>

    function clickDatHang() {
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
        if(name.trim().length > 0 && phone.trim().length > 0
            && checkEmailp(email)
            &&checkPhonep(phone)
            && address.trim().length > 0
            && tinhTP.trim().length > 0
            && quanHuyen.trim().length > 0 && phuongXa.trim().length > 0) {

            //ajax
            $.ajax({
                url: "<%=request.getContextPath()%>/check-outs",
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
                        alert("Đặt hàng thành công");
                        <%--window.location.href = "<%=request.getContextPath()%>/dat-hang-thanh-cong";--%>
                    } else {
                        alert("Đặt hàng thất bại");
                    }
                }
            });
        }

    }
    //check format email
    function checkEmailp(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }
    //check format phone
    function checkPhonep(phone) {
        var re = /^[0-9]{10,11}$/;
        return re.test(String(phone).toLowerCase());
    }

    // handled input form
    function checkPattern(element){
        let patterns=new RegExp(element.pattern);
        let check=(patterns).test(element.value);
        return check
    }
    function checkName(element) {
        let check=checkPattern(element)
        let err = element.closest('.input-item-content-box').querySelector('.error-box')
        if(check==false) {
            element.style.border="2px solid red"
            err.innerHTML="<p class='error-text'>Họ và Tên chỉ gồm chữ và khoảng trắng</p>"
        }
        else {
            element.style.border="1px solid rgb(197, 192, 192)"
            err.innerHTML="<p class='error-text'></p>"
        }
    }
    function checkEmail(element) {
        let check=checkPattern(element)
        let err = element.closest('.input-item-content-box').querySelector('.error-box')
        if (check == false) {
            element.style.border = "2px solid red"
            err.innerHTML="<p class='error-text'>Email không đúng định dạng</p>"
        } else {
            element.style.border = "1px solid rgb(197, 192, 192)"
            err.innerHTML="<p class='error-text'></p>"
        }
    }
    function checkPhone(element) {
        let check=checkPattern(element)
        let err = element.closest('.input-item-content-box').querySelector('.error-box')
        if (check == false) {
            element.style.border = "2px solid red"
            err.innerHTML="<p class='error-text'>Chúng tôi không thể định dạng được số điện thoại này. Vui lòng nhập lại !</p>"
        } else {
            element.style.border = "1px solid rgb(197, 192, 192)"
            err.innerHTML="<p class='error-text'></p>"
        }
    }
    <%}%>

</script>
</html>
=======
>>>>>>> 2b819c5a93529932662037116bcd0126ebf77166

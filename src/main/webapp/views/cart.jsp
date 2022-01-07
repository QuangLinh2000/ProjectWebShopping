<%@ page import="java.util.List" %>
<%@ page import="com.example.projectwebshopping.model.client.Cart" %>
<%@ page import="com.example.projectwebshopping.dto.client.CartProduct" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
  List<CartProduct> cartProductList = (List<CartProduct>) request.getAttribute("cartList");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
  <section id="cart" class="margin-top-mobile">
    <div class="container">
      <div class="cart-holder">
        <div class="row">
          <div class="col-sm-8">
            <div class="card">
              <div class="card-body">
                <div class="cart-name">
                  <div class="wrapper-checkbox">
                    <label class="checkbox path">
                      <input type="checkbox" id="check-all">
                      <svg viewBox="0 0 21 21">
                        <path
                                d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186">
                        </path>
                      </svg>
                    </label>
                  </div>
                  <h2>Giỏ hàng</h2>
                </div>
                <ul class="cart-list">
                 <%
                   for (int i = 0; i< cartProductList.size(); i++) {
                     CartProduct cartProduct = cartProductList.get(i);
                  %>
                  <li class="cart-item">
                    <div class="cart-item-holder">
                      <div class="wrapper-checkbox">
                        <label class="checkbox path">
                          <input class="choose-product" value="<%=cartProduct.toString()%>" type="checkbox" >
                          <svg viewBox="0 0 21 21">
                            <path
                                    d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186">
                            </path>
                          </svg>
                        </label>
                      </div>
                      <div class="cart-item-img">
                        <img src="<%=request.getContextPath()%><%=cartProduct.getImage()%>" alt="">
                      </div>
                      <div class="cart-item-content">
                        <div class="cart-item-warper">
                          <div class="cart-item-price-holder">
                            <span class="cart-item-price">
                              <%=cartProduct.getPrice()-cartProduct.getPrice()*cartProduct.getSale()%>
                              đ</span>
                          </div>
                          <p class="cart-item-name">
                            <%=cartProduct.getName()%>
                          </p>
                          <div class="cart-item-variants">
                            <span class="cart-item-color"><%=cartProduct.getMau()%></span>
                            <div class="size">
                              <select name="size" class="size-select">
                                <%if(cartProduct.getSize().equals("S")){%>
                                <option selected  value="s">S</option>
                                <option value="m">M</option>
                                <option value="l">L</option>
                                <option value="xl">XL</option>
                                <%}%>
                                <%if(cartProduct.getSize().equals("M")){%>
                                <option   value="s">S</option>
                                <option selected value="m">M</option>
                                <option value="l">L</option>
                                <option value="xl">XL</option>
                                <%}%>
                                <%if(cartProduct.getSize().equals("L")){%>
                                <option   value="s">S</option>
                                <option value="m">M</option>
                                <option selected value="l">L</option>
                                <option value="xl">XL</option>
                                <%}%>
                                <%if(cartProduct.getSize().equals("XL")){%>
                                <option   value="s">S</option>
                                <option value="m">M</option>
                                <option value="l">L</option>
                                <option selected value="xl">XL</option>
                                <%}%>

                              </select>
                            </div>
                            <div class="cart-item-qty-holder">
                              <div class="qty-minus btn-qty">
                                <i class="fa-solid fa-minus"></i>
                              </div>
                              <input type="number" class="cart-item-qty" value="<%=cartProduct.getSoLuong()%>"
                                     min="1" max="<%=cartProduct.getS()%>">
                              <div class="qty-plus btn-qty">
                                <i class="fa-solid fa-plus"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="cart-item-save">
                          <i class="fa-regular fa-heart">
                          </i>
                          <span>Lưu lại sau</span>
                        </div>
                      </div>
                      <a class="btn-remover">
                        <i class="fa-solid fa-xmark"></i>
                      </a>
                    </div>
                  </li>
                  <%}%>

                </ul>
                <div class="sub-total-1-holder">
                  <span class="sub-total-title-1">Tổng cộng</span>
                  <span class="cart-total-price-1">195,000đ</span>

                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="body-left">
              <div class="check-cart-total">
                <h2 class="check-title">Tóm tắt đơn hàng</h2>
                <div class="sub-total">
                  <span class="cart-total-title">Tổng cộng</span>
                  <span class="cart-total-price">195,000đ</span>
                </div>
                <a class="btn-cart btn-total-checkout">Đặt hàng</a>
                <a  class="btn-cart btn-continue-shopping">Tiếp tục mua hàng</a>

              </div>
              <div class="bag-payment-options">
                <h3 class="text-accept">Chúng tôi chấp nhận:</h3>
                <img src="<%=request.getContextPath()%>/img/cart/list-img-pay.png" alt="">
                <p>Sử dụng mã giảm giá ở bước tiếp theo.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- create grid layout -->


  </section>
  <script>
    const checkAll = document.getElementById("check-all");
    const check = document.querySelectorAll('.cart-item input[type="checkbox"]');
    checkAll.addEventListener("click", function () {
      if (checkAll.checked) {
        check.forEach(function (item) {
          item.checked = true;
        });
      } else {
        check.forEach(function (item) {
          item.checked = false;
        });
      }
    });


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
        position: 'right bottom',
        customWrapper: '',
      })
    }

  </script>
  <script src="<%=request.getContextPath()%>/script/cart.js"></script>


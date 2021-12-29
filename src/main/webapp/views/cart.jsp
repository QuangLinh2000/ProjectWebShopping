<%--
  Created by IntelliJ IDEA.
  User: trong
  Date: 29/12/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
    <title>Cart</title>
    <script src="https://kit.fontawesome.com/936c874066.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
  </head>
  <body>
  <%@ include file="../views/Header.jsp" %>

  <section id="cart" class="margin-top-mobile">
    <div class="container">
      <div class="cart-holder">
        <div class="row">
          <div class="col-sm-8">
            <div class="card">
              <div class="card-body">
                <div class="cart-name">
                  <h2>Giỏ hàng</h2>
                </div>
                <ul class="cart-list">
                  <li class="cart-item">
                    <div class="cart-item-holder">
                      <div class="cart-item-img">
                        <img src="<%=request.getContextPath()%>/img/cart/cart-1.jpg" alt="">
                      </div>
                      <div class="cart-item-content">
                        <div class="cart-item-warper">
                          <div class="cart-item-price-holder">
                                                        <span class="cart-item-price">
                                                            500,000đ
                                                        </span>
                          </div>
                          <p class="cart-item-name">
                            Áo Khoác Manto Dáng Dài
                          </p>
                          <div class="cart-item-variants">
                            <span class="cart-item-color">White</span>
                            <div class="size">
                              <select name="size" class="size-select">
                                <option value="xs">S</option>
                                <option value="s">Xs</option>
                                <option value="m">L</option>
                                <option value="l">M</option>
                              </select>
                            </div>
                            <div class="cart-item-qty-holder">
                              <div class="qty-minus btn-qty">
                                <i class="fa-solid fa-minus"></i>
                              </div>
                              <input type="number" class="cart-item-qty" value="1"
                                     min="1"></input>
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
                  <li class="cart-item">
                    <div class="cart-item-holder">
                      <div class="cart-item-img">
                        <img src="<%=request.getContextPath()%>/img/cart/cart-1.jpg" alt="">
                      </div>

                      <div class="cart-item-content">
                        <div class="cart-item-warper">
                          <div class="cart-item-price-holder">
                                                        <span class="cart-item-price cart-item-price-markerdown">
                                                            400,000đ
                                                        </span>
                            <span class="cart-item-price--prev">
                                                            500,000đ
                                                        </span>
                          </div>
                          <p class="cart-item-name">
                            Áo Khoác Manto Dáng Dài
                          </p>
                          <div class="cart-item-variants">
                            <span class="cart-item-col">White</span>
                            <div class="size">
                              <select name="size" class="size-select">
                                <option value="xs">S</option>
                                <option value="s">Xs</option>
                                <option value="m">L</option>
                                <option value="l">M</option>
                              </select>
                            </div>
                            <div class="cart-item-qty-holder">
                              <div class="qty-minus btn-qty">
                                <i class="fa-solid fa-minus"></i>
                              </div>
                              <input type="number" class="cart-item-qty" value="1"
                                     min="1"></input>
                              <div class="qty-plus btn-qty">
                                <i class="fa-solid fa-plus"></i>
                              </div>
                            </div>
                          </div>

                        </div>
                        <div class="cart-item-save">
                          <i class="fa-regular fa-heart"></i>
                          <span>Lưu lại sau</span>

                        </div>
                      </div>
                      <a class="btn-remover">
                        <i class="fa-solid fa-xmark"></i>
                      </a>
                    </div>
                  </li>
                  <li class="cart-item">
                    <div class="cart-item-holder">
                      <div class="cart-item-img">
                        <img src="<%=request.getContextPath()%>/img/cart/cart-1.jpg" alt="">
                      </div>

                      <div class="cart-item-content">
                        <div class="cart-item-warper">
                          <div class="cart-item-price-holder">
                                                        <span class="cart-item-price cart-item-price-markerdown">
                                                            400,000đ
                                                        </span>
                            <span class="cart-item-price--prev">
                                                            500,000đ
                                                        </span>
                          </div>
                          <p class="cart-item-name">
                            Áo Khoác Manto Dáng Dài
                          </p>
                          <div class="cart-item-variants">
                            <span class="cart-item-col">White</span>
                            <div class="size">
                              <select name="size" class="size-select">
                                <option value="xs">S</option>
                                <option value="s">Xs</option>
                                <option value="m">L</option>
                                <option value="l">M</option>
                              </select>
                            </div>
                            <div class="cart-item-qty-holder">
                              <div class="qty-minus btn-qty">
                                <i class="fa-solid fa-minus"></i>
                              </div>
                              <input type="number" class="cart-item-qty" value="1"
                                     min="1"></input>
                              <div class="qty-plus btn-qty">
                                <i class="fa-solid fa-plus"></i>
                              </div>
                            </div>
                          </div>

                        </div>
                        <div class="cart-item-save">
                          <i class="fa-regular fa-heart"></i>
                          <span>Lưu lại sau</span>

                        </div>
                      </div>
                      <a class="btn-remover">
                        <i class="fa-solid fa-xmark"></i>
                      </a>
                    </div>
                  </li>
                  <li class="cart-item">
                    <div class="cart-item-holder">
                      <div class="cart-item-img">
                        <img src="<%=request.getContextPath()%>/img/cart/cart-1.jpg" alt="">
                      </div>

                      <div class="cart-item-content">
                        <div class="cart-item-warper">
                          <div class="cart-item-price-holder">
                                                        <span class="cart-item-price cart-item-price-markerdown">
                                                            400,000đ
                                                        </span>
                            <span class="cart-item-price--prev">
                                                            500,000đ
                                                        </span>
                          </div>
                          <p class="cart-item-name">
                            Áo Khoác Manto Dáng Dài
                          </p>
                          <div class="cart-item-variants">
                            <span class="cart-item-col">White</span>
                            <div class="size">
                              <select name="size" class="size-select">
                                <option value="xs">S</option>
                                <option value="s">Xs</option>
                                <option value="m">L</option>
                                <option value="l">M</option>
                              </select>
                            </div>
                            <div class="cart-item-qty-holder">
                              <div class="qty-minus btn-qty">
                                <i class="fa-solid fa-minus"></i>
                              </div>
                              <input type="number" class="cart-item-qty" value="1"
                                     min="1"></input>
                              <div class="qty-plus btn-qty">
                                <i class="fa-solid fa-plus"></i>
                              </div>
                            </div>
                          </div>

                        </div>
                        <div class="cart-item-save">
                          <i class="fa-regular fa-heart"></i>
                          <span>Lưu lại sau</span>

                        </div>
                      </div>
                      <a class="btn-remover">
                        <i class="fa-solid fa-xmark"></i>
                      </a>
                    </div>
                  </li>
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
                <a href="" class="btn-cart btn-total-checkout">Đặt hàng</a>
                <a href="" class="btn-cart btn-continue-shopping">Tiếp tục mua hàng</a>
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

  <%@include file="../views/footer.jsp"%>
  <%@include file="../views/footer.jsp"%>
  <script src="<%=request.getContextPath()%>/script/header.js"></script>
  <script src="<%=request.getContextPath()%>/script/cart.js"></script>

  </body>
</html>

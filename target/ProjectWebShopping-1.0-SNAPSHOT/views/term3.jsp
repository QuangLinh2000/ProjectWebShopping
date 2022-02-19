<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="wrapper margin-top-mobile">
        <div class="menu__bar margin-top-mobile">
            <div class="menu__content">
            <div>
                <H3 class="menu__bar-title" onclick="showMenu(this);"><span>THÔNG TIN
                    <div class="show-item"></div>
                </span>
                </H3>
            </div>
            <div id="menu__bar-list">
                <ul >
                    <a href="<%=request.getContextPath()%>/term?index=1"><li class="menu__bar-list-item" >Điều khoản sử dụng</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=2"><li class="menu__bar-list-item">Hướng dẫn thanh toán</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=3"><li class="menu__bar-list-item select">Hướng dẫn mua hàng</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=4"><li class="menu__bar-list-item">Chính sách vận chuyển</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=5"><li class="menu__bar-list-item">Chính sách đổi trả</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=6"><li class="menu__bar-list-item">Chính sách bán hàng và bảo hành</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=7"><li class="menu__bar-list-item">Chính sách bảo mật</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=8"><li class="menu__bar-list-item">Quyền lợi sinh nhật khách hàng</li></a>
                </ul>
            </div>
            </div>
        </div>
        <div class="content">
            <div class="content-header">
                <h4>HƯỚNG DẪN MUA HÀNG</h4>
                <p>
                    - Quý khách chọn xem chi tiết các mẫu sản phẩm tại website: sevenam.vn
                    - Khi đã tìm được sản phẩm quan tâm và phù hợp, Quý khách có thể đặt hàng theo các hình thức sau đây:
                </p>
            </div>
            <div class="content-detail">
            <div class="content-main">
                <p class="content-main-title"><strong>A. HÌNH THỨC MUA HÀNG TRỰC TUYẾN</strong></p>
                <p class="content-main-text">
                    - Chọn kích cỡ, màu sắc, số lượng sản phẩm rồi click vào nút “Mua hàng ngay” để đưa sản phẩm vào giỏ hàng của mình.
                    - Để lựa chọn thêm sản phẩm khác, vui lòng click vào nút  “Tiếp tục mua hàng”. Nếu không, Quý khách vui lòng click vào nút “Gửi đơn hàng”  để tiếp tục quy trình mua hàng và thanh toán.
                    <p>
                    Xem thêm: <a href="" style="text-decoration: underline;"> Phương thức thanh toán</a>
                    </p>           </p>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>B. HÌNH THỨC MUA HÀNG QUA ĐIỆN THOẠI</strong></p>
                <p class="content-main-text">
                    - Chọn kích cỡ, màu sắc, số lượng sản phẩm, sau đó gọi hoặc gửi tin nhắn cho Seven.AM vào số hotline: <span class="contact">092.405.8888</span> để đặt hàng, nhân viên của Seven.AM sẽ liên hệ lại để xác nhận thông tin sản phẩm của và hướng dẫn Quý khách chuyển khoản thanh toán.

        (*) Nếu chọn hình thức mua hàng qua điện thoại, Quý khách vui lòng bỏ qua bước "Gửi đơn hàng"
                </p>
            </div>
            </div>
        </div>
    </div>

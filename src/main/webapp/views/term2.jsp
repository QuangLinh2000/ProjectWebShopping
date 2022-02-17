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
                    <a href="<%=request.getContextPath()%>/term?index=2"><li class="menu__bar-list-item select">Hướng dẫn thanh toán</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=3"><li class="menu__bar-list-item">Hướng dẫn mua hàng</li></a>
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
                <h4>Hướng dẫn thanh toán</h4>
                <p>
                    Khách hàng mua sản phẩm tại website có thể lựa chọn 1 trong 2 hình thức thanh toán sau:
                </p>
            </div>
            <div class="content-detail">
            <div class="content-main">
                <p class="content-main-title"><strong>1. SHIP COD TẠI NHÀ:</strong></p>
                <p class="content-main-text">
                    Ship COD tại nhà là hình thức khách hàng thanh toán khi nhận hàng.
                    Với hình thức thanh toán qua ship COD tại nhà, Quý khách vui lòng thanh toán đơn hàng và chi phí ship theo quy định của công ty cho bên giao vận.
                </p>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>2. THANH TOÁN CHUYỂN KHOẢN TRƯỚC:</strong></p>
                <p class="content-main-text">
                    Với thanh toán chuyển khoản trước, Quý khách vui lòng chọn một trong số các tài khoản sau đây:

        Chủ tài khoản: Công ty cổ phần HBD

        TK số 1251 000 2000 500 - BIDV chi nhánh Đông Đô

        TK số 116002 808 980 - Vietinbank chi nhánh Đống Đa

        TK số 101 501 5326 - Vietcombank chi nhánh Hà Nội

        Nội dung chuyển khoản: Tên người chuyển khoản + số điện thoại + mã đơn hàng hoặc mã sản phẩm.

        Ngay sau khi nhận được tiền chuyển vào tài khoản, Seven.AM sẽ tiến hành lập đơn hàng và giao hàng ngay cho Quý khách.

        Lưu ý:

        Với cả hai hình thức thanh toán, Seven.AM sẽ liên hệ với Quý khách qua email & điện thoại để xác nhận về đơn hàng & số tiền Quý khách cần thanh toán. Nếu Quý khách chưa nhận được thông tin xác nhận, vui lòng liên hệ lại với Seven.AM & không thực hiện thanh toán trước khi nhận được xác nhận đơn hàng.

        Khi mua sắm trên website, nếu còn bất kì câu hỏi nào về đơn hàng, hướng dẫn thanh toán, giao hàng, xin Quý khách vui lòng liên hệ với Seven.AM qua hotline: <span class="contact">092.405.8888</span>

        Trân trọng cám ơn!
                </p>
            </div>
            </div>
        </div>
    </div>

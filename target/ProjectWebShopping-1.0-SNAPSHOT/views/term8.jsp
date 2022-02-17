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
                    <a href="<%=request.getContextPath()%>/term?index=3"><li class="menu__bar-list-item">Hướng dẫn mua hàng</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=4"><li class="menu__bar-list-item">Chính sách vận chuyển</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=5"><li class="menu__bar-list-item">Chính sách đổi trả</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=6"><li class="menu__bar-list-item">Chính sách bán hàng và bảo hành</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=7"><li class="menu__bar-list-item">Chính sách bảo mật</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=8"><li class="menu__bar-list-item select">Quyền lợi sinh nhật khách hàng</li></a>
                </ul>
            </div>
            </div>
        </div>
        <div class="content">
            <div class="content-header">
                <h4>QUYỀN LỢI SINH NHẬT</h4>
                <p class="content-main-text">
                    Nhằm tri ân với các Quý khách hàng đã tin tưởng và sử dụng sản phẩm, Seven.AM
                    trân trọng dành tặng Quý khách hàng trong tháng sinh nhật món quà tri ân như sau:
                </p>
                <ul class="content-main-text">
                    <li>
                        Từ 01 điểm – dưới 05 điểm: Chiết khấu 500.000đ với hóa đơn nguyên giá từ 1 triệu đồng trở lên.
                    </li>
                    <li>
                        Từ 05 điểm – dưới 10 điểm: Chiết khấu 800.000đ với hóa đơn nguyên giá từ 1.5 triệu đồng trở lên.
                    </li>
                    <li>
                        Khách VIP Bạc: Chiết khấu 50% 1 sản phẩm nguyên giá.
                    </li>
                    <li>
                        Khách VIP Vàng: Chiết khấu 50% 2 sản phẩm nguyên giá.
                    </li>
                    <li>
                        Khách VIP Ruby:
                        <p class="content-main-text">
                            - Điểm từ 40 - dưới 80 điểm: Chiết khấu 50% 3 sản phẩm nguyên giá và tặng 01 thẻ quà tặng 500.000đ mua hàng nguyên giá
                        </p>
                        <p class="content-main-text">
                            - Điểm từ 80 - dưới 100 điểm: Chiết khấu 50% 3 sản phẩm nguyên giá và tặng 01 thẻ quà tặng 1.000.000đ mua hàng nguyên giá
                        </p>
                    </li>
                    <li>
                        Khách VIP Kim cương:
                        <p class="content-main-text">
                            - Điểm từ 100 – dưới 200 điểm: Chiết khấu 50% 4 sản phẩm nguyên giá, tặng 01 thư chúc mừng tương ứng với 1 sản phẩm trị giá 1.500.000đ
                        </p>
                        <p class="content-main-text">
                            - Điểm từ 200 - dưới 400 điểm: Chiết khấu 50% 5 sản phẩm nguyên giá, tặng 01 thư chúc mừng tương ứng với 1 sản phẩm trị giá 2.000.000đ.
                        </p>
                        <p class="content-main-text">
                            - Điểm từ 400 điểm trở lên: Chiết khấu 50% 6 sản phẩm nguyên giá, tặng 01 thư chúc mừng tương ứng 1 sản phẩm trị giá 3.000.000đ
                        </p>
                    </li>
                </ul>
            </div>
            <div class="content-detail">
            <div class="content-main">
                <p class="content-main-title"><strong>* Lưu ý</strong></p>
                    <ul  class="content-main-text">
                        <li>
                            Quý khách chỉ được hưởng ưu đãi sinh nhật khi mang theo CMND hoặc giấy tờ tùy thân có ảnh.
                        </li>
                        <li>
                            Ưu đãi sinh nhật chỉ áp dụng với sản phẩm nguyên giá (Không áp dụng với dòng sản phẩm Manto khâu tay cao cấp).
                        </li>
                        <li>
                            Dòng sản phẩm Manto khâu tay cao cấp chỉ áp dụng cùng ưu đãi thẻ VIP, không áp dụng cùng ưu đãi sinh nhật, chương trình khuyến mại và các ưu đãi khác.
                        </li>
                        <li>
                            Thẻ quà tặng sinh nhật chỉ áp dụng cùng chiết khấu thẻ VIP. Không áp dụng đồng thời cùng các ưu đãi khác (Ưu đãi sinh nhật, chương trình khuyến mại, voucher...)
                        </li>
                        <li>
                            Từ 02 sản phẩm giảm 50% áp dụng cho 01 hóa đơn hoặc mua rời ngày, chỉ sử dụng trong tháng sinh nhật.
                        </li>
                        <li>
                            Đối với khách hàng VIP Ruby và Kim cương: Khách hàng được nhận thẻ quà tặng/sản phẩm tặng khi có phát sinh mua hàng trong 03 tháng trước thời điểm sinh nhật.
                        </li>
                        <li>
                            Sản phẩm tặng trên thư chúc mừng không có giá trị quy đổi thành tiền mặt.
                        </li>
                    </ul>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>2. CÁC TRƯỜNG HỢP KHÔNG ÁP DỤNG CHÍNH SÁCH ĐỔI TRẢ</strong></p>
                <ul  class="content-main-text">
                    <li>
                        Sản phẩm mua quá thời gian 30 ngày và mua trong chương trình khuyến mại giảm giá từ 50% trở lên
                    </li>
                    <li>
                        Sản phẩm phụ kiện: Áo lót, quần lót, áo nửa người, áo quây, quần tất, quần gen..
                    </li>
                    <li>
                        Sản phẩm đã bị thay đổi thiết kế so với thiết kế ban đầu.
                    </li>
                </ul>
                <p>MỌI Ý KIẾN ĐÓNG GÓP HOẶC CẦN HỖ TRỢ KHIẾU NẠI, QUÝ KHÁCH VUI LÒNG LIÊN HỆ HOTLINE: <span class="contact">1900 633 694</span></p>
            </div>
            </div>
        </div>
    </div>

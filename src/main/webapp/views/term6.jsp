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
                    <a href="<%=request.getContextPath()%>/term?index=6"><li class="menu__bar-list-item select">Chính sách bán hàng và bảo hành</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=7"><li class="menu__bar-list-item">Chính sách bảo mật</li></a>
                    <a href="<%=request.getContextPath()%>/term?index=8"><li class="menu__bar-list-item">Quyền lợi sinh nhật khách hàng</li></a>
                </ul>
            </div>
            </div>
        </div>
        <div class="content">
            <div class="content-header">
                <h4>CHÍNH SÁCH BÁN HÀNG VÀ BẢO HÀNH</h4>
            </div>
            <div class="content-detail">
            <div class="content-main">
                <p class="content-main-title"><strong>1. CHÍNH SÁCH THỬ SẢN PHẨM</strong></p>
                    <ul  class="content-main-text">
                        <li>
                            Chỉ áp dụng thử đối với sản phẩm may mặc và sản phẩm phụ kiện như: áo nửa người, áo chống nắng, giầy, guốc, sandal. Quý khách vui lòng không thử sản phẩm phụ kiện mặc bên trong: áo lót/quần lót/quần tất/áo quây/quần mặc trong váy.
                        </li>
                            <li>
                                Khi thử sản phẩm, Quý khách vui lòng giữ nguyên trạng sản phẩm, không làm mất tem, mác gắn liền với sản phẩm, các chi tiết trang trí sản phẩm hoặc phụ kiện đi kèm.
                            </li>
                            <li>
                            Quý khách nên yêu cầu sự hỗ trợ từ nhân viên bán hàng khi thử đồ: lấy sản phẩm thử, kéo khóa sản phẩm.
                        </li>
                    </ul>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>2. CHÍNH SÁCH BẢO HÀNH SẢN PHẨM</strong></p>
                <ul  class="content-main-text">
                    <li>
                       Nhận sửa chữa miễn phí các trường hợp: cắt gấu, lên gấu, bóp nới sản phẩm, thay khóa, may đường chỉ.                </li>
                    <li>
                        Không bảo hành phần phụ kiện trang trí đính kèm sản phẩm (đá, cườm,...), chỉ hỗ trợ đính lại khi phụ kiện bị rơi.
                    </li>
                    <li>
                        Nhận sửa chữa có phí các trường hợp: thay thân, thay vải, may hoặc sửa phức tạp không phải do lỗi nhà sản xuất.
                    </li>
                    <li>
                        Không nhận sửa chữa, bảo hành những lỗi không phải do nhà sản xuất của sản phẩm phụ kiện: Áo nửa người/áo lót/quần lót/quần tất/áo quây/quần mặc trong váy, túi xách, ví, giày dép, vòng cổ, khuyên tai,...
                    </li>
                </ul>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>3. CÁC TRƯỜNG HỢP KHÔNG ÁP DỤNG CHÍNH SÁCH BẢO HÀNH, ĐỔI TRẢ</strong></p>
                <ul  class="content-main-text">
                    <li>
                        Sản phẩm mua quá thời gian 30 ngày và mua trong chương trình khuyến mại giảm giá từ 50% trở lên
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

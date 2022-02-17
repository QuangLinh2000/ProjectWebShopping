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
                    <a href="<%=request.getContextPath()%>/term?index=4"><li class="menu__bar-list-item select">Chính sách vận chuyển</li></a>
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
                <h4>CHÍNH SÁCH VẬN CHUYỂN VÀ GIAO NHẬN </h4>
                <p>
                    Chào mừng đến với Seven.AM!
                    Seven.AM nhận ship hàng toàn quốc. Quý khách hàng vui lòng liên hệ bộ phận Sale Online qua Hotline: <span class="contact">092.405.8888</span>, hoặc gửi yêu cầu về Email: banhangonline@sevenam.vn để được báo giá chi phí vận chuyển!
                    Chi tiết về chính sách giao hàng của Seven.AM như sau:
                </p>
            </div>
            <div class="content-detail">
            <div class="content-main">
                <p class="content-main-title"><strong>1. Phí giao hàng</strong></p>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col" colspan="2" class="header-table">Địa chỉ nhận hàng</th>
                            <th scope="col">Giao thường</th>
                            <th scope="col">Đơn hàng tối thiểu được Freeship</th>
                          </tr>
                    </thead>
                    <tbody id="body-table">
                        <tr>
                            <th scope="row" rowspan="2" class="place-table">Hà Nội
                            </th>
                            <td>
                                2Km
                             </td>
                            <td>Freeship</td>
                            <td>Từ 800.000 VND trở lên</td>
                            <tr>
                                <td>2Km tới 10Km</td>
                                <td>20.000 VNĐ</td>
                                <td>(Không áp dụng với hình thức giao hàng siêu tốc)</td>
                            </tr>
                        </tr>
                        <tr>
                            <th class="place-table" scope="row" rowspan="2">Khu vực Hà Nội khác
                            </th>
                                <td > >10Km </td>
                                <td rowspan="2">25.000 VNĐ</td>
                                <td>Từ 800.000 VND trở lên</td>
                            <tr>
                                <td>Tuyến Huyện</td>
                                <td>(Không áp dụng với hình thức giao hàng siêu tốc)</td>
                            </tr>
                        </tr>
                        <tr>
                            <th class="place-table" scope="row" rowspan="2">Miền Bắc
                            </th>
                            <td>
                               Khu vực 1
                             </td>
                            <td>25.000 VNĐ</td>
                            <td>Từ 800.000 VND trở lên</td>
                            <tr>
                                <td>Khu vực 2</td>
                                <td>30.000 VNĐ</td>
                                <td rowspan="3">(Không áp dụng với hình thức giao hàng siêu tốc)</td>
                            </tr>
                        </tr>
                        <tr>
                            <th class="place-table" scope="row" rowspan="2">Miền Trung & Miền Nam
                            </th>
                            <td>
                                Khu vực 1
                             </td>
                            <td>30.000 VNĐ</td>
                            <tr>
                                <td>Khu vực 2</td>
                                <td>35.000 VNĐ</td>
                            </tr>
                        </tr>
                    </tbody>
                  </table>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>2. Thời gian giao hàng</strong></p>
                <table class="table">
                    <thead class="table-dark">
                        <th scope="col"  class="header-table">Địa chỉ nhận hàng</th>
                        <th scope="col">Thời gian xác nhận</th>
                        <th scope="col">Thời gian nhận hàng</th>
                    </thead>
                    <tbody>
                        <tr>
                        <th class="place-table" scope="row">Khu vực Hà Nội (<10Km)
                            <td rowspan="3" class="place-table" style="text-align: center;">Từ 8h30-21-30</td>
                            <td>Trong vòng 24h</td>
                        </tr>
                        <tr>
                            <th class="place-table" scope="row">Khu vực Hà Nội (>10Km)
                                <td>24h-48h</td>
                        </tr>
                        <tr>
                            <th class="place-table" scope="row">Tỉnh thành khác
                                    <td>3-4 Ngày</td>
                        </tr>
                    </tbody>
                  </table>
                <p class="content-main-text">
                    Lưu ý :<br>

        Thời gian nhận hàng phụ thuộc vào hàng hoá trong kho. Bộ phận Sale Online check kỹ trước khi báo Quý khách hàng. Với các mặt hàng không có tại kho, bộ phận Sale Online sẽ báo thời gian thực để vận chuyển tới khách hàng sau.
        Trong 1 số điều kiện thời tiết khách quan (mưa lớn, bão, lũ lụt, chạy sale,..) hàng hóa có thể giao trễ hơn so với dự kiến.
        Nếu Quý khách có nhu cầu lấy hóa đơn hoặc hẹn thời gian giao hàng vui lòng cung cấp thông tin cho bộ phận Sales Online.
                </p>
            </div>
            <div class="content-main">
                <p class="content-main-title"><strong>3. Phân Chia Khu Vực</strong></p>
                <table class="table">
                    <thead class="table-dark">
                        <th scope="col" rowspan="2" class="header-table text-center">Miền</th>
                        <th scope="col" rowspan="2" class="header-table text-center">Tỉnh/TP</th>
                        <th scope="col" class="text-center">Khu vực 1</th>
                        <th scope="col" colspan="2" class="text-center">Khu vực 2</th>
                        <tr>
                            <th scope="col" class="text-center">Quận/TP</th>
                            <th scope="col" colspan="2"  class="text-center">Huyện/Xã</th>
                        </tr>
                    </thead>
                    <tbody id="area-table">
                        <tr>
                            <th class="place-table" scope="row" rowspan="24">Miền Bắc</th>
                            <td class="place-table text-center" >Bắc Kạn</td>
                            <td class="place-table text-center" >TP.Bắc Kạn</td>
                            <td class="place-table text-center" >Ba Bể, Chợ Mới,  Na Rì, Bạch Thông, Chợ Đồn Ngân Sơn</td>
                            <td class="place-table text-center" rowspan="24" >Các khu vực còn lại</td>
                        </tr>
                    </tbody>
                  </table>
            </div>
            </div>
        </div>
    </div>
    <script >
        let areaBody=document.getElementById("area-table");
let listArea=[
    area1={city:"Bắc Giang",district:"TP.Bắc Giang",town:"Hiệp Hòa, Lạng Giang, Lục Nam, Lục Ngạn, Sơn Động"}
    ,area2={city:"Bắc Ninh",district:"TP.Bắc Ninh",town:"TX.Từ Sơn,H.Tiên Du"}
    ,area3={city:"Cao Bằng",district:"TP.Cao Bằng",town:""}
    ,area4={city:"Điện Biên",district:"TP.Điện Biên Phủ",town:""}
    ,area5={city:"Hà Giang",district:"TP.Hà Giang",town:""}
    ,area6={city:"Hà Nam",district:"TP.Phủ Lý",town:""}
    ,area7={city:"Hải Dương",district:"TP.Hải Dương",town:""}
    ,area8={city:"Hải Phòng",district:"Q. Hồng Bàng, Q. Ngô Quyền, Q. Lê Chân",town:"Q. Hải An,Q. Kiến An,Q. Dương Kinh"}
    ,area9={city:"Hòa Bình",district:"Tp. Hòa Bình",town:""}
    ,area10={city:"Hưng Yên",district:"Tp. Hưng Yên",town:"H. Tiên Lữ,H. Kim Động"}
    ,area12={city:"Lai Châu",district:"Tp. Lai Châu",town:""}
    ,area13={city:"Lạng Sơn",district:"Tp. Lạng Sơn",town:""}
    ,area14={city:"Lào Cai",district:"Tp. Lào Cai",town:""}
    ,area15={city:"Nam Định",district:"Tp. Nam Định",town:""}
    ,area16={city:"Ninh Bình",district:"Tp. Ninh Bình",town:""}
    ,area17={city:"Phú Thọ",district:"	Tp. Việt Trì",town:"Tx. Phú Thọ"}
    ,area18={city:"Quảng Ninh",district:"Tp. Hạ Long, Tp. Móng Cái, Tp. Cẩm phả, Tp. Uông Bí",town:""}
    ,area19={city:"Sơn La",district:"Tp. Sơn La",town:""}
    ,area20={city:"Thái Bình",district:"Tp. Thái Bình",town:""}
    ,area21={city:"Thái Nguyên",district:"Tp. Thái Nguyên",town:"Tp. Sông Công"}
    ,area22={city:"Tuyên Quang",district:"Tp. Tuyên Quang",town:""}
    ,area23={city:"Vĩnh Phúc",district:"Tp. Vĩnh Yên",town:"Tx. Phúc Yên"}
    ,area24={city:"Yên Bái",district:"Tp. Yên Bái",town:""}
]
let listArea2=[
area2={city:"Bình Định",district:"Tp. Quy Nhơn",town:"H. Tuy Phước"}
    ,area3={city:"Dak Lak",district:"Tp. Buôn Ma Thuột",town:" H. Cư Kuin, H. Cư Mgar"}
    ,area4={city:"Dak Nông",district:"Tx. Gia Nghĩa",town:""}
    ,area5={city:"Gia Lai",district:"Tp. Pleiku",town:"H. Chư Păh"}
    ,area6={city:"Hà Tĩnh",district:"Tp. Hà Tĩnh",town:"H. Thạch Hà, Hồng Kỳ, Kỳ Anh"}
    ,area7={city:"Khánh Hòa",district:"Tp. Nha Trang, Tp. Cam Ranh,",town:"H. Diên Khánh"}
    ,area8={city:"Kom Tum",district:"Tp. Kon Tum",town:"Q. Hải An,Q. Kiến An,Q. Dương Kinh"}
    ,area9={city:"Nghệ An",district:"Tp. Vinh",town:"H. Hưng Nguyên, Thái Hòa, Tx. Cửa Lò"}
    ,area10={city:"Phú Yên",district:"Tp. Tuy Hòa",town:"H. Phú Hòa"}
    ,area12={city:"Quảng Bình",district:"Tp. Đồng Hới",town:"H. Bố Trạch, H. Quảng Ninh"}
    ,area13={city:"Quảng Nam",district:"Tp. Tam Kỳ, Tp. Hội An",town:"TX.Điện Bàn"}
    ,area14={city:"Quảng Ngãi",district:"Tp. Quảng Ngãi",town:"H Tư Nghĩa, H. Nghĩa Hành, H. Mộ Đức"}
    ,area15={city:"Quảng Trị",district:"Tp. Đông Hà",town:"H. Triệu Phong, H. Gio Linh, H. Cam Lộ"}
    ,area16={city:"Thanh Hóa",district:"Tp. Thanh Hóa",town:"H. Đông Sơn, Sầm Sơn, Bỉm Sơn"}
    ,area17={city:"Thừa Thiên Huế",district:"Tp. Huế  ",town:"Tx. Hương Thủy, Tx. Hương Trà, H Quảng Điền"}
    ,area18={city:"TP.HCM",district:"Quận 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, Bình Thạnh, Gò Vấp, Phú Nhuận, Tân Bình, Tân Phú, Quận 9, Quận 12, Thủ Đức, Bình Tân",town:"Huyện Nhà Bè, Huyện Bình Chánh,Huyện Hóc Môn, Huyện Củ Chi, Huyện Cần Giờ"}
    ,area19={city:"Bình Thuận",district:"Tp. Phan Thiết",town:"H. Hàm Thuận Bắc"}

]
let listArea3=[
area2={city:"Bà Rịa-Vũng Tàu",district:"Tp. Bà Rịa, Tp. Vũng Tàu",town:"H. Long Điền, H. Đất Đỏ"}
    ,area3={city:"Bạc Liêu",district:"Tp. Bạc Liêu",town:"H. Vĩnh Lợi, H. Hòa Bình"}
    ,area4={city:"Bến Tre",district:"Tp. Bến Tre",town:"H. Châu Thành, H. Giồng Trôm, H. Mỏ Cày Bắc, H. Mỏ Cày Nam"}
    ,area5={city:"Bình Dương",district:"Tp. Thủ Dầu Một",town:"Tx. Thuận An, Tx. Dĩ An, Tx. Tân Uyên"}
    ,area6={city:"Bình Phước",district:"Tx. Đồng Xoài",town:"H. Đồng Phú"}
    ,area7={city:"Cà Mau",district:"Tp. Cà Mau",town:""}
    ,area8={city:"Cần Thơ",district:"Q. Ninh Kiều, Q. Bình Thủy, Q. Ô Môn, Q. Cái Răng",town:"H. Phong Điền"}
    ,area9={city:"Đồng Nai",district:"Tp. Biên Hòa",town:""}
    ,area10={city:"Đồng Tháp",district:"Tp. Cao Lãnh, Tp. Sa Đéc",town:"H. Lai Vung"}
    ,area12={city:"Hậu Giang",district:"Tp. Vị Thanh",town:"Tx. Long Mỹ, H. Vị Thủy,H. Phụng Hiệp"}
    ,area13={city:"Kiên Giang",district:"Tp. Rạch Giá",town:"H. Châu Thành"}
    ,area14={city:"Lâm Đồng",district:"Tp. Đà Lạt",town:"H. Lạc Dương - Tp Bảo Lộc"}
    ,area15={city:"Long An",district:"Tp. Tân An",town:"H. Tân Trụ, H. Châu Thành"}
    ,area16={city:"Ninh Thuận",district:"Tp. Phan Rang – Tháp Chàm",town:"H. Thuận Bắc, H. Thuận Nam, H. Ninh Phước, H. Ninh Hải"}
    ,area17={city:"Sóc Trăng",district:"Tp. Sóc Trăng",town:"H. Châu Thành,  H. Mỹ Xuyên,  H. Trần Đề"}
    ,area18={city:"Tây Ninh",district:"Tp. Tây Ninh",town:"H. Châu Thành, H. Dương Minh Châu, H. Hòa Thành"}
    ,area19={city:"Tiền Giang",district:"Tp. Mỹ Tho",town:"H. Chợ Gạo, H. Châu Thành"}
    ,area20={city:"Trà Vinh",district:"Tp. Trà Vinh",town:"H. Châu Thành"}
    ,area21={city:"Vĩnh Long",district:"Tp. Vĩnh Long",town:"	H. Long Hồ"}

]
function setAreaTable(){
for (let item of listArea) {
   let row= document.createElement('tr');
  row.innerHTML=`<td class="place-table text-center" >${item.city}</td>
  <td class="place-table text-center" >${item.district}</td>
  <td class="place-table text-center" >${item.town}</td>`;
areaBody.appendChild(row);
}
let centralRow=document.createElement('tr');
centralRow.innerHTML=`<th class="place-table" scope="row" rowspan="${listArea2.length+1}">Miền Trung</th>
<td class="place-table text-center" >Đà Nẵng</td>
<td class="place-table text-center" >Hải Châu, Thanh Khê, Cẩm Lệ, Sơn Trà, Ngũ Hành Sơn, Liên Chiểu</td>
<td class="place-table text-center" ></td>
<td class="place-table text-center" rowspan="${listArea2.length+1}" >Các khu vực còn lại</td>`;
areaBody.appendChild(centralRow);
for (let item of listArea2) {
    let row= document.createElement('tr');
   row.innerHTML=`<td class="place-table text-center" >${item.city}</td>
   <td class="place-table text-center" >${item.district}</td>
   <td class="place-table text-center" >${item.town}</td>`;
 areaBody.appendChild(row);
 }
 let southernRow=document.createElement('tr');
 southernRow.innerHTML=`<th class="place-table" scope="row" rowspan="${listArea3.length+1}">Miền Nam</th>
<td class="place-table text-center" >An Giang</td>
<td class="place-table text-center" >Tp. Long Xuyên</td>
<td class="place-table text-center" >H. Châu Thành</td>
<td class="place-table text-center" rowspan="${listArea3.length+1}" >Các khu vực còn lại</td>`;
areaBody.appendChild(southernRow);
for (let item of listArea3) {
    let row= document.createElement('tr');
   row.innerHTML=`<td class="place-table text-center" >${item.city}</td>
   <td class="place-table text-center" >${item.district}</td>
   <td class="place-table text-center" >${item.town}</td>`;
 areaBody.appendChild(row);
 }
}
setAreaTable();
    </script>

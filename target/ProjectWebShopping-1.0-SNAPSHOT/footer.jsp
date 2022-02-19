<%@ page import="com.example.projectwebshopping.model.client.User" %><%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 12/29/2021
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%    User user = (User) request.getSession().getAttribute("userLognin");
    String userID="";
    if(user!=null)userID=user.getId();
%>
<div id="comment">
    <form action="" id="comment-dialog" method="post" enctype="multipart/form-data">
        <div class="comment-header">
            <h3 class="comment-header-title">Hộp Thoại Góp Ý</h3>
            <div class="comment-close"></div>
        </div>
        <div class="comment-body">
            <label for="comment-content">Vui lòng điền nhận xét của bạn :</label>
            <textarea name="comment-content" id="comment-content" cols="40" rows="6" ></textarea>
            <label for="comment-job">Công Việc :</label>
            <input type="text" name="comment-job" id="comment-job">
            <div class="comment-image">
                <label for="comment-image-input" class="btn btn-primary mt-0" id="label-comment-image">
                    <i class="material-icons fas fa-plus"></i>
                </label>
                <span class="comment-image-size">Click để thêm ảnh (600x900)</span>
                <input  name="comment-image-input" class="d-none" id="comment-image-input" type="file" required accept="image/*" >
                <div id="comment-image-col" class="">
                </div>
            </div>
        </div>
        <div class="comment-footer">
            <h6 class="comment-footer-title">
                Nếu bạn có ý tưởng để cải thiện sản phẩm thì hãy cho chúng tôi biết nhé. Còn nếu cần trợ giúp để khắc phục vấn đề cụ thể, hãy truy cập <a href="<%=request.getContextPath()%>/term?index=1" style="color: rgb(0, 68, 255);">Trung tâm trợ giúp</a>.
            </h6>
            <div class="comment-footer-button">
                <div class="btn btn-light btn-cancel" style="margin-right: 10px;">Hủy</div>
                <div class="btn btn-primary btn-submit">GỬI</div>
            </div>
        </div>
    </form>
</div>
<footer>
    <div id="home-about">
        <div class="inner">
            <div class="home-about-content">
                <div class="home-about-item">
                    <div class="home-about-icon">
                        <i class="fa-solid fa-truck-fast"></i>
                    </div>
                    <h3>
                        Miễn phí giao hàng
                    </h3>
                    <span>Áp dụng với hóa đơn từ 800.000 đ</span>
                </div>
                <div class="home-about-item">
                    <div class="home-about-icon">
                        <i class="fa-solid fa-shirt"></i>
                    </div>
                    <h3>
                        30 ngày đổi sản phẩm
                    </h3>
                    <span>Áp dụng với sản phẩm nguyên giá</span>
                </div>
                <div class="home-about-item">
                    <div class="home-about-icon">
                        <i class="fa-solid fa-gift"></i>
                    </div>
                    <h3>
                        Ưu đãi hấp dẫn
                    </h3>
                    <span>Quyền lợi sinh nhật đặc biệt</span>
                </div>
                <div class="home-about-item">
                    <div class="home-about-icon">
                        <i class="fa-solid fa-phone-volume"></i>
                    </div>
                    <h3>
                        Hotline
                    </h3>
                    <span>Mua hàng Online: 0924.058.888</span>
                </div>
            </div>
        </div>
    </div>
    <div class="space-white">

    </div>
    <div class="footer-top">
        <img src="<%=request.getContextPath()%>/img/icon/ft-logo.png" >
    </div>
    <div class="footer-content">
        <div class="footer-content-item footer-content-item-contact">
            <p class="footer-content-item-title">CÔNG TY CỔ PHẦN HBD</p>
            <div class="footer-content-item-contact-item">
                <i class="fas fa-home"></i>
                <p > 47 Đường Đinh Điền, Phường Lam Sơn, Thành phố Hưng Yên, Tỉnh Hưng Yên</p>
            </div>
            <div class="footer-content-item-contact-item">
                <i class="fas fa-phone"></i>
                <p class="footer-content-item-focuse" >1900 633 694</p><br>
            </div>
            <div class="footer-content-item-contact-item">
                <i class="fas fa-envelope"></i>
                <p class="footer-content-item-focuse">info@sevenam.vn</p><br>
            </div>
            <div class="footer-content-item-contact-item">
                <i class="fas fa-map-marker-alt"></i>
                <p class="footer-content-item-focuse">Hệ thống cửa hàng</p><br>
            </div>
            <div class="footer-content-item-contact-item">
                <i class="fab fa-facebook"></i>
                <p class="footer-content-item-focuse">facebook</p>
            </div>

        </div>
        <div class="footer-content-item">
            <p class="footer-content-item-title">CHÍNH SÁCH</p>
            <a href="<%=request.getContextPath()%>/term?index=1"><p class="footer-content-item-focuse">Điều khoản sử dụng</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=2"><p class="footer-content-item-focuse">Hướng dẫn thanh toán</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=3"><p class="footer-content-item-focuse">Hướng dẫn mua hàng</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=4"><p class="footer-content-item-focuse">Chính sách vận chuyển</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=5"><p class="footer-content-item-focuse">Chính sách đổi trả</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=6"><p class="footer-content-item-focuse">Chính sách bán hàng và bảo hành</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=7"><p class="footer-content-item-focuse">Chính sách bảo vệ thông tin khách hàng</p><br></a>
            <a href="<%=request.getContextPath()%>/term?index=8"><p class="footer-content-item-focuse">Quyền lợi sinh nhật của khách hàng</p></a>
        </div>
        <div class="footer-content-item">
            <p class="footer-content-item-title">VỀ SEVEN.AM</p>
            <p class="footer-content-item-focuse">Giới thiệu</p><br>
            <p class="footer-content-item-focuse">Tin tức</p><br>
            <p class="footer-content-item-focuse">Tuyển dụng</p><br>
            <p class="footer-content-item-focuse">Liên hệ</p><br>
            <p class="footer-content-item-focuse">Hợp tác kinh doanh</p><br>
            <p class="footer-content-item-focuse" id="comment-label">Góp ý cho chúng tôi</p><br>
        </div>
        <div class="footer-content-item footer-content-item-rigeter">
            <p class="footer-content-item-title">ĐĂNG KÝ NHẬN TIN</p>
            <p>Hãy đăng ký nhận tin để nhận được những thông tin hữu ích và những chương trình khuyến mãi hấp dẫn của Seven.AM!</p>
            <div class="footer-content-item-input">
                <input id="footer-content-item-input-email" style="border: none;" type="text" placeholder="Email quý khách">
                <i class="far fa-paper-plane"></i>
            </div>
            <div class="footer-content-item-image">
                <img src="<%=request.getContextPath()%>/img/footer/imge-footer.jpg" >
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>CÔNG TY CỔ PHẦN HBD - MST: 0901072722 - Ngày cấp: 03/02/2020 - Nơi cấp: Sở Kế hoạch và Đầu tư tỉnh Hưng Yên
        </p>
    </div>
</footer>
<script>
    $(".btn-cancel").click(function(){
        $("#comment").removeClass('flex')
    })
    $(".btn-submit").click(function(){
        $("#comment").removeClass('flex')
    })
    $("#comment-label").click(function (){
        if(<%=(user==null)%>){
            pushNotify("error","Opps ! Vui lòng đăng nhập để tiếp tục.","Góp Ý́")
        }
        else {
            $("#comment").addClass("flex")
        }
    })
    if(<%=user!=null%>){
        //show comment image
        document.querySelector("#comment-image-input").addEventListener("change", function() {
            var files = this.files;
            var filesArr = Array.prototype.slice.call(files);
            var isImage=true;
            var checkSize=true;
            filesArr.forEach(function(f) {
                if (!f.type.match("image.*")) {
                    isImage=false;
                    alert("Không phải file ảnh");
                    document.getElementById("comment-image-input").value=null
                    return;
                }

                var reader = new FileReader();
                reader.onload = function(e) {
                    //Initiate the JavaScript Image object.
                    var image = new Image();

                    //Set the Base64 string return from FileReader as source.
                    image.src = e.target.result;

                    //Validate the File Height and Width.
                    image.onload = function () {
                        var height = this.height;
                        var width = this.width;
                        if (height !=900 || width !=600) {
                            alert("Vui lòng chọn ảnh đúng kích thước.");
                            checkSize=false;
                        }
                    };
                    if(checkSize==true){
                        var html = "<div class=''>" +
                            "<div class='card'>" +
                            "<img src='" + e.target.result + "' class='card-img img-thumbnail' alt='...'>" +
                            "<input class='d-none' id='file-image-" + files.length + "' type='file' accept='image/*' />" +
                            "<div class='info-wrap'>" +
                            "<a href='#' class=''>" + f.name + "</a>" +
                            "<div id='delete-comment-image' class='btn btn-outline-danger'>" +
                            "Xóa" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        $('#comment-image-col').html(html);
                        //click button "Xoa" in comment form to delete image anh show plus icon
                        $("#delete-comment-image").click(function (){
                            document.getElementById("comment-image-input").value=null
                            $(".comment-image-size").removeClass("d-none")
                            $('#comment-image-col').html("");
                            $("#label-comment-image").removeClass("d-none")
                        });
                    }

                }
                reader.readAsDataURL(f);

            });
            if(filesArr.length>0&&isImage){
                $("#label-comment-image").addClass("d-none")
                $(".comment-image-size").addClass("d-none")
            }
        });
        //send comment
        //click when push button "Gui"
        $("#comment-dialog").submit(function (e){
            e.stopPropagation()
        })
        $(".btn-submit").click(function (){
            var commentForm= new FormData(document.getElementById("comment-dialog"));
            var userID="<%=userID%>"
            var job=$("#comment-job").val()
            commentForm.append("idUser",userID)
            commentForm.append("comment-content",$("#comment-content").val())
            commentForm.append("job",job)
            $.ajax({
                url: "<%=request.getContextPath()%>/review",
                type: "POST",
                data: commentForm,
                contentType: false,
                processData: false,
                success: function (data) {
                    //set attr
                    if(data=="success") {
                        pushNotify('success', 'Góp ý thành công. THANKS !', 'Nhận Xét');
                    }else if(data="lack"){
                        pushNotify('error', 'Vui lòng cung cấp đủ lời nhận xét, công việc và hình ảnh.', 'Nhận Xét');
                    }
                    else{
                        pushNotify('error', 'Góp ý thất bại.', 'Nhận Xét');
                    }
                },
                error: function(){
                    pushNotify('error', 'Góp ý thất bại.', 'Nhận Xét');
                }
            });
        });
    }

</script>


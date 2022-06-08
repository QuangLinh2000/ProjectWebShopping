package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.KhachHangDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dao.client.ThongBaoDao;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.admin.ThongBao;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.KhachHang;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CheckOutsController", value = "/check-outs")
public class CheckOutsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        List<CartJson> cart = (List<CartJson>) session.getAttribute("cartCheckout");
        KhachHang khachHang = null;
        if (user != null) {
            khachHang = KhachHangDao.getInstance().getKhachHangByUserId(user.getId());
        }
        if (cart != null) {
            request.setAttribute("list_cart", cart);
//            session.removeAttribute("cartCheckout");
        }
        if (khachHang != null) {
            request.setAttribute("khachHang", khachHang);
        }
        request.setAttribute("container_view","/views/checkOuts.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //get parameter khách hàng
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String tinhTP = request.getParameter("tinhTP");
        String quanHuyen = request.getParameter("quanHuyen");
        String phuongXa = request.getParameter("phuongXa");
        boolean check = Boolean.parseBoolean(request.getParameter("check"));
        HttpSession session = request.getSession();
        List<CartJson> cart = (List<CartJson>) session.getAttribute("cartCheckout");
//       System.out.println(name + " " + phone + " " + address + " " + email + " " + tinhTP + " " + quanHuyen + " " + phuongXa + " " + check);
        User user = (User) session.getAttribute("userLognin");



        if (cart != null && user != null) {
            String idHoaDon = UUID.randomUUID().toString();
           String mess = ProductDao.getInstance().checkOut(user.getId(), cart,idHoaDon);
           //send ajax
            if(mess.equals("success")){
                session.removeAttribute("cartCheckout");
                if(!check){
                    KhachHang khachHang = new KhachHang();
                    khachHang.setTenKH(name);
                    khachHang.setMaKH(user.getId());
                    khachHang.setSdt(phone);
                    khachHang.setDiaChi(address);
                    khachHang.setEmail(email);
                    khachHang.setTinhTP(tinhTP);
                    khachHang.setQuanHuyen(quanHuyen);
                    khachHang.setPhuongXa(phuongXa);
                    KhachHangDao.getInstance().themKhachHang(khachHang);
                }
            }
//            private String idThongBao;
//            private String title;
//            private String mota;
//            private String link;
//            private Date ngayCapNhat;
//            private int trangThai;
//            private int loaiThongBao;
//            private int phanLoai;
//            private String idUser;

            ThongBao thongBao = new ThongBao();
            thongBao.setIdThongBao(UUID.randomUUID().toString());
            thongBao.setTitle("Đơn hàng mới");
            thongBao.setMota("Có đơn hàng từ "+user.getUsername()+" cần phê duyệt");
            thongBao.setLink("/admin-order-detail?id="+idHoaDon);
            thongBao.setNgayCapNhat(new Date(System.currentTimeMillis()));
            thongBao.setTrangThai(0);
            thongBao.setLoaiThongBao(0);
            thongBao.setPhanLoai(0);
            thongBao.setIdUser(DataString.ID_USER_ADMIN);
            ThongBaoDao.getInstance().insertThongBao(thongBao);
            response.getWriter().write(mess);

        }else{
            response.getWriter().write("false");
        }

    }
}

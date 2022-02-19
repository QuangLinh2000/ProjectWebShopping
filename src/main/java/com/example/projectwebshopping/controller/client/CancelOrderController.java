package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.dao.client.ThongBaoDao;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.admin.ThongBao;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

@WebServlet(name = "CancelOrderController", value = "/cancel-order")
public class CancelOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String idOrder = request.getParameter("idOrder");
      String status = request.getParameter("status");
        User user = (User) request.getSession().getAttribute("userLognin");
        ThongBao thongBao = new ThongBao();
//        private String idThongBao;
//        private String title;
//        private String mota;
//        private String link;
//        private Date ngayCapNhat;
//        //0 là chưa đọc 1 đã xem
//        private int trangThai;
//        // 0 chờ xác nhận, 1 đã hủy , 2 đã xác nhận, 3 đang giao hàng, 4 đã giao hàng
//        private int loaiThongBao;
//        //0 là admin 1 là user
//        private int phanLoai;
//        private String idUser;
        int result = 0;
            thongBao.setIdThongBao(UUID.randomUUID().toString());
        if(status.equals("5")){
            thongBao.setTitle("Hủy đơn hàng");
            thongBao.setMota("Có đơn hàng từ "+user.getUsername()+" muốn hủy đơn hàng");
            thongBao.setLink("/admin-order-detail?id="+idOrder);
            thongBao.setNgayCapNhat(new Date(System.currentTimeMillis()));
            thongBao.setTrangThai(0);
            thongBao.setLoaiThongBao(5);
            thongBao.setPhanLoai(0);
            thongBao.setIdUser(DataString.ID_USER_ADMIN);
           ThongBaoDao.getInstance().insertThongBao(thongBao);
           result = 5;

        }
        if(status.equals("1")){
             HoaDonDao.getInstance().huyHoaDonUser(idOrder,1);
             result = 1;
        }
        if(status.equals("4")){
            thongBao.setTitle("Nhận đơn hàng");
            thongBao.setMota("Đơn hàng từ "+user.getUsername()+" đã nhận được hàng");
            thongBao.setLink("/admin-order-detail?id="+idOrder);
            thongBao.setNgayCapNhat(new Date(System.currentTimeMillis()));
            thongBao.setTrangThai(0);
            thongBao.setLoaiThongBao(4);
            thongBao.setPhanLoai(0);
            thongBao.setIdUser(DataString.ID_USER_ADMIN);
            ThongBaoDao.getInstance().insertThongBao(thongBao);
            HoaDonDao.getInstance().huyHoaDonUser(idOrder,4);
            result = 4;

        }

        response.getWriter().print(result);


    }
}

package com.example.projectwebshopping.controller.admin;

import com.episode6.hackit.mockspresso.reflect.TypeToken;
import com.example.projectwebshopping.dao.client.ChiTietHoaDon;
import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.dao.client.ThongBaoDao;
import com.example.projectwebshopping.model.admin.Order;
import com.example.projectwebshopping.model.admin.ThongBao;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "OrderDetailController", value = "/admin-order-detail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id != null){
            List<ChiTietHoaDon> chiTietHoaDonList = HoaDonDao.getInstance().getCTHoaDon(id.trim());
            Order order = HoaDonDao.getInstance().getBill(id.trim());
            if (chiTietHoaDonList.size() == 0){
                response.sendRedirect(request.getContextPath()+"/admin-orders");
                return;
            }
            request.setAttribute("orderDetails", chiTietHoaDonList);
            request.setAttribute("order", order);

        }else{
            response.sendRedirect(request.getContextPath()+"/admin-orders");
            return;
        }


        request.getRequestDispatcher("/views/admin/page-orders-detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String maDonHang = request.getParameter("maDonHang");
       String status = request.getParameter("status");
       String soNGay = request.getParameter("soNgay");
       String array = request.getParameter("array");
       String userId = request.getParameter("userId");

       //convert json to list
        List<ChiTietHoaDon> chiTietHoaDonList = new Gson().fromJson(array, new TypeToken<List<ChiTietHoaDon>>(){}.getType());

       int result = 0;
        ThongBao thongBao = new ThongBao();
//        private String idThongBao;
//        private String title;
//        private String mota;
//        private String link;
//        private Date ngayCapNhat;
//        //0 l?? ch??a ?????c 1 ???? xem
//        private int trangThai;
//        // 0 ch???? xa??c nh????n, 1 ??a?? hu??y , 2 ??a?? xa??c nh????n, 3 ??ang giao ha??ng, 4 ??a?? giao ha??ng
//        private int loaiThongBao;
//        //0 l?? admin 1 l?? user
//        private int phanLoai;
//        private String idUser;
        thongBao.setNgayCapNhat(new Date(System.currentTimeMillis()));
        thongBao.setIdThongBao(UUID.randomUUID().toString());
        thongBao.setPhanLoai(1);
        thongBao.setTrangThai(0);
        thongBao.setIdUser(userId);

        if(status.equals("1")){
           result = HoaDonDao.getInstance().huyHoaDon(maDonHang, chiTietHoaDonList);
           thongBao.setTitle("H???y ????n h??ng");
           thongBao.setMota("H???y ????n h??ng c?? m?? ????n h??ng: "+maDonHang);
           thongBao.setLink("/order?status=1");
           thongBao.setLoaiThongBao(1);
           ThongBaoDao.getInstance().insertThongBao(thongBao);
       }else{
           result =HoaDonDao.getInstance().updateOder(maDonHang, Integer.parseInt(status),Integer.parseInt(soNGay));
           if(status.equals("2")){
               thongBao.setTitle("X??c nh???n ????n h??ng");
               thongBao.setMota(" ????n h??ng c?? m?? ????n h??ng: "+maDonHang +" ???? ???????c x??c nh???n");
               thongBao.setLink("/order?status=2");
               thongBao.setLoaiThongBao(2);
               ThongBaoDao.getInstance().insertThongBao(thongBao);
           }
           if(status.equals("3")){
               thongBao.setTitle("??ang giao h??ng");
               thongBao.setMota("????n h??ng c?? m?? ????n h??ng: "+maDonHang +" ??ang giao h??ng");
               thongBao.setLink("/order?status=3");
               thongBao.setLoaiThongBao(3);
               ThongBaoDao.getInstance().insertThongBao(thongBao);
           }
       }
       if (result > 0){
           response.getWriter().write("success");
           return;
       }
        response.getWriter().write("false");

    }
}

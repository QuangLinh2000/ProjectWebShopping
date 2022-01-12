package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HomeAdminController", value = "/admin-dashboard")
public class BangDieuKhienController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeSerVice();

        double tongDoanhThu = HoaDonDao.getInstance().getTotalRevenue();
       int tongSoHoaDon = HoaDonDao.getInstance().getTotalSumOfBill();
       int tongSoSanPham = HoaDonDao.getInstance().getTotalProduct();
       int tongSoKhachHang = HoaDonDao.getInstance().getTotalClient();
        request.setAttribute("listSPBanChay",iHomeService.getSanPhamNoiBat(3,8));
        request.setAttribute("listOder",HoaDonDao.getInstance().getNewBell(7));

       request.setAttribute("tongDoanhThu", tongDoanhThu);
       request.setAttribute("tongSoHoaDon", tongSoHoaDon);
       request.setAttribute("tongSoSanPham", tongSoSanPham);
       request.setAttribute("tongSoKhachHang", tongSoKhachHang);

       request.getRequestDispatcher("views/admin/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

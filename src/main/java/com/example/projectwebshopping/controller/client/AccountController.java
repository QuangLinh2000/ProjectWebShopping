package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.KhachHangDao;
import com.example.projectwebshopping.model.client.KhachHang;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountController", value = "/account")
public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("userLognin");
        if (user != null) {
            KhachHang khachHang= KhachHangDao.getInstance().getKhachHangByUserId(user.getId());
            request.setAttribute("khachHang", khachHang);
            request.setAttribute("user", user);
        }

        request.setAttribute("container_view","/views/account.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String tinhTP = request.getParameter("tinhTP");
        String quanHuyen = request.getParameter("quanHuyen");
        String phuongXa = request.getParameter("phuongXa");
        boolean check = Boolean.parseBoolean(request.getParameter("check"));
        HttpSession session = request.getSession();
//       System.out.println(name + " " + phone + " " + address + " " + email + " " + tinhTP + " " + quanHuyen + " " + phuongXa + " " + check);
        User user = (User) session.getAttribute("userLognin");
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKH(name);
        khachHang.setMaKH(user.getId());
        khachHang.setSdt(phone);
        khachHang.setDiaChi(address);
        khachHang.setEmail(email);
        khachHang.setTinhTP(tinhTP);
        khachHang.setQuanHuyen(quanHuyen);
        khachHang.setPhuongXa(phuongXa);
        int  number = 0;
        if(!check){

            number= KhachHangDao.getInstance().themKhachHang(khachHang);
        }else{
            number= KhachHangDao.getInstance().suaKhachHang(khachHang);
        }
        if(number>0){
            response.getWriter().write("success");
        }else{
            response.getWriter().write("fail");
        }


    }
}

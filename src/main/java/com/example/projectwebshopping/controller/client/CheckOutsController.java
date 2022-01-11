package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.KhachHangDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.KhachHang;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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
           String mess = ProductDao.getInstance().checkOut(user.getId(), cart);
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
            response.getWriter().write(mess);

        }else{
            response.getWriter().write("false");
        }

    }
}

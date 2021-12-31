package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeSerVice();
        List<BoSuaTap> listBoSuaTap = iHomeService.getBSHome();
        request.setAttribute("listQC",iHomeService.getAllQC());
        request.setAttribute("listBST",listBoSuaTap);
        request.setAttribute("listLoaiSP",iHomeService.getAllLoaiSP());
        request.setAttribute("listSPNoiBat",iHomeService.getSanPhamNoiBat(0));
        request.setAttribute("listSPMoi",iHomeService.getSanPhamNoiBat(1));
        request.setAttribute("listSPKM",iHomeService.getSanPhamNoiBat(2));
        String idBoSTLeft = listBoSuaTap.get(0).getId();
        String idBoSTRight = listBoSuaTap.get(1).getId();
        request.setAttribute("listBoSTLeft",iHomeService.getAllProductByBSTId(idBoSTLeft));
//        for (Product product : iHomeService.getAllProductByBSTId(idBoSTLeft)) {
//
//            System.out.println(product.getUrlImg());
//
//        }
        request.setAttribute("listBoSTRight",iHomeService.getAllProductByBSTId(idBoSTRight));
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

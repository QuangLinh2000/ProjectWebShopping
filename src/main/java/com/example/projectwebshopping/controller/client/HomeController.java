package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;
import com.google.gson.Gson;

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
        request.setAttribute("listSPNoiBat",iHomeService.getSanPhamNoiBat(0,8));

        request.setAttribute("listSPMoi",iHomeService.getSanPhamNoiBat(1,8));
        request.setAttribute("listSPKM",iHomeService.getSanPhamNoiBat(2,8));

        String idBoSTLeft = listBoSuaTap.get(0).getId();
        String idBoSTRight = listBoSuaTap.get(1).getId();
        request.setAttribute("listBoSTLeft",iHomeService.getAllProductByBSTId(idBoSTLeft,10));
        request.setAttribute("listBoSTRight",iHomeService.getAllProductByBSTId(idBoSTRight,10));

        LogninManager.getInstance().setURLCookies(request, response);


        request.setAttribute("container_view","/views/index.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get parameter int so and int size
        int so = Integer.parseInt(request.getParameter("so"));
        int size = Integer.parseInt(request.getParameter("size"));
        IHomeService iHomeService = new HomeSerVice();
        if(size >= 8) {
            List<Product> listSP = ProductDao.getInstance().getSanPhamNoiBat(so,4,size-1);
            if(listSP != null){
                //convert listSP to json utf
                String json = new Gson().toJson(listSP);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);

            }

        }



    }
}

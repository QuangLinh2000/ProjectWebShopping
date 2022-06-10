package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.model.client.ProductManager;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "DiscountProductController", value = "/admin-products-discount")
public class DiscountProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> products = ProductDao.getInstance().getProductsSellAdmin(null,null,null,-1,0,10);
        List<LoaiSP> loaiSPs = LoaiSPDao.getInstance().getAllLoaiSP();
        List<BoSuaTap> listBoSuuTap = BoSuaTapDao.getInstance().getALLBST();
        int total = ProductDao.getInstance().getCountProductSellAdmin(null,null,null,-1);
        request.setAttribute("products", products);
        request.setAttribute("total", ProductManager.getInstance().getPageCount(10,total));
        request.setAttribute("loaiSPs", loaiSPs);
        request.setAttribute("boSuuTap",listBoSuuTap);
        request.getRequestDispatcher("views/admin/page-discount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String serviceName= request.getParameter("serviceName");
        switch (serviceName){
            case "getProductDiscount":
                getProductsDiscountInPage(request,response);
                break;
            case "addDiscount":
                addDiscount(request,response);
                break;
        }
        //get parameters date: date,
        //                   status: satus,
        //                   loai: loai,
        //                   page: page


    }


    public void getProductsDiscountInPage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int status = Integer.parseInt(request.getParameter("status"));
        String loai = request.getParameter("loai");
        int page = Integer.parseInt(request.getParameter("page"));
        String dateStart = request.getParameter("dateStart");
        String dateEnd = request.getParameter("dateEnd");
        Date dateStartSell = null;
        Date dateEndSell = null;
//        System.out.println(" satus : " + status + " loai : " + loai + " dateS : " + dateStart + " dateE : " + dateEnd);
        if(dateStart != null && dateStart.trim().length() > 0){
            dateStartSell = Date.valueOf(dateStart);
        }
        if(dateEnd != null && dateEnd.trim().length() > 0){
            dateEndSell = Date.valueOf(dateEnd);
        }
        if(loai.equalsIgnoreCase("Loại")){
            loai = null;
        }
        List<Product> products = ProductDao.getInstance().getProductsSellAdmin(loai,dateStartSell,dateEndSell,status,getStart(page,10),10);
        //convert products to json
        String json = new Gson().toJson(products);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        int total = 0;
        if(page == -1){
            total = ProductDao.getInstance().getCountProductSellAdmin(loai,dateStartSell,dateEndSell,status);
            response.getWriter().write("{\"total\":" + total+ ",\"data\":" + json + "}");
        }else{
            response.getWriter().write("{\"total\":" + -1+ ",\"data\":" + json + "}");
        }
    }

    private void addDiscount(HttpServletRequest request, HttpServletResponse response) {
    }
    //start page
    public int getStart(int page, int limit){
        if(page == -1){
            return 0;
        }
        return (page - 1) * limit;
    }
}

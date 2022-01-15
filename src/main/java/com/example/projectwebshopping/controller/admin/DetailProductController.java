package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dto.client.DetailProduct;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2 ,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "DetailAdminController", value = "/admin-detail-product")
public class DetailProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null){
            return;
        }
        List<LoaiSP> loaiSPS = LoaiSPDao.getInstance().getAllLoaiSP();
        List<BoSuaTap> boSuaTaps = BoSuaTapDao.getInstance().getALLBST();
        request.setAttribute("loaiSPS", loaiSPS);
        request.setAttribute("boSuaTaps", boSuaTaps);
        DetailProduct detailProduct = ProductDao.getInstance().getProduct(id);
        request.setAttribute("detailProduct", detailProduct);
        request.getRequestDispatcher("/views/admin/page-products-detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getParameter("product_name"));
        System.out.println(request.getParameter("product_price"));
    }
}

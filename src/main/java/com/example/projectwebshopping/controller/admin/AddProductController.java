package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddProductController", value = "/admin-add-product")
public class AddProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<LoaiSP> loaiSPS = LoaiSPDao.getInstance().getAllLoaiSP();
        List<BoSuaTap> boSuaTaps = BoSuaTapDao.getInstance().getALLBST();
        request.setAttribute("loaiSPS", loaiSPS);
        request.setAttribute("boSuaTaps", boSuaTaps);
        request.getRequestDispatcher("/views/admin/page-add-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

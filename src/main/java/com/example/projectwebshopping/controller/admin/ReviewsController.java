package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.AppreciateDao;
import com.example.projectwebshopping.model.admin.Appreciate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//ten,nghenghiep,hinhanh,nhanxet
@WebServlet(name = "ReviewsController", value = "/admin-page-reviews")
public class ReviewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Appreciate> listComment= AppreciateDao.getInstance().getAllAppreciate();
        request.setAttribute("listComment",listComment);
        request.getRequestDispatcher("/views/admin/page-reviews.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

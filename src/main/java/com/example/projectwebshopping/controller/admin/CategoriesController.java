package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dto.client.LoaiSPAdmin;
import com.example.projectwebshopping.model.client.LoaiSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "CategoriesController", value = "/admin-categories")
public class CategoriesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<LoaiSPAdmin> categories = LoaiSPDao.getInstance().getAllLoaiSPAdmin();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/views/admin/page-categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //get parameter
        String name = request.getParameter("name");
        String description = request.getParameter("mota");
        String action = request.getParameter("action");
        if(action.equals("add")){
            String id = UUID.randomUUID().toString();
            if(name == null || name.isEmpty()){
                response.getWriter().write("err");
                return;
            }
            boolean isAdd = LoaiSPDao.getInstance().addLoaiSP(id, name, description);
            if(isAdd){
                response.getWriter().write("success");
            }else{
                response.getWriter().write("err");
            }
        }
        else if(action.equals("edit")){
            String id=request.getParameter("idLoaiSP");
            LoaiSPAdmin loaisp=LoaiSPDao.getInstance().getLoaiSp(id);
            if(name == null || name.equals("")){
                name=loaisp.getNameLoai();
            }
            if(description==null || description.equals("")){
                description=loaisp.getMota();
            }
            boolean isUpdate=LoaiSPDao.getInstance().updateLoaiSP(id,name,description);

            if(isUpdate){
                response.getWriter().write("success");
            }else{
                response.getWriter().write("err");
            }
        }

    }
}

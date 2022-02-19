package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.AppreciateDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2 ,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "ReviewController", value = "/review")
public class ReviewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUser=request.getParameter("idUser");
        String comment=request.getParameter("comment-content");
        String job=request.getParameter("job");
        //get list Part
        Part part = (Part) request.getPart("comment-image-input");
        String realPath = request.getServletContext().getRealPath("/img/appreciate");
        String imgUser="";
        String idComment = UUID.randomUUID().toString();
        String fileName="";
        //get real path

        if(part!=null) {
            fileName = part.getSubmittedFileName();
            if(comment.equals("")||fileName==""||job=="")   {
                response.getWriter().write("lack");
                return;
            }

            if(fileName != null && fileName.length() > 0){
                String path = "/img/appreciate/"+idComment + fileName;
                imgUser=path;
            }
        }
        boolean isAdd = AppreciateDao.getInstance().addAppreciateNow(idComment,idUser,imgUser,comment,job);;
        if(isAdd){
            part.write(realPath + "/" +idComment+ fileName);
            response.getWriter().write("success");
        }else{
            response.getWriter().write("err");
        }

    }
}

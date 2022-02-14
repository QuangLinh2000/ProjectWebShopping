package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2 ,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
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
        //get parameter
//        fd.append('product_name', product_name);
//        fd.append('product_quantity_s', product_quantity_s);
//        fd.append('product_quantity_m', product_quantity_m);
//        fd.append('product_quantity_l', product_quantity_l);
//        fd.append('product_quantity_xl', product_quantity_xl);
//        fd.append('product_type', product_type);
//        fd.append('product_colection', product_colection);
//        fd.append('product_color', product_color);
//        fd.append('product_description', product_description);
//        fd.append('product_status', product_status);
//        fd.append('product_price', product_price);
//        fd.append('product_price_sale', product_price_sale);
//        fd.append('product_date_start', product_date_start);
//        fd.append('product_date_end', product_date_end);

        String product_name = request.getParameter("product_name");

        String product_quantity_s = request.getParameter("product_quantity_s");
        String product_quantity_m = request.getParameter("product_quantity_m");
        String product_quantity_l = request.getParameter("product_quantity_l");
        String product_quantity_xl = request.getParameter("product_quantity_xl");
        String product_type = request.getParameter("product_type");
        String product_colection = request.getParameter("product_colection");
        String product_color = request.getParameter("product_color");
        String product_description = request.getParameter("product_description");
        String product_status = request.getParameter("product_status");
        String product_price = request.getParameter("product_price");
        String product_price_sale = request.getParameter("product_price_sale");
        String product_date_start = request.getParameter("product_date_start");
        String product_date_end = request.getParameter("product_date_end");
        product_name = new String(product_name.getBytes("iso-8859-1"), "utf-8");
//        System.out.println("product_name: "+product_name);
//        System.out.println("product_quantity_s: "+product_quantity_s);
//        System.out.println("product_quantity_m: "+product_quantity_m);
//        System.out.println("product_quantity_l: "+product_quantity_l);
//        System.out.println("product_quantity_xl: "+product_quantity_xl);
//        System.out.println("product_type: "+product_type);
//        System.out.println("product_colection: "+product_colection);
//        System.out.println("product_color: "+product_color);
//        System.out.println("product_description: "+product_description);
//        System.out.println("product_status: "+product_status);
//        System.out.println("product_price: "+product_price);
//        System.out.println("product_price_sale: "+product_price_sale);
//        System.out.println("product_date_start: "+product_date_start);
//        System.out.println("product_date_end: "+product_date_end);

        //get list Part
        List<Part> parts = (List<Part>) request.getParts();
        String realPath = getServletContext().getRealPath("/img/footer");
        List<String> listFileName = new ArrayList<>();
       //get real path
       for (Part part : parts) {
           String fileName = part.getSubmittedFileName();
           if(fileName != null && fileName.length() > 0){
               String id = UUID.randomUUID().toString();
               String path = "/img/footer/"+id + fileName;
               System.out.println(path);
               part.write(realPath + "/" +id+ fileName);
               listFileName.add(path);

           }

       }
//
        Product product = new Product();
        product.setMaSP(UUID.randomUUID().toString());
        product.setTenSP(product_name);
        product.setIdBoST(product_colection);
        product.setMoTa(product_description);
        product.setGia(Double.parseDouble(product_price));
        product.setSell(Double.parseDouble(product_price_sale)/100);
        product.setMau(product_color);
        product.setNayNhap(new Date(System.currentTimeMillis()));
        if(product_date_start != null && product_date_start.length() > 0){
            product.setNgayBatDausell(Date.valueOf(product_date_start));
        }else{
            product.setNgayBatDausell(new Date(1,1,1));
        }
        if(product_date_end != null && product_date_end.length() > 0){
            product.setNgayHetHansell(Date.valueOf(product_date_end));
        }else{
            product.setNgayHetHansell(new Date(1,1,1));
        }
        product.setLoaiSP(product_type);
        product.setTrangThai(Integer.parseInt(product_status));
        product.setS(Integer.parseInt(product_quantity_s));
        product.setL(Integer.parseInt(product_quantity_l));
        product.setM(Integer.parseInt(product_quantity_m));
        product.setXL(Integer.parseInt(product_quantity_xl));
        product.setListUrlImg(listFileName);

        if(listFileName.size() > 0){
            boolean check = ProductDao.getInstance().insertProduct(product);
            if(check){
                response.getWriter().write("success");
            }else{
                //remove file

                String realPath2 = getServletContext().getRealPath("");
                System.out.println(realPath2);
                for ( String fileName : listFileName) {
                    File file = new File(realPath2 + fileName);
                    if(file.exists()){
                        file.delete();
                    }

                }
                response.getWriter().write("fail");
            }
        }else{

            response.getWriter().write("fail");
        }




    }

}

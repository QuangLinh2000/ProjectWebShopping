package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dto.client.DetailProduct;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
        String serviceName = request.getParameter("action");
        AdminService serviceAdmin;
        //service delete-img and service update-product
            switch (serviceName){
                case "delete-img":
                    String idProduct = request.getParameter("idProduct");
                    String idImg = request.getParameter("idImg");
                    serviceAdmin = new AdminService();
                    serviceAdmin.removeImg(idProduct, idImg,getServletContext().getRealPath(""));
                    response.getWriter().write("success");
                    break;
                case "update-product":
                    updateProductRequest(request, response);
                    break;
                default:
                    response.getWriter().write("fail");
                    break;
            }
    }
    public void updateProductRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String product_name =   request.getParameter("product_name");
        String product_id = request.getParameter("product_id");
        String product_quantity_s = request.getParameter("product_quantity_s");
        String product_quantity_m = request.getParameter("product_quantity_m");
        String product_quantity_l = request.getParameter("product_quantity_l");
        String product_quantity_xl = request.getParameter("product_quantity_xl");
        String product_type = request.getParameter("product_type");
        String product_collection = request.getParameter("product_collection");
        String product_color = request.getParameter("product_color");
        String product_description = request.getParameter("product_description");
        String product_status = request.getParameter("product_status");
        String product_price = request.getParameter("product_price");
        String product_price_sale = request.getParameter("product_price_sale");
        String product_date_start = request.getParameter("product_date_start");
        String product_date_end = request.getParameter("product_date_end");
        // product_name to utf8
        product_name = new String(product_name.getBytes("iso-8859-1"), "utf-8");
        product_description = new String(product_description.getBytes("iso-8859-1"), "utf-8");
        product_color = new String(product_color.getBytes("iso-8859-1"), "utf-8");
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
                part.write(realPath + "/" +id+ fileName);
                listFileName.add(path);
            }
        }
        // print ngaybat dau va ngay ket thuc

        Product product  = new Product();
        product.setMaSP(product_id);
        product.setTenSP(product_name);
        product.setIdBoST(product_collection);
        product.setMoTa(product_description);
        product.setGia(Double.parseDouble(product_price));
        product.setSell(Double.parseDouble(product_price_sale)/100);
        // convert string to date format

        LocalDate dateStart = LocalDate.parse(product_date_start);
        LocalDate dateEnd= LocalDate.parse(product_date_end);
        product.setNgayBatDausell(new Date(dateStart.getYear()-1900,dateStart.getMonthValue()-1,dateStart.getDayOfMonth()));
        product.setNgayHetHansell(new Date(dateEnd.getYear()-1900,dateEnd.getMonthValue()-1,dateEnd.getDayOfMonth()));
        product.setNayNhap(new Date(2019,11,11));
        product.setMau(product_color);
        product.setNayNhap(new Date(System.currentTimeMillis()));
        product.setLoaiSP(product_type);
        product.setTrangThai(Integer.parseInt(product_status));
        product.setS(Integer.parseInt(product_quantity_s));
        product.setL(Integer.parseInt(product_quantity_l));
        product.setM(Integer.parseInt(product_quantity_m));
        product.setXL(Integer.parseInt(product_quantity_xl));

        product.setListUrlImg(listFileName);
        //update product
        boolean check =  ProductDao.getInstance().updateProduct(product);
        if(check){
            response.getWriter().write("success");
        }else{
            response.getWriter().write("fail");
        }

    }
}

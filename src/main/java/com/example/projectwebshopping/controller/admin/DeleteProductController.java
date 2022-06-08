package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.admin.DeleteProduct;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DeleteProduct", value = "/admin-delete-product")
public class DeleteProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
//        System.out.println(id);
//        System.out.println(type);

        if(type.equals("check")) {
           DeleteProduct deleteProduct =  HoaDonDao.getInstance().chekHoaDon(id);
            List<String> listMaHoaDOn = deleteProduct.getProductId();
            Map<Integer,Integer> mapSoLuongHoaDon = deleteProduct.getMap();
            List<String> list = new ArrayList<>();
            for (Integer key : mapSoLuongHoaDon.keySet()) {
                if(key == 0){
                    list.add("có "+mapSoLuongHoaDon.get(key)+" hóa đơn chờ xác nhận");
                }
                 if(key == 2){
                    list.add("có "+mapSoLuongHoaDon.get(key)+" hóa đơn đang chờ giao");

                }
                 if(key == 3){
                    list.add("có "+mapSoLuongHoaDon.get(key)+" hóa đơn đang giao");
                 }
            }
            String json = new Gson().toJson(list);
            String jsonMaHoaDon = new Gson().toJson(listMaHoaDOn);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().write("{\"listMaHoaDon\":"+jsonMaHoaDon+",\"list\":"+json+"}");

        }
        if(type.equals("delete")){
            String typeDelete = request.getParameter("typeDelete");
            String listMaHoaDon = request.getParameter("listMaHoaDon");
            //convert json to list
            List<String> list = new Gson().fromJson(listMaHoaDon, List.class);
            // 0.xóa sản phẩm không có hóa dơn nào
            // 1. xóa sản phẩm có hóa đơn nhưng chưa giao
            // 2. xóa sản phẩm có hóa đơn đang giao
            List<String> result = new ArrayList<>();
            int number = 0;
            if(typeDelete.equals("0")){
                result= ProductDao.getInstance().deleteProduct(id);
                number = 1;
            }
            if(typeDelete.equals("1")){
                result= ProductDao.getInstance().deleteProductCoHoaDonChuaGiao(id,list);
                number = 1;

            }
            if(typeDelete.equals("2")){
               ProductDao.getInstance().deleteProductCoHoaDonDangGiao(id,list);
               number=2;
            }
//           for (String s : result) {
//               removeImg(s,request.getRealPath(""));
//           }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(number+"");

        }

    }
    public boolean removeImg(String idImg,String realPath) {
            File file = new File(realPath + idImg);
            if (file.exists()) {
                file.delete();
            }
            return true;

    }
}

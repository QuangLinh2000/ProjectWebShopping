package com.example.projectwebshopping.service.client;

import java.sql.Date;

public interface IAdminService {
     boolean removeImg(String idProduct, String idImg,String realPath);
     boolean updateProductsDiscount(String[] ids, double discount,Date dateStart, Date dateEnd);
}

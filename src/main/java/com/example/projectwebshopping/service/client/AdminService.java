package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.dao.client.ProductDao;

import java.io.File;
import java.sql.Date;


public class AdminService implements IAdminService {
    @Override
    public boolean removeImg(String idProduct, String idImg,String realPath) {
        int result = ProductDao.getInstance().removeImg(idProduct, idImg);
        if (result != -1) {
            File file = new File(realPath + idImg);
            if (file.exists()) {
                file.delete();
            }
            return true;
        }
        return false;
    }

    @Override
    public boolean updateProductsDiscount(String[] ids, double discount, Date dateStart, Date dateEnd) {
        int result = ProductDao.getInstance().updateProductsDiscount(ids, discount, dateStart, dateEnd);
        if (result != -1) {
            return true;
        }
        return false;
    }
}

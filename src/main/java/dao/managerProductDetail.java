package dao;



import modal.beans.ProductColor;
import modal.beans.ProductSize;

import modal.beans.Product;
import modal.beans.STATUS;


import java.util.ArrayList;
import java.util.List;

public class managerProductDetail {
    static ArrayList<Product> listProduct=new ArrayList<Product>();

    static{

Product product1=new Product("ÁO PHAO ĐỎ AK66106","Thương Hiệu: NEM","661061872034020682",799000,50,0, new ProductSize[]{new ProductSize("Size 2", STATUS.OFF), new ProductSize("Size 4", STATUS.ON), new ProductSize("Size 6", STATUS.ON), new ProductSize("Size 8", STATUS.ON)},
        new ProductColor[]{new ProductColor("#ff0000", STATUS.OFF),new ProductColor("rgb(51 83 221)", STATUS.ON)},"","Áo khoác phao dáng ngắn, tone màu đỏ trơn, thiết kế tay bo trẻ trung.","Đi làm, sự kiện, hay đi dạo phố, tạo vẻ thanh lịch cho người mặc.","NEM NEW","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
Product product2=new Product("ĐẦM HOA XANH D00869","Thương Hiệu: NEM","Dam-hoa-xanh-D00869",1559000,20,7, new ProductSize[]{new ProductSize("Size 6", STATUS.ON), new ProductSize("Size 8", STATUS.OFF)},
        new ProductColor[]{new ProductColor("rgb(224 181 100)",STATUS.OFF),new ProductColor("rgb(51 83 221)",STATUS.ON)},"Vải tafta cao cấp.","Đầm tiệc 2 dây dáng ôm, dài qua gối, tone màu đen hồng nhạt, eo đính nơ bản to, kết hợp tà chất liệu voan sequin.","Đi làm, sự kiện, hay đi dạo phố, tạo vẻ trẻ trung nữ tính cho người mặc.","NEM LUXURY","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
Product product3=new Product("Áo len dài tay AL62326","Thương Hiệu: NEM","AL62326",1493000,50,0, new ProductSize[]{new ProductSize("Size 6", STATUS.OFF), new ProductSize("Size 8", STATUS.ON)},
        new ProductColor[]{new ProductColor("rgb(224 181 165)",STATUS.ON)},"Vải len cao cấp","​áo len dài tay cổ V, tone màu hồng nhạt , phối khuy.","Đi làm, sự kiện, hay đi dạo phố, tạo vẻ thanh lịch cho người mặc.","NEM NEW","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
Product product4=new Product("ÁO KHOÁC THIẾT KẾ AK31582","Thương Hiệu: NEM","AK31582",2299000,10,20, new ProductSize[]{ new ProductSize("Size 6", STATUS.ON)},
        new ProductColor[]{new ProductColor("#663537",STATUS.ON)},"Vải tổng hợp cao cấp mềm mại, không nhăn bền màu.","Áo khoác thiết kế dáng dài cổ 2 ve, họa tiết zic zac.","Đi làm, đi sự kiện, hay đi dạo phố, kết hợp quần hay chân váy, tạo vẻ trẻ trung hiện đại cho người mặc.","NEW NEM","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
Product product5=new Product("ĐẦM NHUNG ĐỎ D25432","Thương Hiệu: NEM","D25432",1892000,84,10, new ProductSize[]{new ProductSize("Size 2", STATUS.ON), new ProductSize("Size 6", STATUS.OFF)},
        new ProductColor[]{new ProductColor("#f00",STATUS.ON)},"","Vải nhung cao cấp.","Đi làm, đi sự kiện, hay đi dạo phố,tạo vẻ trẻ trung quyến nữ tính cho người mặc.","NEM NEW","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
Product product6=new Product("ÁO KHOÁC LEN HỌA TIẾT AK62546","Thương Hiệu: NEM","AK62546",1399000,0,0, new ProductSize[]{new ProductSize("Size 6", STATUS.ON), new ProductSize("Size 8", STATUS.ON)},
        new ProductColor[]{new ProductColor("rgb(224 181 165)",STATUS.ON),new ProductColor("rgb(51 83 221)",STATUS.ON)},"Vải len cao cấp","Áo khoác len khuy cài trước, cổ V, kết hợp họa tiết bắt mắt.","Đi làm, sự kiện, hay đi dạo phố, tạo vẻ trẻ trung nữ tính cho người mặc.","NEM NEW","Mặc sản phẩm size 2",
        new String[]{"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"});
        listProduct.add(product1);
        listProduct.add(product2);
        listProduct.add(product3);
        listProduct.add(product4);
        listProduct.add(product5);
        listProduct.add(product6);
    }
   private static managerProductDetail instance;
    private managerProductDetail(){

    }
    public static managerProductDetail getInstance(){
        if(instance==null) instance=new managerProductDetail();
        return instance;
    }
    public Product getProduct(String id){
        for(Product product:listProduct){
            if(product.getId().equals(id)) return product;
        }
        return null;
    }
    public List<Product> getRelatedProduct(Product product){
        ArrayList<Product> result=new ArrayList<Product>();
        for(Product prd:listProduct){
            if(prd.getTrademark().equalsIgnoreCase(product.getTrademark()))
            result.add(prd);
        }
        return result;
    }
}

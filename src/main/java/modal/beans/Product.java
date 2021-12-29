package modal.beans;



import java.io.Serializable;



public class Product implements Serializable {

    private String title;
    private String trademark;
    private String id;
    private double price;
    private double sale;
    private int available;
    private ProductSize[] listSize;
    private ProductColor[] listColor;
    private String material;
    private String type;
    private String match;
    private String productBranch;
    private String modelDescribe;
    private String[] listImage;

    public Product(String title, String trademark, String id, double price, double sale, int available, ProductSize[] listSize, ProductColor[] listColor,String material, String type,String match, String productBranch, String modelDescribe, String[] listImage) {
        this.title = title;
        this.trademark = trademark;
        this.id = id;
        this.price = price;
        this.sale = sale;
        this.available = available;
        this.listSize = listSize;
        this.listColor = listColor;
        this.material=material;
        this.type=type;
        this.match = match;
        this.productBranch = productBranch;
        this.modelDescribe = modelDescribe;
        this.listImage = listImage;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public ProductSize[] getListSize() {
        return listSize;
    }

    public void setListSize(ProductSize[] listSize) {
        this.listSize = listSize;
    }

    public ProductColor[] getListColor() {
        return listColor;
    }

    public void setListColor(ProductColor[] listColor) {
        this.listColor = listColor;
    }

    public String getMatch() {
        return match;
    }

    public void setMatch(String match) {
        this.match = match;
    }

    public String getProductBranch() {
        return productBranch;
    }

    public void setProductBranch(String productBranch) {
        this.productBranch = productBranch;
    }

    public String getModelDescribe() {
        return modelDescribe;
    }

    public void setModelDescribe(String modelDescribe) {
        this.modelDescribe = modelDescribe;
    }

    public String[] getListImage() {
        return listImage;
    }

    public void setListImage(String[] listImage) {
        this.listImage = listImage;
    }
}

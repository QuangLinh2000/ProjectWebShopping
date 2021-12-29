package modal.beans;

public class ProductColor {
    private String colorID;
    private int status;
    public ProductColor(String colorID,int status){
        this.colorID=colorID;
        this.status=status;
    }

    public String getColorID() {
        return colorID;
    }

    public int getStatus() {
        return status;
    }

}

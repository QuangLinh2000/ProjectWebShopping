package modal.beans;

public class ProductSize {
    private String sizeTitle;
    private int status;

    public ProductSize() {
    }
    public ProductSize(String sizeTitle,int status){
        this.sizeTitle=sizeTitle;
        this.status=status;
    }

    public String getSizeTitle() {
        return sizeTitle;
    }

    public int getStatus() {
        return status;
    }
}



//基类：店铺

package base;

public class Shop {
    private String Sno;
    private String Addr;
    private int cost;
    private String Sremark;
    private String state;

    public Shop(){
        super();
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public void setAddr(String addr) {
        Addr = addr;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public void setSremark(String sremark) {
        Sremark = sremark;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getSno() {
        return Sno;
    }

    public String getAddr() {
        return Addr;
    }

    public int getCost() {
        return cost;
    }

    public String getSremark() {
        return Sremark;
    }

    public String getState() {
        return state;
    }
}

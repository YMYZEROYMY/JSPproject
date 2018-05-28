
//基类：租用关系

package base;

public class Rent {
    private String sno;
    private String mno;
    private String rname;
    private int cost;

    public Rent(){
        super();
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getMno() {
        return mno;
    }

    public int getCost() {
        return cost;
    }

    public String getSno() {
        return sno;
    }

    public String getRname() {
        return rname;
    }
}

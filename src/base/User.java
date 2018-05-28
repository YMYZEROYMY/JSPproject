
//基类：用户

package base;

public class User {
    private String Mno;
    private String Mname;
    private String birthday;
    private int money;
    private String tele;
    private String Mremark;
    private String passwd;
    private String date;

    public User(){
        super();
    }

    public void setMno(String Mno) {
        this.Mno = Mno;
    }

    public void setMname(String Mname) {
        this.Mname = Mname;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public void setMremark(String Mremark) {
        this.Mremark = Mremark;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getMno() {
        return this.Mno;
    }

    public String getMname() {
        return Mname;
    }

    public String getBirthday() {
        return birthday;
    }

    public int getMoney() {
        return money;
    }

    public String getTele() {
        return tele;
    }

    public String getMremark() {
        return Mremark;
    }

    public String getPasswd() {
        return passwd;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}


//用户的java bean

package bean;

import DAO.LoginOperator;
import DAO.UserOperator;
import base.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class AUser implements Serializable {
    private String mno;
    private User user;
    private ArrayList rentList;
    private ArrayList unRentList;
    private Map<String, String> userMap;
    private Map<String, String> errorMap;

    public AUser() {//构造函数
        super();
        this.mno = "";
        this.user = new User();
        rentList = new ArrayList();
        unRentList = new ArrayList();
        userMap = new HashMap<>();
        errorMap = new HashMap<>();
    }

    //租用店铺
    public boolean addRent(int i, String Rname) {
        Shop shop = getSubShop(i);
        return UserOperator.addRentShops(this.mno, shop.getSno(), Rname);
    }

    //取消店铺租用
    public boolean deleteRent(int i) {
        Rent rent = getSubRent(i);
        return UserOperator.deleteRent(rent.getSno());
    }

    //改店名
    public boolean alterRname(int i, String Rname) {
        Rent rent = getSubRent(i);
        return UserOperator.alterRname(rent.getSno(), Rname);
    }

    //修改个人信息
    public void setUserMap() {//导入用户列表
        userMap = LoginOperator.getList();
        userMap.remove(this.mno);
        userMap.put("admin", "root");
    }

    public boolean checkMno(String mno) {//检查编号是否被占用
        if (this.userMap.containsKey(mno)) {
            errorMap.put("checkMno", "该编号已被占用！");
            return false;//被占用返回false
        }
        return true;
    }

    public String getError(String key) {//获取修改失败信息
        String error = this.errorMap.get(key);
        return error == null ? "" : error;
    }

    public boolean updatePerson() {
        return UserOperator.updatePerson(this.mno, this.user);
    }//修改个人信息

    public void setErrorMap() {
        this.errorMap.clear();
    }

    //更新登录日期
    public void update(Date newdate) {
        UserOperator.update(this.mno, newdate);
    }

    //关键代码
    public void setMno(String mno) {
        this.mno = mno;
        setUser(UserOperator.getUser(this.mno));
        setRentList(UserOperator.getRentList(this.mno));
        setUnRentList(UserOperator.getShopList());
    }

    //获取一部分
    public Rent getSubRent(int i) {
        return (Rent) rentList.get(i);
    }

    public Shop getSubShop(int i) {
        return (Shop) unRentList.get(i);
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setRentList(ArrayList rentList) {
        this.rentList = rentList;
    }

    public void setUnRentList(ArrayList unRentList) {
        this.unRentList = unRentList;
    }

    public ArrayList getRentList() {
        return rentList;
    }

    public ArrayList getUnRentList() {
        return unRentList;
    }
}

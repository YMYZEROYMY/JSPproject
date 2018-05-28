
//管理员的java bean

package bean;

import DAO.AdminOperator;
import DAO.UserOperator;
import base.Rent;
import base.Shop;
import base.User;

import java.io.Serializable;
import java.util.ArrayList;

public class Admin implements Serializable {
    private User user;
    private Shop shop;
    private ArrayList userList;
    private ArrayList rentList;
    private ArrayList shopList;

    public Admin() {//构造函数
        super();
        this.user = new User();
        this.shop = new Shop();
        userList = new ArrayList();
        rentList = new ArrayList();
        shopList = new ArrayList();
        userList = AdminOperator.getUserList();
        rentList = AdminOperator.getRentList();
        shopList = AdminOperator.getShopList();
    }

    public boolean alterPerson() {
        return AdminOperator.alterUser(this.user);
    }//修改用户

    public boolean deletePerson(int i) {//删除用户
        User user = getSubUserList(i);
        return AdminOperator.deleteUser(user.getMno());
    }

    public boolean addShop() {
        return AdminOperator.addShop(this.shop);
    }//添加商铺

    public boolean alterShop() {
        return AdminOperator.alterShop(this.shop);
    }//修改商铺

    public boolean deleteShop(int i) {//删除商铺
        Shop shop = getSubShopList(i);
        return AdminOperator.deleteShop(shop.getSno());
    }

    public boolean deleteRent(int i) {//取消出租
        Rent rent = getSubRentList(i);
        return UserOperator.deleteRent(rent.getSno());
    }

    //获取单个List
    public User getSubUserList(int i) {
        return (User) userList.get(i);
    }

    public Shop getSubShopList(int i) {
        return (Shop) shopList.get(i);
    }

    public Rent getSubRentList(int i) {
        return (Rent) rentList.get(i);
    }

    public ArrayList getRentList() {
        return rentList;
    }

    public ArrayList getUserList() {
        return userList;
    }

    public ArrayList getShopList() {
        return shopList;
    }

    public void setUserList() {
        userList = AdminOperator.getUserList();
    }

    public void setShopList() {
        shopList = AdminOperator.getShopList();
    }

    public void setRentList() {
        rentList = AdminOperator.getRentList();
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

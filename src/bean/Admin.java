
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
    private String findUser;
    private String findRent;
    private String findShop;
    private User user;
    private Shop shop;
    private ArrayList userList;
    private ArrayList rentList;
    private ArrayList shopList;
    private ArrayList selfUserList;
    private ArrayList selfRentList;
    private ArrayList selfShopList;


    public Admin() {//构造函数
        super();
        this.findRent="";
        this.findShop="";
        this.findUser="";
        this.user = new User();
        this.shop = new Shop();
        userList = new ArrayList();
        rentList = new ArrayList();
        shopList = new ArrayList();
        selfRentList=new ArrayList();
        selfShopList=new ArrayList();
        selfUserList=new ArrayList();
        setSelfRentList();
        setSelfShopList();
        setSelfUserList();
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
        return (User) selfUserList.get(i);
    }

    public Shop getSubShopList(int i) {
        return (Shop) selfShopList.get(i);
    }

    public Rent getSubRentList(int i) {
        return (Rent) selfRentList.get(i);
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

    //查找

    public String getFindUser() {
        return findUser;
    }

    public void setFindUser(String findUser) {
        if(findUser==null){
            this.findUser="";
        }else{
            this.findUser = findUser ;
        }
    }

    public String getFindRent() {
        return findRent;
    }

    public void setFindRent(String findRent) {
        if(findRent==null){
            this.findRent="";
        }else{
            this.findRent = findRent;
        }
    }

    public String getFindShop() {
        return findShop;
    }

    public void setFindShop(String findShop) {
        if(findShop==null){
            this.findShop="";
        }else{
            this.findShop = findShop;
        }
    }

    //查找

    public ArrayList getSelfUserList() {
        return selfUserList;
    }

    public void setSelfUserList() {
        selfUserList.clear();
        userList=AdminOperator.getUserList();
        if(findUser==null||"".equals(findUser)){
            selfUserList=getUserList();
        }else{
            for(int i=0;i<userList.size();i++){
                 User user= (User) userList.get(i);
                if(user.getMno().contains(findUser)||user.getMname().contains(findUser)){
                    selfUserList.add(user);
                }
            }
        }
    }

    public ArrayList getSelfRentList() {
        return selfRentList;
    }

    public void setSelfRentList() {
        selfRentList.clear();
        rentList=AdminOperator.getRentList();
        if(findRent==null||"".equals(findRent)){
            selfRentList=getRentList();
        }else{
            for(int i=0;i<rentList.size();i++){
                Rent rent=(Rent)rentList.get(i);
                if(rent.getSno().contains(this.findRent)||rent.getMno().contains(this.findRent)){
                    selfRentList.add(rent);
                }
            }
        }
    }

    public ArrayList getSelfShopList() {
        return selfShopList;
    }

    public void setSelfShopList() {
        selfShopList.clear();
        shopList=AdminOperator.getShopList();
        if(findShop==null||"".equals(findShop)){
            selfShopList=shopList;
        }else{
            for(int i=0;i<shopList.size();i++){
                Shop shop=(Shop)shopList.get(i);
                if(shop.getSno().contains(this.findShop)){
                    selfShopList.add(shop);
                }
            }
        }
    }

    //获取租用详情
    public Shop getDetailRentShop(String sno){
        Shop shop=new Shop();
        for(int i=0;i<shopList.size();i++){
            if(sno.equals(((Shop)shopList.get(i)).getSno())){
                return (Shop)shopList.get(i);
            }
        }
        return shop;
    }

    public User getDetailRentUser(String mno){
        User user=new User();
        for(int i=0;i<userList.size();i++){
            if(mno.equals(((User)userList.get(i)).getMno())){
                return (User)userList.get(i);
            }
        }
        return user;
    }
}

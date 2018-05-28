
//登录和注册用java bean

package bean;

import DAO.LoginOperator;
import base.User;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class CheckUser implements Serializable {
    private String mno;
    private String passwd;
    private String mname;
    private String birthday;
    private String tele;
    private String mremark;
    private Map<String, String> userMap;
    private Map<String, String> errorMap;

    public CheckUser() {//构造函数
        super();
        this.mno = "";
        this.passwd = "";
        this.mname = "";
        this.tele = "";
        userMap = new HashMap<>();
        errorMap = new HashMap<>();
    }

    public boolean check() {//登录检测
        boolean flag = true;
        if (!this.userMap.containsKey(this.mno)) {//判断用户是否存在
            flag = false;
            errorMap.put("Mno", "该用户不存在！");
            this.mno = "";
            this.passwd = "";
            return flag;
        }
        String passwd = this.userMap.get(this.mno);
        if (passwd == null || !passwd.equals(this.passwd)) {//判断密码是否正确
            flag = false;
            errorMap.put("passwd", "密码错误，请输入正确的密码！");
            this.passwd = "";
        }
        return flag;
    }

    public boolean checkRegister() {//注册检验
        if (this.userMap.containsKey(this.mno)) {
            errorMap.put("register", "该编号已被占用！");
            return false;//被占用返回false
        }
        return true;
    }

    public boolean addUser() {//添加用户
        User newUser = new User();
        newUser.setMno(this.mno);
        newUser.setMname(this.mname);
        newUser.setBirthday(this.birthday);
        newUser.setMoney(0);
        newUser.setMremark(this.mremark);
        newUser.setTele(this.tele);
        newUser.setPasswd(this.passwd);
        return LoginOperator.addUser(newUser);
    }

    public String getError(String key) {//获取失败信息
        String error = this.errorMap.get(key);
        return error == null ? "" : error;
    }

    public void setUserMap() {//导入用户列表
        userMap = LoginOperator.getList();
        userMap.put("admin", "root");
    }

    public String getPasswd() {
        return passwd;
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public void setErrorMap() {
        this.errorMap.clear();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public String getMremark() {
        return mremark;
    }

    public void setMremark(String mremark) {
        this.mremark = mremark;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

}

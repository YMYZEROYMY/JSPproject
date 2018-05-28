

//用户操作数据库的函数支持

package DAO;

import base.Rent;
import base.Shop;
import base.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class UserOperator {
    public static User getUser(String mno) {//获取个人信息
        User user = new User();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select * from Men where Mno=" + mno;
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    user.setMno(rs.getString("Mno"));
                    user.setMname(rs.getString("Mname"));
                    user.setPasswd(rs.getString("passwd"));
                    user.setTele(rs.getString("tele"));
                    user.setMremark(rs.getString("Mremark"));
                    user.setMoney(rs.getInt("money"));
                    user.setBirthday(rs.getString("birthday"));
                    user.setDate(rs.getString("date"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, rs, conn);
        }
        return user;
    }

    public static ArrayList getRentList(String mno) {//获取租用列表
        ArrayList rentList = new ArrayList();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select Sno,Mno,Rname,cost from rentview where Mno=" + mno;
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Rent rent = new Rent();
                    rent.setSno(rs.getString("Sno"));
                    rent.setMno(rs.getString("Mno"));
                    rent.setCost(rs.getInt("cost"));
                    rent.setRname(rs.getString("Rname"));
                    rentList.add(rent);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, rs, conn);
        }
        return rentList;
    }

    public static ArrayList getShopList() {//获取可被租用的店铺列表
        ArrayList shopList = new ArrayList();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select Sno,addr,cost,Sremark from emptyshops";
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Shop shop = new Shop();
                    shop.setSno(rs.getString("Sno"));
                    shop.setAddr(rs.getString("addr"));
                    shop.setCost(rs.getInt("cost"));
                    shop.setSremark(rs.getString("Sremark"));
                    shopList.add(shop);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, rs, conn);
        }
        return shopList;
    }

    //修改用户信息
    public static boolean updatePerson(String mno, User user) {
        int re = 0;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBOperator.getconnection();
            String sql = "UPDATE Men set Mno=?,Mname=?,birthday=?,tele=?,Mremark=?,passwd=? where Mno=?";
            pst = conn.prepareStatement(sql);

            pst.setString(1, user.getMno());
            pst.setString(2, user.getMname());
            pst.setString(3, user.getBirthday());
            pst.setString(4, user.getTele());
            pst.setString(5, user.getMremark());
            pst.setString(6, user.getPasswd());
            pst.setString(7, mno);
            re = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }

    public static void update(String mno, Date newdate) {//自动更新时间
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBOperator.getconnection();
            String sql = "update Men set date=? where Mno=?";
            pst = conn.prepareStatement(sql);

            pst.setString(1, String.valueOf(newdate));
            pst.setString(2, mno);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
    }

    public static boolean deleteRent(String Sno) {//取消租用
        Connection conn = null;
        Statement st = null;
        int re = 0;

        try {
            conn = DBOperator.getconnection();
            String sql = "delete from rent where Sno=" + Sno;
            st = conn.createStatement();
            re = st.executeUpdate(sql);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, null, conn);
        }
        return re > 0;
    }

    public static boolean addRentShops(String Mno, String Sno, String Rname) {//租用店铺
        Connection conn = null;
        PreparedStatement pst = null;
        int re = 0;
        try {
            conn = DBOperator.getconnection();
            String sql = "insert into rent values (?,?,?)";
            pst = conn.prepareStatement(sql);

            pst.setString(1, Sno);
            pst.setString(2, Mno);
            pst.setString(3, Rname);

            re = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }

    //改店名
    public static boolean alterRname(String Sno, String Rname) {
        Connection conn = null;
        PreparedStatement pst = null;
        int re = 0;
        try {
            conn = DBOperator.getconnection();
            String sql = "UPDATE rent SET Rname=? where Sno=?";
            pst = conn.prepareStatement(sql);

            pst.setString(1, Rname);
            pst.setString(2, Sno);
            re = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }
}

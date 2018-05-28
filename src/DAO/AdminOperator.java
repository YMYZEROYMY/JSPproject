

//管理员操作数据库的函数支持

package DAO;

import base.Rent;
import base.Shop;
import base.User;
import com.mysql.jdbc.ConnectionFeatureNotAvailableException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminOperator {
    //改用户信息
    public static boolean alterUser(User u) {
        int re = 0;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn = DBOperator.getconnection();
            String sql = "UPDATE Men set Mname=?,birthday=?,money=?,tele=?,Mremark=?,passwd=? where Mno=?";
            pst = conn.prepareStatement(sql);

            pst.setString(7, u.getMno());
            pst.setString(1, u.getMname());
            pst.setString(2, u.getBirthday());
            pst.setInt(3, u.getMoney());
            pst.setString(4, u.getTele());
            pst.setString(5, u.getMremark());
            pst.setString(6, u.getPasswd());

            re = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }

    //删除用户
    public static boolean deleteUser(String Mno) {
        Connection conn = null;
        Statement st = null;
        int re = 0;
        try {
            conn = DBOperator.getconnection();
            String sql = "delete from Men where Mno=" + Mno;
            st = conn.createStatement();
            re = st.executeUpdate(sql);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, null, conn);
        }
        return re > 0;
    }

    //添加店铺
    public static boolean addShop(Shop shops) {
        Connection conn = null;
        PreparedStatement pst = null;
        int re = 0;
        try {
            conn = DBOperator.getconnection();
            String sql = "insert into shops values (?,?,?,?,?)";
            pst = conn.prepareStatement(sql);

            pst.setString(1, shops.getSno());
            pst.setString(2, shops.getAddr());
            pst.setInt(3, shops.getCost());
            pst.setString(4, shops.getSremark());
            pst.setString(5, shops.getState());

            re = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }

    //修改店铺信息
    public static boolean alterShop(Shop shops) {
        Connection conn = null;
        PreparedStatement pst = null;
        int re = 0;

        try {
            conn = DBOperator.getconnection();
            String sql = "update shops set addr=?,cost=?,Sremark=?,state=? where Sno=" + shops.getSno();
            pst = conn.prepareStatement(sql);

            pst.setString(1, shops.getAddr());
            pst.setInt(2, shops.getCost());
            pst.setString(3, shops.getSremark());
            pst.setString(4, shops.getState());

            re = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(pst, conn);
        }
        return re > 0;
    }

    //删除店铺
    public static boolean deleteShop(String Sno) {
        Connection conn = null;
        Statement st = null;
        int re = 0;

        try {
            conn = DBOperator.getconnection();
            String sql = "delete from shops where Sno=" + Sno;
            st = conn.createStatement();

            re = st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, null, conn);
        }
        return re > 0;
    }

    //取消租用用UserOperator.deleteRent();

    //获取用户表
    public static ArrayList getUserList() {
        ArrayList userList = new ArrayList();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select * from Men;";
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    User user = new User();
                    user.setMno(rs.getString("Mno"));
                    user.setMname(rs.getString("Mname"));
                    user.setBirthday(rs.getString("birthday"));
                    user.setMoney(rs.getInt("money"));
                    user.setTele(rs.getString("tele"));
                    user.setMremark(rs.getString("Mremark"));
                    user.setPasswd(rs.getString("passwd"));
                    userList.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, rs, conn);
        }
        return userList;
    }

    //获取商铺表
    public static ArrayList getShopList() {
        ArrayList shopList = new ArrayList();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select * from shops";
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Shop shop = new Shop();
                    shop.setSno(rs.getString("Sno"));
                    shop.setAddr(rs.getString("addr"));
                    shop.setCost(rs.getInt("cost"));
                    shop.setSremark(rs.getString("Sremark"));
                    shop.setState(rs.getString("state"));
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

    //获取租用表
    public static ArrayList getRentList() {
        ArrayList rentList = new ArrayList();
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select * from rentview";
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    Rent rent = new Rent();
                    rent.setSno(rs.getString("Sno"));
                    rent.setMno(rs.getString("Mno"));
                    rent.setRname(rs.getString("Rname"));
                    rent.setCost(rs.getInt("cost"));
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
}

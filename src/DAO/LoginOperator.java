

//登录及注册操作数据库的函数支持

package DAO;

import base.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class LoginOperator {
    public static Map<String, String> getList() {//获取用户及密码列表
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        Map<String, String> loginList = new HashMap<>();
        try {
            conn = DBOperator.getconnection();
            st = conn.createStatement();
            String sql = "select Mno,passwd from Men";
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    loginList.put(rs.getString("Mno"), rs.getString("passwd"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(st, rs, conn);
        }
        return loginList;
    }

    public static boolean addUser(User user) {//添加用户
        Connection conn = null;
        PreparedStatement ps = null;
        int re = 0;
        try {
            conn = DBOperator.getconnection();
            String sql = "insert into Men(Mno,Mname,birthday,money,tele,Mremark,passwd) values (?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, user.getMno());
            ps.setString(2, user.getMname());
            ps.setString(3, user.getBirthday());
            ps.setInt(4, user.getMoney());
            ps.setString(5, user.getTele());
            ps.setString(6, user.getMremark());
            ps.setString(7, user.getPasswd());

            re = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBOperator.close(ps, conn);
        }
        return re > 0;
    }
}

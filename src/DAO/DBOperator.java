

//提供数据库连接、及关闭

package DAO;

import java.sql.*;

public class DBOperator {

    protected final static String url = "jdbc:mysql://localhost:3306/ymy1?useUnicode=true&characterEncoding=utf-8&useSSL=false";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Connection getconnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, "root", "123123123");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void close(Statement st, ResultSet rs, Connection conn) {
        try {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void close(PreparedStatement pst, Connection conn) {
        try {
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


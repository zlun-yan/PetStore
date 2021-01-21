package org.csu.petstore.persistence;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.*;

public class DBUtil {
    private static final ComboPooledDataSource dataSource = new ComboPooledDataSource("c3p0-config.xml");

    /**
     * 获取数据库连接
     * @return 返回数据库连接
     */
    public static Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return null;
    }

    /**
     * 关闭打开的资源
     * @param rs 打开的结果集
     * @param stmt  打开的PreparedStatement
     * @param connection  打开的数据库连接
     * @throws SQLException
     */
    public static void close(ResultSet rs, Statement stmt, Connection connection) {
        //关闭rs
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }
}

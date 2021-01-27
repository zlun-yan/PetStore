package org.csu.petstore.persistence.Impl;

import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAOImpl implements CartDAO {
    private static final String INSERT_CART_ITEM_BY_USER_ID_ITEM_ID_NUM =
            "INSERT INTO CART(USER_ID, ITEM_ID, NUM) " +
                    "VALUES(?, ?, ?)";
    @Override
    public boolean insertCartItemByUserIdAndItemIdAndNum(int userId, int itemId, int num) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_CART_ITEM_BY_USER_ID_ITEM_ID_NUM);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, itemId);
            preparedStatement.setInt(3, num);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return false;
    }
}

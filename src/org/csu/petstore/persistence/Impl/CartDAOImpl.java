package org.csu.petstore.persistence.Impl;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.Cart;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {
    private static final String INSERT_CART_ITEM_BY_USER_ID_ITEM_ID_NUM =
            "INSERT INTO CART(USER_ID, ITEM_ID, NUM) " +
                    "VALUES(?, ?, ?)";
    private static final String GET_CART_BY_USERID =
            "SELECT ID, USER_ID, ITEM_ID, NUM " +
                    "FROM CART WHERE USER_ID = ?";


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

    @Override
    public List<Cart> getCartListByUserId(int userId) {
        List<Cart> cartList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_CART_BY_USERID);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Cart cart = new Cart();

                cart.setId(resultSet.getInt(1));
                cart.setUserId(resultSet.getInt(2));
                cart.setItemId(resultSet.getInt(3));
                cart.setNum(resultSet.getInt(4));

                cartList.add(cart);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return cartList;
    }
}

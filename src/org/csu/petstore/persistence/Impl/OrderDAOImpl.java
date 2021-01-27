package org.csu.petstore.persistence.Impl;

import com.mysql.jdbc.Statement;
import org.csu.petstore.domain.Order;
import org.csu.petstore.persistence.DBUtil;
import org.csu.petstore.persistence.OrderDAO;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDAOImpl implements OrderDAO {
    private static final String INSERT_ORDER =
            "INSERT INTO ORDERS(USER_ID, STATE, TOTPRICE, STATE_DATE) VALUES(?, ?, ?, ?)";
    private static final String UPDATE_ORDER_STATE_BY_ID =
            "UPDATE ORDERS SET STATE = ? WHERE ID = ?";
    private static final String UPDATE_ORDER_END_DATE_BY_ID =
            "UPDATE ORDERS SET END_DATE = ? WHERE ID = ?";

    @Override
    public int insertOrder(Order order) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setInt(2, order.getState());
            preparedStatement.setBigDecimal(3, new BigDecimal(Double.valueOf(order.getTotPrice())));
            preparedStatement.setString(4, order.getStartDate());

            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
            else {
                return 0;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return 0;
    }

    @Override
    public boolean updateOrderStateById(int id, int state) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_ORDER_STATE_BY_ID);
            preparedStatement.setInt(1, state);
            preparedStatement.setInt(2, id);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }

    @Override
    public boolean updateOrderEndDateById(int id, String endDate) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_ORDER_END_DATE_BY_ID);
            preparedStatement.setString(1, endDate);
            preparedStatement.setInt(2, id);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }
}

package org.csu.petstore.persistence.Impl;

import com.mysql.jdbc.Statement;
import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.Order;
import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.DBUtil;
import org.csu.petstore.persistence.OrderDAO;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    private static final String INSERT_ORDER =
            "INSERT INTO ORDERS(USER_ID, STATE, ADDR_ID, TOTPRICE, START_DATE) VALUES(?, ?, ?, ?, ?)";
    private static final String UPDATE_ORDER_STATE_BY_ID =
            "UPDATE ORDERS SET STATE = ? WHERE ID = ?";
    private static final String UPDATE_ORDER_END_DATE_BY_ID =
            "UPDATE ORDERS SET END_DATE = ? WHERE ID = ?";
    private static final String GET_ORDER_LIST_BY_USER_ID =
            "SELECT ID, USER_ID, STATE, ADDR_ID, TOTPRICE, START_DATE, END_DATE " +
                    "FROM ORDERS WHERE USER_ID = ?";
    private static final String GET_ORDER_BY_ID =
            "SELECT ID, USER_ID, STATE, ADDR_ID, TOTPRICE, START_DATE, END_DATE " +
                    "FROM ORDERS WHERE ID = ?";
    private static final String DELETE_ORDER_BY_ID =
            "DELETE FROM ORDERS WHERE ID = ?";

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
            preparedStatement.setInt(3, order.getAddrId());
            preparedStatement.setBigDecimal(4, new BigDecimal(Double.valueOf(order.getTotPrice())));
            preparedStatement.setString(5, order.getStartDate());

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

    @Override
    public List<Order> getOrderListByUserId(int userId) {
        List<Order> orderList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ORDER_LIST_BY_USER_ID);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();

                order.setId(resultSet.getInt(1));
                order.setUserId(resultSet.getInt(2));
                order.setState(resultSet.getInt(3));
                order.setAddrId(resultSet.getInt(4));
                order.setTotPrice(resultSet.getDouble(5));
                order.setStartDate(resultSet.getString(6));
                order.setEndDate(resultSet.getString(7));

                orderList.add(order);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return orderList;
    }

    @Override
    public Order getOrderById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        Order order = new Order();
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ORDER_BY_ID);
            preparedStatement.setInt(1, id);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                order.setId(resultSet.getInt(1));
                order.setUserId(resultSet.getInt(2));
                order.setState(resultSet.getInt(3));
                order.setAddrId(resultSet.getInt(4));
                order.setTotPrice(resultSet.getDouble(5));
                order.setStartDate(resultSet.getString(6));
                order.setEndDate(resultSet.getString(7));

                return order;
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }
        return null;
    }

    @Override
    public boolean deleteOrderById(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(DELETE_ORDER_BY_ID);
            preparedStatement.setInt(1, id);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }
}

package org.csu.petstore.persistence.Impl;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.Clauses;
import org.csu.petstore.persistence.ClausesDAO;
import org.csu.petstore.persistence.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClausesDAOImpl implements ClausesDAO {
    private static final String INSERT_CLAUSES =
            "INSERT INTO CLAUSES(ORDER_ID, ITEM_NAME, ITEM_PRICE, ITEM_URL, NUM) VALUES(?, ?, ?, ?, ?)";
    private static final String GET_CLAUSES_LIST_BY_ORDER_ID =
            "SELECT ID, ORDER_ID, ITEM_NAME, ITEM_PRICE, ITEM_URL, NUM " +
                    "FROM CLAUSES WHERE ORDER_ID = ?";

    @Override
    public boolean insertClauses(Clauses clauses) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_CLAUSES);
            preparedStatement.setInt(1, clauses.getId());
            preparedStatement.setString(2, clauses.getItemName());
            preparedStatement.setBigDecimal(3, new BigDecimal(Double.valueOf(clauses.getItemPrice())));
            preparedStatement.setString(4, clauses.getItemPicURL());
            preparedStatement.setInt(5, clauses.getNum());

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return false;
    }

    @Override
    public List<Clauses> getClausesListByOrderId(int orderId) {
        List<Clauses> clausesList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_CLAUSES_LIST_BY_ORDER_ID);
            preparedStatement.setInt(1, orderId);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Clauses clauses = new Clauses();

                clauses.setId(resultSet.getInt(1));
                clauses.setOrderId(resultSet.getInt(2));
                clauses.setItemName(resultSet.getString(3));
                clauses.setItemPrice(resultSet.getDouble(4));
                clauses.setItemPicURL(resultSet.getString(5));
                clauses.setNum(resultSet.getInt(6));

                clausesList.add(clauses);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return clausesList;
    }
}

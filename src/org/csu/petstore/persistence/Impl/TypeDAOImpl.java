package org.csu.petstore.persistence.Impl;

import org.csu.petstore.domain.Item;
import org.csu.petstore.domain.Type;
import org.csu.petstore.persistence.DBUtil;
import org.csu.petstore.persistence.TypeDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TypeDAOImpl implements TypeDAO {
    private static final String GET_TYPE_BY_ID =
            "SELECT ID, NAME, DETAILS, PIC " +
                    "FROM TYPE WHERE ID = ?";

    @Override
    public Type getTypeByTypeId(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        Type type = new Type();
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_TYPE_BY_ID);
            preparedStatement.setInt(1, id);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                type.setId(resultSet.getInt(1));
                type.setName(resultSet.getString(2));
                type.setDetails(resultSet.getString(3));
                type.setPicURL(resultSet.getString(4));

                return type;
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }
        return type;
    }
}

package org.csu.petstore.persistence.Impl;

import org.csu.petstore.domain.User;
import org.csu.petstore.persistence.DBUtil;
import org.csu.petstore.persistence.UserDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {
    private static final String GET_USER_BY_UESRNAME =
            "SELECT ID, USERNAME, EMAIL, PASSWORD, AVATAR_URL, DEFAULT_ADDR_ID, ADDRESS_NUM " +
                    "FROM USERS " +
                    "WHERE USERNAME = ?";
    private static final String GET_USER_BY_EMAIL =
            "SELECT ID, USERNAME, EMAIL, PASSWORD, AVATAR_URL, DEFAULT_ADDR_ID, ADDRESS_NUM " +
                    "FROM USERS " +
                    "WHERE EMAIL = ?";
    private static final String UPDATE_PASSWORD_BY_EMAIL =
            "UPDATE USERS SET PASSWORD = ? WHERE USERNAME = ?";


    private static final String UPDATE_ADDRESS_NUM_BY_ID =
            "UPDATE USERS SET ADDRESS_NUM = ? WHERE ID = ?";

    private static final String UPDATE_ADDRESS_DEFAULT_BY_ID =
            "UPDATE USERS SET DEFAULT_ADDR_ID = ? WHERE ID = ?";

    private static final String INSERT_USER =
            "INSERT INTO USERS(USERNAME, EMAIL, PASSWORD) VALUES(?, ?, ?)";

    @Override
    public User getUserByUsername(String username) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        User user = new User();
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_USER_BY_UESRNAME);
            preparedStatement.setString(1, username);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
                user.setUsername(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setPassword(resultSet.getString(4));
                user.setAvatar_url(resultSet.getString(5));
                user.setDefault_addr_id(resultSet.getInt(6));
                user.setAddress_num(resultSet.getInt(7));

                return user;
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }
        return null;
    }

    @Override
    public User getUserByEmail(String email) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        User user = new User();
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_USER_BY_EMAIL);
            preparedStatement.setString(1, email);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user.setId(resultSet.getInt(1));
                user.setUsername(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setPassword(resultSet.getString(4));
                user.setAvatar_url(resultSet.getString(5));
                user.setDefault_addr_id(resultSet.getInt(6));
                user.setAddress_num(resultSet.getInt(7));

                return user;
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }
        return null;
    }

    @Override
    public boolean updatePasswordByUsername(String username, String password) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_PASSWORD_BY_EMAIL);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, username);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }

    public boolean insertUser(User user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return false;
    }

    public boolean updateUserAddressNumById(int userId, int value) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_ADDRESS_NUM_BY_ID);
            preparedStatement.setInt(1, value);
            preparedStatement.setInt(2, userId);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }

    public boolean updateUserAddressDefaultById(int userId, int addressId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(UPDATE_ADDRESS_DEFAULT_BY_ID);
            preparedStatement.setInt(1, addressId);
            preparedStatement.setInt(2, userId);

            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(null, preparedStatement, connection);
        }

        return false;
    }
}

package org.csu.petstore.persistence.Impl;

import com.mysql.jdbc.Statement;
import org.csu.petstore.domain.Address;
import org.csu.petstore.persistence.AddressDAO;
import org.csu.petstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressDAOImpl implements AddressDAO {
    private static final String GET_ADDRESS_BY_USERID =
            "SELECT ID, USER_ID, PROVINCE, CITY, DISTRICT, ADDRESS_CODE, DETAILS, NAME, PHONE FROM ADDRESS WHERE USER_ID = ?";
    private static final String INSERT_USER =
            "INSERT INTO ADDRESS(USER_ID, PROVINCE, CITY, DISTRICT, ADDRESS_CODE, DETAILS, NAME, PHONE) " +
                    "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

    @Override
    public int insertAddress(Address address) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(INSERT_USER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, address.getUserId());
            preparedStatement.setString(2, address.getProvince());
            preparedStatement.setString(3, address.getCity());
            preparedStatement.setString(4, address.getDistrict());
            preparedStatement.setInt(5, address.getAddressCode());
            preparedStatement.setString(6, address.getDetails());
            preparedStatement.setString(7, address.getName());
            preparedStatement.setString(8, address.getPhone());

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

    public List<Address> getAddressByUserId(int userId) {
        List<Address> addressList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ADDRESS_BY_USERID);
            preparedStatement.setInt(1, userId);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Address address = new Address();

                address.setId(resultSet.getInt(1));
                address.setUserId(resultSet.getInt(2));
                address.setProvince(resultSet.getString(3));
                address.setCity(resultSet.getString(4));
                address.setDistrict(resultSet.getString(5));
                address.setAddressCode(resultSet.getInt(6));
                address.setDetails(resultSet.getString(7));
                address.setName(resultSet.getString(8));
                address.setPhone(resultSet.getString(9));

                addressList.add(address);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return addressList;
    }
}

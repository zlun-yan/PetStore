package org.csu.petstore.persistence.Impl;

import org.csu.petstore.domain.Address;
import org.csu.petstore.domain.Item;
import org.csu.petstore.persistence.DBUtil;
import org.csu.petstore.persistence.ItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl implements ItemDAO {
    private static final String GET_ITEM_LIST_BY_TYPE_ID =
            "SELECT ID, NAME, PRICE, NUM, USER_ID, TYPE_ID, TAGS, DETAILS, PIC, DATE, SALE " +
                    "FROM ITEM WHERE TYPE_ID = ?";

    @Override
    public List<Item> getItemByTypeId(int typeId) {
        List<Item> itemList = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(GET_ITEM_LIST_BY_TYPE_ID);
            preparedStatement.setInt(1, typeId);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();

                item.setId(resultSet.getInt(1));
                item.setName(resultSet.getString(2));
                item.setPrice(resultSet.getDouble(3));
                // 获取decimal类型的数据是用double吗
                item.setNum(resultSet.getInt(4));
                item.setUserId(resultSet.getInt(5));
                item.setTypeId(resultSet.getInt(6));
                item.setTags(resultSet.getString(7));
                item.setDetails(resultSet.getString(8));
                item.setPicUrl(resultSet.getString(9));
                item.setDate(resultSet.getString(10));
                item.setSale(resultSet.getInt(11));

                itemList.add(item);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBUtil.close(resultSet, preparedStatement, connection);
        }

        return itemList;
    }
}

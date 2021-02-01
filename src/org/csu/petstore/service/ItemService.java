package org.csu.petstore.service;

import org.csu.petstore.domain.Item;
import org.csu.petstore.persistence.Impl.ItemDAOImpl;
import org.csu.petstore.persistence.ItemDAO;

import java.util.List;

public class ItemService {
    private ItemDAO itemDAO;

    public ItemService() {
        itemDAO = new ItemDAOImpl();
    }

    public List<Item> searchItemList(String keyword) {
        return itemDAO.getItemListLikeItemName("%" + keyword.toLowerCase() + "%");
    }

    public Item getItemByItemId(int id) {
        return itemDAO.getItemByItemId(id);
    }
}

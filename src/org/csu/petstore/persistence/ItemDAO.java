package org.csu.petstore.persistence;

import org.csu.petstore.domain.Item;

import java.util.List;

public interface ItemDAO {
    List<Item> getItemByTypeId(int typeId);

    Item getItemByItemId(int itemId);

    List<Item> getItemListLikeItemName(String keyword);
}

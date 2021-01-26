package org.csu.petstore.persistence;

import org.csu.petstore.domain.Item;

import java.util.List;

public interface ItemDAO {
    List<Item> getItemByTypeId(int typeId);
}

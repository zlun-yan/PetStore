package org.csu.petstore.persistence;

import org.csu.petstore.domain.Type;

public interface TypeDAO {
    Type getTypeByTypeId(int id);
}

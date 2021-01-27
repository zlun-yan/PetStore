package org.csu.petstore.persistence;

import org.csu.petstore.domain.Clauses;

import java.util.List;

public interface ClausesDAO {
    boolean insertClauses(Clauses clauses);

    List<Clauses> getClausesListByOrderId(int orderId);
}

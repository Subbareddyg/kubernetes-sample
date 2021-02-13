package com.cl.stockmanager.repositories;

import org.springframework.data.repository.CrudRepository;
import com.cl.stockmanager.model.Stock;

public interface StockRepository extends CrudRepository<Stock, String> {
}

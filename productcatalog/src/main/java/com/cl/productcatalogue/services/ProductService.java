package com.cl.productcatalogue.services;

import java.math.BigDecimal;
import java.util.*;

import com.cl.productcatalogue.model.Product;

public class ProductService {

    //{productId, Product}
    private Map<String, Product> fakeProductDAO = new HashMap<>();

    public ProductService() {
        fakeProductDAO.put("1", new Product("1", "Widget", "Premium ACME Widgets", new BigDecimal(1.20)));
        fakeProductDAO.put("2", new Product("2", "Sprocket", "Grade B sprockets", new BigDecimal(4.10)));
        fakeProductDAO.put("3", new Product("3", "Anvil", "Large Anvils", new BigDecimal(45.50)));
        fakeProductDAO.put("4", new Product("4", "Cogs", "Grade Y cogs", new BigDecimal(1.80)));
        fakeProductDAO.put("5", new Product("5", "Multitool", "Multitools", new BigDecimal(154.10)));
        fakeProductDAO.put("6", new Product("6", "Ring", "Awesome Ring", new BigDecimal(699.10)));
        fakeProductDAO.put("7", new Product("7", "Ear Rings", "Ear Rings", new BigDecimal(800.10)));
    }

    public List<Product> getAllProducts() {
        return new ArrayList<>(fakeProductDAO.values());
    }

    public Optional<Product> getProduct(String id) {
        return Optional.ofNullable(fakeProductDAO.get(id));
    }
}

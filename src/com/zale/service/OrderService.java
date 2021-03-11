package com.zale.service;

import com.zale.pojo.Cart;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);
}

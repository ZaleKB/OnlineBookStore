package com.zale.test;

import com.zale.pojo.Cart;
import com.zale.pojo.CartItem;
import com.zale.service.OrderService;
import com.zale.service.impl.OrderServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

public class OrderServiceTest {

    @Test
    public void createOrder() {

        Cart cart = new Cart();

        cart.addItem(new CartItem(1, "abc", 1, new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem(1, "abcd", 1, new BigDecimal(1000),new BigDecimal(1000)));
        cart.addItem(new CartItem(2, "abcde", 1, new BigDecimal(100),new BigDecimal(100)));

        OrderService orderService = new OrderServiceImpl();

        System.out.println( "OrderID: " + orderService.createOrder(cart, 1) );

    }
}
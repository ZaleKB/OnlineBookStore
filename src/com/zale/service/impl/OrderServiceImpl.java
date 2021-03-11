package com.zale.service.impl;

import com.zale.dao.BookDao;
import com.zale.dao.OrderDao;
import com.zale.dao.OrderItemDao;
import com.zale.dao.impl.BookDaoImpl;
import com.zale.dao.impl.OrderDaoImpl;
import com.zale.dao.impl.OrderItemDaoImpl;
import com.zale.pojo.*;
import com.zale.service.OrderService;

import java.util.Date;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public String createOrder(Cart cart, Integer userId) {

        // orderId should be unique
        String orderId = System.currentTimeMillis()+""+userId;
        // create Order subject
        Order order = new Order(orderId,new Date(),cart.getTotalPrice(), 0,userId);
        // save order
        orderDao.saveOrder(order);


        // transform every cartItem to orderItem
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()){

            CartItem cartItem = entry.getValue();
            OrderItem orderItem = new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(), orderId);

            orderItemDao.saveOrderItem(orderItem);

            // update sale and stock
            Book book = bookDao.queryBookById(cartItem.getId());
            book.setSales( book.getSales() + cartItem.getCount() );
            book.setStock( book.getStock() - cartItem.getCount() );
            bookDao.updateBook(book);

        }
        // clear cart
        cart.clear();

        return orderId;
    }
}

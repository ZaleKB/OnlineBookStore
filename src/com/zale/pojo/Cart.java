package com.zale.pojo;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Cart subject
 */
public class Cart {


    /**
     * key is the itemId，
     * value is the item subject information
     */
    private Map<Integer,CartItem> items = new LinkedHashMap<>();

    /**
     * add item
     *
     * @param cartItem
     */
    public void addItem(CartItem cartItem) {
        // check if the item already in the cart, if yes, then item count increase, if no put into the collection
        CartItem item = items.get(cartItem.getId());

        if (item == null) {
            items.put(cartItem.getId(), cartItem);
        }
        else {

            item.setCount( item.getCount() + 1 ); // increase item number
            item.setTotalPrice( item.getPrice().multiply(new BigDecimal( item.getCount() )) ); // update total price
        }
    }


    public void deleteItem(Integer id) {
        items.remove(id);
    }


    /**
     * clear the cart
     */
    public void clear() {
        items.clear();
    }

    /**
     * update the number of item
     */
    public void updateCount(Integer id,Integer count) {
        // check if the item already in the cart
        CartItem cartItem = items.get(id);
        if (cartItem != null) {
            cartItem.setCount(count);
            cartItem.setTotalPrice( cartItem.getPrice().multiply(new BigDecimal( cartItem.getCount() )) ); // update total Price
        }
    }


    public Integer getTotalCount() {
        Integer totalCount = 0;

        for (Map.Entry<Integer,CartItem>entry : items.entrySet()) {
            totalCount += entry.getValue().getCount();
        }

        return totalCount;
    }


    public BigDecimal getTotalPrice() {
        BigDecimal totalPrice = new BigDecimal(0);

        for (Map.Entry<Integer,CartItem>entry : items.entrySet()) {
            totalPrice = totalPrice.add(entry.getValue().getTotalPrice());
        }
        return totalPrice;
    }


    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "totalCount=" + getTotalCount() +
                ", totalPrice=" + getTotalPrice() +
                ", items=" + items +
                '}';
    }
}

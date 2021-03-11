package com.zale.web;

import com.zale.pojo.Cart;
import com.zale.pojo.User;
import com.zale.service.OrderService;
import com.zale.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderServlet extends BaseServlet {

    private OrderService orderService = new OrderServiceImpl();

    /**
     * Create Order
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // first get Cart subject
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        // get UserId
        User loginUser = (User) req.getSession().getAttribute("user");

        // need to login first
        if (loginUser == null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }


        Integer userId = loginUser.getId();

        String orderId = orderService.createOrder(cart, userId);

        req.getSession().setAttribute("orderId",orderId);

        resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");
    }

}

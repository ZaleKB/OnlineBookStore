package com.zale.web;

import com.zale.pojo.Book;
import com.zale.pojo.Cart;
import com.zale.pojo.CartItem;
import com.zale.service.BookService;
import com.zale.service.impl.BookServiceImpl;
import com.zale.utils.WebUtils;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends BaseServlet {

    private BookService bookService = new BookServiceImpl();

    /**
     * update item number
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        int id = WebUtils.parseInt(req.getParameter("id"),0);
        int count = WebUtils.parseInt(req.getParameter("count"), 1);

        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            cart.updateCount(id,count);
            resp.sendRedirect(req.getHeader("Referer")); //
        }
    }

    /**
     * clear cart
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.clear();
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    /**
     * delete item
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            cart.deleteItem(id);
            resp.sendRedirect(req.getHeader("Referer"));
        }

    }


    /**
     * add item to cart
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = WebUtils.parseInt(req.getParameter("id"), 0);

        Book book = bookService.queryBookById(id);

        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());

        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);

        //add last item name (for front-end exhibition)
        req.getSession().setAttribute("lastName", cartItem.getName());

        resp.sendRedirect(req.getHeader("Referer"));
    }

    protected void ajaxAddItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = WebUtils.parseInt(req.getParameter("id"), 0);

        Book book = bookService.queryBookById(id);

        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());

        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);

        System.out.println(cart);

        req.getSession().setAttribute("lastName", cartItem.getName());

        //return totalCount and LastName of the Cart and write to response (Json format)
        Map<String,Object> resultMap = new HashMap<>();

        resultMap.put("totalCount", cart.getTotalCount());
        resultMap.put("lastName",cartItem.getName());

        Gson gson = new Gson();
        String resultMapJsonString = gson.toJson(resultMap);

        resp.getWriter().write(resultMapJsonString);

    }

}

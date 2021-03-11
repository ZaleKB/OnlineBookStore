package com.zale.web;

import com.zale.pojo.Book;
import com.zale.pojo.Page;
import com.zale.service.BookService;
import com.zale.service.impl.BookServiceImpl;
import com.zale.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends BaseServlet{

    private BookService bookService = new BookServiceImpl();

    /**
     * Paging function
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // request parameter pageNo and pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        // invoke BookService.page(pageNo，pageSize): Page subject
        Page<Book> page = bookService.page(pageNo,pageSize);

        page.setUrl("manager/bookServlet?action=page");

        // save to the request domain
        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req,resp);
    }



    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 0);
        pageNo+=1;
        // encapsulate to book subject
        Book book = WebUtils.copyParamToBean(req.getParameterMap(),new Book());

        bookService.addBook(book);

        resp.sendRedirect(req.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + pageNo);

    }



    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        bookService.deleteBookById(id);

        resp.sendRedirect(req.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + req.getParameter("pageNo"));
    }



    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Book book = WebUtils.copyParamToBean(req.getParameterMap(),new Book());
        bookService.updateBook(book);

        resp.sendRedirect(req.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + req.getParameter("pageNo"));
    }



    protected void getBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        Book book = bookService.queryBookById(id);
        req.setAttribute("book", book) ;
        req.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(req,resp);
    }



    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> books = bookService.queryBooks();
        req.setAttribute("books", books);
        req.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(req,resp);
    }

}

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

public class ClientBookServlet extends BaseServlet {

    private BookService bookService = new BookServiceImpl();

    /**
     * Paging
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

        Page<Book> page = bookService.page(pageNo,pageSize);
        page.setUrl("client/bookServlet?action=page");

        req.setAttribute("page",page);

        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }



    protected void pageByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        int min = WebUtils.parseInt(req.getParameter("min"), 0);
        int max = WebUtils.parseInt(req.getParameter("max"), Integer.MAX_VALUE);

        Page<Book> page = bookService.pageByPrice(pageNo,pageSize,min,max);

        StringBuilder sb = new StringBuilder("client/bookServlet?action=pageByPrice");
        // if exists min price, add to url parameter
        if (req.getParameter("min") != null) {
            sb.append("&min=").append(req.getParameter("min"));
        }

        if (req.getParameter("max") != null) {
            sb.append("&max=").append(req.getParameter("max"));
        }
        page.setUrl(sb.toString());

        req.setAttribute("page",page);

        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

}

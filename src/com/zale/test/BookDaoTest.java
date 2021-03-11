package com.zale.test;

import com.zale.dao.BookDao;
import com.zale.dao.impl.BookDaoImpl;
import com.zale.pojo.Book;
import com.zale.pojo.Page;
import org.junit.Test;

import java.math.BigDecimal;

public class BookDaoTest {

    private BookDao bookDao = new BookDaoImpl();

    @Test
    public void addBook() {
        bookDao.addBook(new Book(null,"qwe！", "zxc", new BigDecimal(985),1546,0,null
                ));
    }

    @Test
    public void deleteBookById() {
        bookDao.deleteBookById(21);
    }

    @Test
    public void updateBook() {
        bookDao.updateBook(new Book(21,"asd！", "rty", new BigDecimal(211),2598,0,null
        ));
    }

    @Test
    public void queryBookById() {
        System.out.println( bookDao.queryBookById(21) );
    }

    @Test
    public void queryBooks() {
        for (Book queryBook : bookDao.queryBooks()) {
            System.out.println(queryBook);
        }
    }

    @Test
    public void queryForPageTotalCount() {
        System.out.println( bookDao.queryForPageTotalCount() );
    }

    @Test
    public void queryForPageTotalCountByPrice() {
        System.out.println( bookDao.queryForPageTotalCountByPrice(10, 50) );
    }

    @Test
    public void queryForPageItems() {
        for (Book book : bookDao.queryForPageItems(8, Page.PAGE_SIZE)) {
            System.out.println(book);
        }
    }
    @Test
    public void queryForPageItemsByPrice() {
        for (Book book : bookDao.queryForPageItemsByPrice(0, Page.PAGE_SIZE,10,50)) {
            System.out.println(book);
        }
    }

}
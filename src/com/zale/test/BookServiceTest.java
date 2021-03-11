package com.zale.test;

import com.zale.pojo.Book;
import com.zale.pojo.Page;
import com.zale.service.BookService;
import com.zale.service.impl.BookServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

public class BookServiceTest {

    private BookService bookService = new BookServiceImpl();

    @Test
    public void addBook() {
        bookService.addBook(new Book(null,"qwer1", "1125", new BigDecimal(1356), 2578, 0, null));
    }

    @Test
    public void deleteBookById() {
        bookService.deleteBookById(22);
    }

    @Test
    public void updateBook() {
        bookService.updateBook(new Book(22,"qwe12", "1125", new BigDecimal(124), 10, 111110, null));
    }

    @Test
    public void queryBookById() {
        System.out.println(bookService.queryBookById(22));
    }

    @Test
    public void queryBooks() {
        for (Book queryBook : bookService.queryBooks()) {
            System.out.println(queryBook);
        }
    }

    @Test
    public void page(){
        System.out.println(bookService.page(1, Page.PAGE_SIZE ));
    }
    @Test
    public void pageByPrice(){
        System.out.println(bookService.pageByPrice(1, Page.PAGE_SIZE,10,50 ));
    }
}
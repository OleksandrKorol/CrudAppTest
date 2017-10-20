package ru.oleksandrkorol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.oleksandrkorol.model.Book;
import ru.oleksandrkorol.service.BookService;

import java.util.ArrayList;
import java.util.List;


@Controller
public class BookController {
    private BookService bookService;
    private static final int MAX_ROWS_PER_PAGE = 10;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String listBooks(Model model, Integer page) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks());

        List<Book> books = bookService.listBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<>(books);
        pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }
        model.addAttribute("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);

            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }
        return "books";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            this.bookService.addBook(book);
        } else {
            this.bookService.updateBook(book);
        }

        return "redirect:/";

    }

    @RequestMapping("addbook")
    public String addbook( Model model) {
        model.addAttribute("book", new Book());
        return "/addbook";
    }

    @RequestMapping("remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/";
    }

    @RequestMapping("addbook/edit/{id}")
    public String editBookPage(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "/addbook";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookById(id);
        if (book.isReadAlready()) {
            book.setReadAlready(false);
        }
        bookService.updateBook(book);
        model.addAttribute("book", book);
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "redirect:/";
    }

    @RequestMapping("/bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        Book book = this.bookService.getBookById(id);
        if (!book.isReadAlready()) {
            book.setReadAlready(true);
        }
        bookService.updateBook(book);
        model.addAttribute("book", book);

        return "/bookdata";
    }

    @RequestMapping("searchtitle")
    public String searchUser(@RequestParam("searchTitle") String searchTitle, Model model){
        List<Book> bookList = bookService.listBooks();
        List<Book> findBooks = new ArrayList<>();

        for (Book book: bookList) {
            if (book.getTitle().trim().equals(searchTitle.trim())) {
                findBooks.add(book);
            }
        }

        for (Book b : findBooks) {
            System.out.println(b.getTitle());
        }
        model.addAttribute("listBooks", findBooks);

        return "books";
    }
}

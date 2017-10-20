package ru.oleksandrkorol.service;

import org.springframework.stereotype.Service;
import ru.oleksandrkorol.dao.BookDao;
import ru.oleksandrkorol.model.Book;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Transactional
    @Override
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Transactional
    @Override
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Transactional
    @Override
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Transactional
    @Override
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Transactional
    @Override
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }
}

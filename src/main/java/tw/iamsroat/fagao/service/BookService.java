package tw.iamsroat.fagao.service;

import java.util.Collection;

import tw.iamsroat.fagao.dao.BookDao;
import tw.iamsroat.fagao.entity.Book;

public class BookService {
	
	private BookDao bookDao;
	
	public BookDao getFagaobookDao() { //get可不寫 因為用service getBean方法取代
		return bookDao;
	}

	public void setFagaobookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	public Collection<Book> getAll() {
		//Spring IOC
		//BookDao bookDao = new BookDao();
		return bookDao.findAll();

	}

	public Book getByID(Long id) {
		//BookDao bookDao = new BookDao();
		return bookDao.findByID(id);
	}
	
	public int insertBook(Book book) { 
		//BookDao bookDao = new BookDao();
		return bookDao.insertBook(book);
	}

	public int updateBook(Book book){
		//BookDao bookDao = new BookDao();
		return bookDao.updateBook(book);
	}
	
	public boolean deleteBookById(Long id){
		//BookDao bookDao = new BookDao();
		return bookDao.deleteBookById(id);
	}
}

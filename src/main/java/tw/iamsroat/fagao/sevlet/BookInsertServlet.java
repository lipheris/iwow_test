package tw.iamsroat.fagao.sevlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.iamsroat.fagao.entity.Book;
import tw.iamsroat.fagao.service.BookService;


@WebServlet("/fagao/BookInsertServlet")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Spring
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml");
		BookService bookService = (BookService)ctx.getBean("fagaoBookService");
		
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String strPrice=request.getParameter("price");
		Integer price = Integer.valueOf(strPrice);
		Book book = new Book(name,author,price);
		//BookService bookService = new BookService();
		bookService.insertBook(book);
		RequestDispatcher rd = request.getRequestDispatcher("/fagao/BookListServlet");
		rd.forward(request, response);
		return;
	}

}

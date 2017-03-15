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

@WebServlet("/fagao/BookUpdateServlet")
public class BookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Spring
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml");
		BookService bookService = (BookService)ctx.getBean("fagaoBookService");
		
		String Strid = request.getParameter("id");
		Long id = Long.valueOf(Strid);
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String strPrice = request.getParameter("price");
		Integer price = Integer.valueOf(strPrice);
		//BookService bookService = new BookService();
		Book book = new Book(name,author,price);
		bookService.updateBook(book);
		RequestDispatcher rd = request.getRequestDispatcher("/fagao/BookListServlet");		
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

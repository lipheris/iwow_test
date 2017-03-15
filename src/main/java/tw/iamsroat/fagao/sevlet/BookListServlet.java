package tw.iamsroat.fagao.sevlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.iamsroat.fagao.dao.BookDao;
import tw.iamsroat.fagao.entity.Book;
import tw.iamsroat.fagao.service.BookService;

@WebServlet("/fagao/BookListServlet")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Spring
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml");
		BookService bookService = (BookService)ctx.getBean("fagaoBookService");
		
//		BookService bookService = new BookService();
				
		Collection<Book> bookList =  bookService.getAll();
		request.setAttribute("bookList", bookList);
		RequestDispatcher rd = request.getRequestDispatcher("/fagao/list.jsp");
		rd.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

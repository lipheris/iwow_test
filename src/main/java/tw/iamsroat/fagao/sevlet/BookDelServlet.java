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

import tw.iamsroat.fagao.service.BookService;


@WebServlet("/fagao/BookDelServlet")
public class BookDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Spring
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml");
		BookService bookService = (BookService)ctx.getBean("fagaoBookService");
		
		String Strid = request.getParameter("id");
		Long id = Long.valueOf(Strid);
//		BookService bookService = new BookService();
		bookService.deleteBookById(id);
		RequestDispatcher rd = request.getRequestDispatcher("/fagao/BookListServlet");		
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

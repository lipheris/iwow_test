package tw.iamsroat.fagao.web;

import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.iamsroat.fagao.entity.Book;
import tw.iamsroat.fagao.service.BookService;

@Controller
@RequestMapping(value="/fagao/iwowwow")
public class FagaoBookController {
 	
 @Autowired
 private BookService bookService;
 	//iwowwow
	@RequestMapping(value="/index")
	public String indexPage(){
		return "fagao/iwowwow/index";
	}
	
	@RequestMapping(value="/photo")
	public String photoPage(){
		return "fagao/iwowwow/photo";
	}
 
	//book
 	@RequestMapping(value="/list")
 	public String listPage(Model model){
		Collection<Book> bookList =  bookService.getAll();
		model.addAttribute("bookList", bookList);
		return "fagao/book/list";
 	}
 	
// 	public String listPage(HttpServletRequest request){
//		Collection<Book> bookList =  bookService.getAll();
//		request.setAttribute("bookList", bookList);
//		return "fagao/book/list";
// 	}
 	
 	@RequestMapping(value="/add")
	public String addPage(Model model){
 		return "fagao/book/add";
 	}
 	
 	@RequestMapping(value="/edit")
 	public String editPage(Model model, Book form){
 		Long id = form.getId();  //自動轉型
// 		String Strid = request.getParameter("id");
//  	Long id = Long.valueOf(Strid);
  	    Book book = bookService.getByID(id);
 		model.addAttribute("editBook", book);
//  	request.setAttribute("editBook", book);
 		return "fagao/book/edit";
 	}
 	
 	@RequestMapping(value="/insert")
	public String insertPage(Model model, Book form){
 		System.out.println(form);
// 		String name = request.getParameter("name");
//		String author = request.getParameter("author");
//		String strPrice=request.getParameter("price");
//		Integer price = Integer.valueOf(strPrice);
//		Book book = new Book(name,author,price);
		bookService.insertBook(form);
		return "redirect:/fagao/book/list"; 
	}
 	
	@RequestMapping(value="/delete")
	public String deletePage(Model model, Book form){
		Long id = form.getId();
//		String Strid = request.getParameter("id");
//		Integer id = Integer.valueOf(Strid);
		bookService.deleteBookById(id);
		return "redirect:/fagao/book/list";
	}
	
	@RequestMapping(value="/update")
	public String updatePage(Model model, Book form){
//		String Strid = request.getParameter("id");
//		Long id = Long.valueOf(Strid);
//		String name = request.getParameter("name");
//		String author = request.getParameter("author");
//		String strPrice = request.getParameter("price");
//		Integer price = Integer.valueOf(strPrice);
//		Book book = new Book(name,author,price);
		//BookService bookService = new BookService();
		bookService.updateBook(form);
		return "redirect:/fagao/book/list";
	}
 }

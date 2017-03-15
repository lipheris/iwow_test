package tw.iamsroat.fagao.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import tw.iamsroat.fagao.entity.Book;

public class BookDao {
	String URL = "jdbc:sqlserver://softleader.com.tw:1433;databaseName=EEIT92DB";
	String USERNAME = "EEIT92";
	String PASSWORD = "EEIT92";

	public Collection<Book> findAll() {
		//Collection實作方法為ArrayList
		Collection<Book> books = new ArrayList<Book>(); 
		String select = "select * from book_fagao";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(select);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				book.setId(rs.getLong("id"));
				book.setName(rs.getString("name"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getInt("price"));
				books.add(book);

				System.out.print(rs.getLong("id") + ",");
				System.out.print(rs.getString("name") + ",");
				System.out.print(rs.getString("author") + ",");
				System.out.println(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return books;
	}

	public Book findByID(Long id) {

		String SELECT_BY_ID = "select * from book_fagao where id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Book books = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(SELECT_BY_ID);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				books = new Book();
				books.setId(rs.getLong("id"));
				books.setName(rs.getString("name"));
				books.setAuthor(rs.getString("author"));
				books.setPrice(rs.getInt("price"));
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return books;
	}
	
	public int insertBook(Book bean) { 
		
		String INSERT =
				"insert into book_fagao (name, author, price) values (?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		int i= 0;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(INSERT);

			stmt.setString(1, bean.getName());
			stmt.setString(2, bean.getAuthor());
			stmt.setInt(3, bean.getPrice());
			i = stmt.executeUpdate();
			if (i == 1) {
				return i;
			}		
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally{
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		if (conn!=null) {
		    try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}		
		}
		return i;
	}
	
	public int updateBook(Book bean) {
	
	String UPDATE =
			"update book_fagao set name=?, author=?, price=? where id=?";
	
	int updateCount = 0;
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		stmt = conn.prepareStatement(UPDATE);
		
		stmt.setString(1, bean.getName());
		stmt.setString(2, bean.getAuthor());
		stmt.setInt(3, bean.getPrice());
		stmt.setLong(4, bean.getId());
		
		updateCount = stmt.executeUpdate(); //傳回成功更新資料筆數
		return updateCount;  
		
	} catch (SQLException | ClassNotFoundException e) {
		e.printStackTrace();
	} finally{
	
	if (stmt!=null) {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	if (conn!=null) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	}
	return 	0;	//失敗代表成功0筆資料
}
	

	public boolean deleteBookById(Long id) {
		
		String DELETE =
				"delete from book_fagao where id=?";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(DELETE);
			
			stmt.setLong(1, id);
			
			int i = stmt.executeUpdate(); //因為sql指令為update(insert、delete)所以用executeUpdate()
			
			if(i==1){ //如果i=1則成功更新(刪除)一筆資料
				return true;
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally{		
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		if (conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		}
		return false;
	}
}

package tw.iamsroat.fagao.entity;

public class Book {
    private Long id; //SQL bigint
    private String name; //SQL varchar
    private String author; //SQL varchar
    private Integer price; //SQL int
	
    public Book(){
    	
    }
    public Book(String name,String author,Integer price){
    	this.name=name;
    	this.author=author;
    	this.price=price;
    }
    //右鍵 => source => toString
	@Override
	public String toString() { //Object底下的toString
		return "Book [id=" + id + ", name=" + name + ", author=" + author + ", price=" + price + "]";
	}
	
	//右鍵 => source => getter/setter
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
		
}

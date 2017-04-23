package tw.com.iwow.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Order;

@Repository
public interface OrderDao extends JpaRepository<Order, Long> {

	public static final String find_less_id="select top 1 id from ORDERS order by id desc";
	public List<Order> findByMemId(Long id);
	@Query(value=find_less_id, nativeQuery = true )
	public Long findOrderById();
}

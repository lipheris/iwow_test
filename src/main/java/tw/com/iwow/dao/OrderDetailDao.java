package tw.com.iwow.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Order;
import tw.com.iwow.entity.OrderDetail;
@Repository
public interface OrderDetailDao extends JpaRepository<OrderDetail, Long> {
	public List<OrderDetail> findByOrderId(Long id);
	public OrderDetail findByPicName(String name);
}

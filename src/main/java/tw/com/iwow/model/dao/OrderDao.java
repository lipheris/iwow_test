package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Order;

public interface OrderDao extends JpaRepository<Order, Long> {

}

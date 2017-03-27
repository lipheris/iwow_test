package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Order;

public interface OrderDao extends JpaRepository<Order, Long> {

}

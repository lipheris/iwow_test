package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Order;
@Repository
public interface OrderDao extends JpaRepository<Order, Long> {

}

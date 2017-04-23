package tw.com.iwow.service;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.dao.OrderDao;
import tw.com.iwow.dao.OrderDetailDao;
import tw.com.iwow.entity.Order;
import tw.com.iwow.entity.OrderDetail;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderdao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;

	@Autowired
	private MemberDao memberdao;

	// 新增訂單
	public void insertOrder(Order order) {
		orderdao.save(order);
	}

	// 某筆訂單
	public Order getOrder(Long id) {
		return orderdao.findOne(id);
	}

	// 某MEMBER訂單
	// public Collection<Order> getOrderByMemberId(Long id) {
	// return orderdao.findByMemberId(id.toString());
	// }

	// 所有訂單
	public Collection<Order> getAllOrder() {
		return orderdao.findAll();
	}

	public Set<OrderDetail> getOrderDetail(Long id) {
		Order order = orderdao.findOne(id);
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.size();
		Collection<OrderDetail> temp = (Collection<OrderDetail>) orderDetails.iterator();
		Double tempPrice = 0.0;
		for (OrderDetail orderDetail : temp) {
			tempPrice = tempPrice + orderDetail.getPrice().doubleValue();
		}
		return null;
	}
	
	public List<OrderDetail>  getOrderDetailListByOrderId(Long orderId) {
		return orderDetailDao.findByOrderId(orderId);
	}
	
	public Collection<Order> getOrders(Long id){
		return orderdao.findByMemId(id);
	}
	//取得登入者的ID
	public Long getMemberById() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		Long uploaderId = memberdao.findByEmail(currentPrincipalName).getId();
		return uploaderId;
		
	}
	public Long getOrder(){
		return orderdao.findOrderById();
	}
}

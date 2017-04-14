package tw.com.iwow.service;


import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.OrderDetailDao;
import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.entity.OrderDetail;
import tw.com.iwow.entity.Picture;

@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailDao orderDetailDao;
	@Autowired
	private PictureDao pictureDao;

	public OrderDetailDao getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}
	
	public void insertDetail(OrderDetail orderDetail) {
		orderDetailDao.save(orderDetail);
	}

	public void deleteDetail(Long id) {
		orderDetailDao.delete(id);
	}
	
	public Collection<OrderDetail> getAllDetail() {
		return orderDetailDao.findAll();
	}
//	
//	public Picture getPicture(String name){
//		Long id = orderDetailDao.findByPicName(name).getPicId();
//		pictureDao.findOne(id);
//		return pictureDao.findOne(id);
//	}
	
	
	
}

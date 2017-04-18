package tw.com.iwow.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFileChooser;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlob;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.ListBlobItem;

import tw.com.iwow.entity.Order;
import tw.com.iwow.entity.OrderDetail;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.OrderService;
import tw.com.iwow.service.PictureService;

@Controller
@RequestMapping(value = "/iwow/picture")
public class ShoppingCartController {
	private static final String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=iwowblob;AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA=="
			+ "AccountName=iwowblob;"
			+ "AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==";

	@Autowired
	private OrderService orderService;
	@Autowired
	private PictureService pictureService;

	@RequestMapping(value = "/checkpic", method = RequestMethod.GET)
	public String checkPicCart(Model model, @RequestParam(name = "id") Long id, HttpServletRequest request) {

		Picture pic = pictureService.getById(id);
		model.addAttribute("picID", pic);

		return "/iwow/cart/showcartcontent";

	}

	// 刪除購物車的某張圖---------------------------------------------------------------
	@RequestMapping(value = "/delpic", method = RequestMethod.GET)
	public String delPicCart(@CookieValue(value = "buyCar", required = false) String buyCarCookie,
			HttpServletResponse response, @RequestParam(value = "picId", required = false) String picId, Model model)
			throws Exception {

		if (StringUtils.isNotEmpty(picId)) {
			buyCarCookie = buyCarCookie.replaceAll("," + picId, "");
			response.addCookie(new Cookie("buyCar", buyCarCookie));
		}

		return "redirect:/iwow/picture/showcartcontent";
	}

	// 訂單明細-------------------------------------------------------------------------
	@RequestMapping(value = "orderdetail", method = RequestMethod.POST)
	public String orderDetail(Model model, OrderDetail od, Order ob, OrderService orderService) {
		ob = orderService.getOrder(od.getId());

		return "redirect:/iwow/picture/testpic";

	}

	// 封裝一筆訂單資料-----------------------------------------------------------------------------
	/**
	 * @param buyCarCookie
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/process", method = RequestMethod.GET)
	public String processOrder(@RequestParam("DSC") String dsc, HttpServletResponse response, Model model,
			HttpServletRequest request) throws UnsupportedEncodingException {
		String cookie = "";
		for (Cookie c : request.getCookies()) {
			if (c.getName().equals("buyCar") && StringUtils.isNotEmpty(c.getValue())) {
				cookie = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
			}
		}

		if (!"".equals(cookie.trim())) {
			Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
			List<String> buyCarList = Arrays.asList(cookie.split(","));
			Double price = 0.0;
			for (String picId : buyCarList) {
				if (StringUtils.isNotBlank(picId) && !StringUtils.equals("\"\"", picId)) {
					OrderDetail data = new OrderDetail();
					data.setPicId(Long.parseLong(picId));
					Picture picture = pictureService.getById(Long.parseLong(picId));
					data.setPicName(picture.getName());
					data.setPicSpec(picture.getPictureAddress());
					data.setPrice(new BigDecimal(100));
					orderDetails.add(data);
					price = price + data.getPrice().doubleValue();
				}
			}

			Order order = new Order();
			order.setUpdate(LocalDateTime.now());
			order.setDsc(dsc);
			order.setMemId(orderService.getMemberById());
			order.setOrderDetails(orderDetails);
			orderService.insertOrder(order);
			response.addCookie(new Cookie("buyCar", null));
			model.addAttribute("OrderBean", order);
			model.addAttribute("price", price);
			return "/iwow/cart/showorderdetail";

		} else {

			return "redirect:/iwow/index";
		}

	}

	// 顯示圖片-------------------------------------------------------------------------
//	@RequestMapping(value = "/listpic", method = RequestMethod.GET)
//	public String methodPost(@CookieValue(value = "buyCar", required = false) String buyCarCookie,
//			HttpServletResponse response, Model model) throws Exception {
//
//		Collection<Picture> picsT = pictureService.findAll();
//		model.addAttribute("picMsg", picsT);
//
//		if (StringUtils.isEmpty(buyCarCookie)) {
//			response.addCookie(new Cookie("buyCar", null));
//		}
//
//		return "/iwow/cart/testpic";
//	}

	// 放棄購物車----------------------------------------------------------------------
	@RequestMapping(value = "/giveup", method = RequestMethod.GET)
	public String giveup(@CookieValue(value = "buyCar", required = false) String buyCarCookie,
			HttpServletResponse response, Model model) throws Exception {

		response.addCookie(new Cookie("buyCar", null));

		return "redirect:/iwow/index";
	}

	// 加入購物車暫存頁面---------------------------------------------------------------
	@RequestMapping(value = "/showcartcontent", method = RequestMethod.GET)
	public String methodShowcartcontent(@CookieValue(value = "buyCar", required = false) String buyCarCookie,
			Model model) throws Exception {

		Collection<Picture> picsT = pictureService.findAll();
		List<Picture> buyList = new ArrayList<Picture>();
		List<String> buyCarList = Arrays.asList(buyCarCookie.split(","));
		for (Picture pic : picsT) {
			if (buyCarList.indexOf(pic.getId().toString()) != -1) {
				buyList.add(pic);
			}
		}
		model.addAttribute("picMsg", buyList);
		return "/iwow/cart/showcartcontent";
	}

	// 取得所有訂單-------------------------------------------------------------------------------
	@RequestMapping("/orderlistdetail")
	public String getAllOrder(Model model) {
		Long id = orderService.getMemberById();
		List<Order> orders = (List<Order>) orderService.getOrders(id);

		Collections.sort(orders, new Comparator<Order>() {
			public int compare(Order o1, Order o2) {
				return o2.getUpdate().compareTo(o1.getUpdate());
			}
		});

		System.out.println(orders);
		model.addAttribute("orders", orders);

		return "/iwow/cart/orderlist";
	}

	// 取得所有訂單-------------------------------------------------------------------------------
	@RequestMapping("/getalldetail")
	public String getAllDetail(@RequestParam(value = "id", required = false) Long id, Model model) {
		if (id != null) {
			model.addAttribute("OrderBean", orderService.getOrder(id));
			return "/iwow/cart/showorderdetail";
		} else {

			return "redirect:/iwow/picture/index";
		}

	}

//	 下載圖庫-----------------------------------------------------------------------------------
	@RequestMapping("/download")
	public String downloadPic(Long id, Model model) throws IOException {
		try {
			JFileChooser chooser = new JFileChooser();
		    chooser.setCurrentDirectory(new java.io.File("."));
		    chooser.setDialogTitle("choosertitle");
		    chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		    chooser.setAcceptAllFileFilterUsed(false);

		    if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
		      System.out.println("getCurrentDirectory(): " + chooser.getCurrentDirectory());
		      System.out.println("getSelectedFile() : " + chooser.getSelectedFile());
		    } else {
		      System.out.println("No Selection ");
		      return "redirect:/iwow/cart/orderlist";
		    }
		    String fileName=chooser.getSelectedFile().toString();
		    System.out.println(fileName);
			// Retrieve storage account from connection-string.
			CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
			// Create the blob client.
			CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
			// Retrieve reference to a previously created container.
			CloudBlobContainer container = blobClient.getContainerReference("mycontainer");
			// Loop through each blob item in the container.
			for (ListBlobItem blobItem : container.listBlobs()) {
				// If the item is a blob, not a virtual directory.
				// Download the item and save it to a file with the same
				// name.
				CloudBlob blob = (CloudBlob) blobItem;
				Set<OrderDetail> orderDetails = orderService.getOrder(id).getOrderDetails();
				for (OrderDetail orderDetail : orderDetails) {
					String address = pictureService.getById(orderDetail.getPicId()).getPictureAddress();
					if (address.equals(blob.getUri().toString())) {
						
						blob.download(new FileOutputStream(fileName +"\\"+ orderDetail.getPicName() + ".jpg"));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/iwow/picture/orderlistdetail";
	}

	@RequestMapping(value = "/orderconfirm")
	public String orderconfirm() {
		return "/iwow/picture/orderconfirm";
	}

	@RequestMapping(value = "/orderlist")
	public String orderlist( Model model) {
//		model.addAttribute("orderBeans", orderService.getOrderByMemberId(new Long(2)));
		return "/iwow/cart/orderlist";
	}

	@RequestMapping(value = "/showcartcontent")
	public String showcartcontent() {
		return "/iwow/cart/showcartcontent";
	}

	@RequestMapping(value = "/showorderdetail")
	public String showorderdetail() {
		return "/iwow/cart/showorderdetail";
	}
	
	@RequestMapping(value = "/testpic")
	public String testpic() {
		return "/iwow/picture/testpic";
	}
	
}

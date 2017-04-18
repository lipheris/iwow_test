package tw.com.iwow.web;

import java.time.LocalDateTime;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Donation;
import tw.com.iwow.entity.Member;
import tw.com.iwow.service.DonationService;
import tw.com.iwow.service.MemberService;
import tw.com.iwow.web.jsonview.Views;

@Controller
@RequestMapping(value="/iwow/donation")
public class DonationController {

	@Autowired
	private DonationService donationService;
	
	@Autowired
	private MemberService memberService;
	
	/* 給予donation */
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	@ResponseBody
	public Boolean insert (Donation donation, BindingResult bindingResult,Long receiver,Long amount){
		System.out.println(donation.getAmount());
		System.out.println(amount);
		Member receivertemp = memberService.findById(receiver);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); //取得現在登入者的資訊
		Member donortemp = memberService.getByEmail(authentication.getName()); //藉由authentication的name找出該donor的資料
		donation.setReceiver(receivertemp);
		Donation donationNew = donationService.creat(donation); //創建一個空的donationNew
//		Donation donationNew = new Donation();
		donationNew.setDonor(donortemp); //將該斗內者的斗內資訊塞入donationNew
		
		LocalDateTime nowLocalDateTime = LocalDateTime.now(); //創建一個現在的時間
		donationNew.setTime(nowLocalDateTime); //將現在時間塞入donationNew
		
		donationService.insert(donationNew);
		
		return true;
	}
	
	/* 登入者被誰抖內  by RESTful */
	@JsonView(Views.MemberDonor.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/donor/{id}")
	@ResponseBody
	public Set<Donation> findPersonDonor(@PathVariable(value = "id") Long memid){
		Set<Donation> result = donationService.donorAll(memid);
		if (result == null)
			return null;
		else
			return result;
	}
	
}

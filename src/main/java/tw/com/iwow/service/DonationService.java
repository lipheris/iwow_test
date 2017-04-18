package tw.com.iwow.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.DonationDao;
import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.entity.Donation;

@Service
public class DonationService {
	
	@Autowired
	private DonationDao donationDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public Donation creat(Donation donation){
		return donationDao.save(donation);
	}
	
	public Donation insert(Donation donation){
		return donationDao.save(donation);
	}
	
	//查詢個人被誰斗內
	public Set<Donation> donorAll(Long memberId){
		Set<Donation> Donations = memberDao.findOne(memberId).getDonations();
		return Donations;
	}
}

package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Donation;

public interface DonationDao extends JpaRepository<Donation, Long> {

}

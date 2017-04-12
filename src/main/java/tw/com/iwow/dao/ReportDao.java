package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Report;

public interface ReportDao extends JpaRepository<Report,Long> {

}

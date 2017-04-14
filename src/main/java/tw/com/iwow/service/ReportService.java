package tw.com.iwow.service;



import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.ReportDao;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Report;

@Service
public class ReportService {

	@Autowired
	private ReportDao reportDao;
	
	public Report insert(Report report) {
		return reportDao.save(report);
	}

	public Report updateReportHandle(Report report, Long picId) {
		return reportDao.save(report);

	}
}

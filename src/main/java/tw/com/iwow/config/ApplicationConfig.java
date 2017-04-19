package tw.com.iwow.config;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan("tw.com.iwow.service")
@EnableJpaRepositories("tw.com.iwow.dao")
@EnableTransactionManagement
public class ApplicationConfig {
	@Bean(destroyMethod="close")
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://softleader.com.tw:1433;databaseName=EEIT92DB");
		dataSource.setUsername("EEIT92");
		dataSource.setPassword("EEIT92");
		dataSource.setDefaultAutoCommit(false);
		return dataSource;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean entityManagerFactory = null;
		try {
			entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
			HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
			Properties hibernateSetting = new Properties();
			hibernateSetting.load(new FileInputStream(getClass().getClassLoader().getResource("hibernateSetting.properties").getFile()));
			entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
			entityManagerFactory.setPackagesToScan("tw.com.iwow.entity",
					"org.springframework.data.jpa.convert.threeten");
			entityManagerFactory.setDataSource(dataSource);
			entityManagerFactory.setJpaProperties(hibernateSetting);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entityManagerFactory;
	}

	@Bean
	public PlatformTransactionManager transactionManager(LocalContainerEntityManagerFactoryBean entityManagerFactory) {
		JpaTransactionManager txManager = new JpaTransactionManager();
		txManager.setEntityManagerFactory(entityManagerFactory.getObject());
		return txManager;
	}
	
}

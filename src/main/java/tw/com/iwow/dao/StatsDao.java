package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Stats;

public interface StatsDao extends JpaRepository<Stats, Long> {

}

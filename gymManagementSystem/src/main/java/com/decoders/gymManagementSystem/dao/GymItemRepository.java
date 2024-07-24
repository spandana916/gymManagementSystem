package com.decoders.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.decoders.gymManagementSystem.bean.GymItem;

public interface GymItemRepository extends JpaRepository<GymItem, Long>{
	
	@Query("select max(itemId) from GymItem")
	public Long findLastItemId();
	
	@Query("select totalSeat from GymItem where itemId=?1")
	public Integer findTotalSeatById(Long id);

	@Query("select itemName from GymItem where itemId=?1")
	public String findItemName(Long itemId); 

} 

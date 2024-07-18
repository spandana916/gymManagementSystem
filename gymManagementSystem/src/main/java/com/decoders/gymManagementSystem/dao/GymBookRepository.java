package com.decoders.gymManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.decoders.gymManagementSystem.bean.GymBook;

public interface GymBookRepository extends JpaRepository<GymBook, Long> {
	@Query("select max(bookingId) from GymBook")
	public Long findLastBookingId();
	
	@Query("select a from GymBook a where  username = ?1")
	public List<GymBook> getUserwiseBookList (String username);

	public GymBook findBookingBySlotIdAndItemIdAndUsername(Long slotId, Long itemId, String username);
	

}

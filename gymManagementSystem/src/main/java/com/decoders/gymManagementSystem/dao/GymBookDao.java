package com.decoders.gymManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import com.decoders.gymManagementSystem.bean.GymBook;

public interface GymBookDao {
	public void save(GymBook gymBook);
	public Long generateBookingId();
	public List<GymBook> getBookList();
	public GymBook findBookInfoById(Long id);	
	public void deleteById(Long id);
	public List<GymBook> getEntitiesByUsername(String username);
	public Optional<GymBook> hasBookedSlot(Long slotId);
	public GymBook findBookingBySlotItemIdUsername(Long slotId, Long itemId, String username); 
	


	
}

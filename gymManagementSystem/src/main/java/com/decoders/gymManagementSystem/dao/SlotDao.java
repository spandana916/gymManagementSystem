package com.decoders.gymManagementSystem.dao;

import java.util.List;

import com.decoders.gymManagementSystem.bean.Slot;

public interface SlotDao {
	
	public void saveNewSlot(Slot slot);
	public List<Slot> displayAllSlot();
	public Slot findSlotById(Long id);
	public Long generateSlotId();
	


}

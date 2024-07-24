package com.decoders.gymManagementSystem.dao;

import java.util.List;

import com.decoders.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
	public void saveNewItem(GymItem gymItem);
	public List<GymItem> displayAllItems();
	public GymItem findItemById(Long id);
	public Long generateItemId();
	public Integer findTotalSeatById(Long id);
	public String findItemName(Long itemId);
}

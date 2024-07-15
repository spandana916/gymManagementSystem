package com.decoders.gymManagementSystem.dao;

import java.util.List;
import java.util.Set;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemDao  {
	public void save(SlotItem slotItem);
	public List<SlotItem> displayAllItem();
	public Integer findSeatBookedById(SlotItemEmbed id);
	public Set<SlotItemEmbed> findAllEmbeds();
	public SlotItem findItemById(SlotItemEmbed id);
	
	}
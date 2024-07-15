package com.decoders.gymManagementSystem.dao;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

@Service
@Repository
public class SlotItemDaoImpl implements SlotItemDao {
	
	@Autowired
	private SlotItemRepository repository;

	@Override
	public void save(SlotItem slotItem) {
		repository.save(slotItem);
	}
	@Override
	public List<SlotItem> displayAllItem(){
		return repository.findAll();
	}
	@Override
	public Integer findSeatBookedById(SlotItemEmbed id) {
		return repository.findSeatBookedById(id);
	}
	@Override
	public Set<SlotItemEmbed> findAllEmbeds(){
		return repository.findAllEmbeds();
		
	}
	@Override
	public SlotItem findItemById(SlotItemEmbed id) {
		return repository.findById(id).get();
	} 
	
		
}
package com.decoders.gymManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.Slot;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;
import com.decoders.gymManagementSystem.dao.GymItemDao;
import com.decoders.gymManagementSystem.dao.SlotDao;
import com.decoders.gymManagementSystem.dao.SlotItemDao;

@RestController
public class GymController {
	@Autowired
	private GymItemDao gymItemDao;
	
	@Autowired
	private SlotDao slotDao;
	
	@Autowired
	private SlotItemDao slotItemDao;
	
	@GetMapping("/index")
	public ModelAndView showIndexPage() {
		return new ModelAndView("index");
	}

	@GetMapping("gymitem")
	public ModelAndView showItemEntryPage() {
		GymItem gymItem=new GymItem();
		Long newId=gymItemDao.generateItemId();
		gymItem.setItemId(newId);
		ModelAndView mv=new ModelAndView("gymItemEntryPage");
		mv.addObject("itemRecord",gymItem);
		return mv;		
	}
	@PostMapping("/gymitem")
	public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem) {
		gymItemDao.saveNewItem(gymItem);
		return new ModelAndView("index");
	}
	@GetMapping("/gymitems")
	public ModelAndView showItemReportPage() {
		List<GymItem> itemList=gymItemDao.displayAllItems();
		ModelAndView mv=new ModelAndView("gymItemReportPage");
		mv.addObject("itemList",itemList);
		return mv;
		}
	@GetMapping("slot")
	public ModelAndView showEntryPage() {
		Slot slot=new Slot();
		Long newId=slotDao.generateSlotId();
		slot.setSlotId(newId);
		ModelAndView mv=new ModelAndView("slotEntryPage");
		mv.addObject("slotRecord",slot);
		return mv;		
	}
	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slot) {
		slotDao.saveNewSlot(slot);
		List<GymItem> itemList=gymItemDao.displayAllItems();
		for(GymItem item:itemList) {
			SlotItemEmbed embed=new SlotItemEmbed(slot.getSlotId(), item.getItemId());
			SlotItem slotItem=new SlotItem(embed);
			slotItemDao.save(slotItem);
			}
		return new ModelAndView("index");
	}
	@GetMapping("/slots")
	public ModelAndView slotReportPage(){
		List<Slot> slotList=slotDao.displayAllSlot();
		ModelAndView mv=new ModelAndView("slotReportPage");
		mv.addObject("slotList",slotList);
		return mv;
	
}
	@GetMapping("/slot-show/{id}")
	public ModelAndView showSlotEnquirePage(@PathVariable Long id) {
		Slot slot= slotDao.findSlotById(id);
		List<GymItem> itemList=gymItemDao.displayAllItems();
		ModelAndView mv=new ModelAndView("slotBookpage");
		mv.addObject("slot",slot);
		mv.addObject("itemList",itemList);
		itemList.forEach(item->System.out.println(item));
		return mv;
		}
}


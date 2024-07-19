package com.decoders.gymManagementSystem.controller;

import java.util.List;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.GymBook;
import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.Item;
import com.decoders.gymManagementSystem.bean.Slot;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;
import com.decoders.gymManagementSystem.dao.GymBookDao;
import com.decoders.gymManagementSystem.dao.GymItemDao;
import com.decoders.gymManagementSystem.dao.SlotDao;
import com.decoders.gymManagementSystem.dao.SlotItemDao;
import com.decoders.gymManagementSystem.exception.DuplicateBookingException;
import com.decoders.gymManagementSystem.exception.SeatNotAvailableException;
import com.decoders.gymManagementSystem.service.GymItemService;
import com.decoders.gymManagementSystem.service.GymUserService;

@RestController
public class GymController {
	@Autowired
	private GymItemDao gymItemDao;

	@Autowired
	private SlotDao slotDao;

	@Autowired
	private SlotItemDao slotItemDao;

	@Autowired
	private GymItemService itemService;

	@Autowired
	private GymUserService userService;
	@Autowired
	private GymBookDao gymBookDao;

	@GetMapping("/index")
	public ModelAndView showIndexPage() {
		String indexPage = "";
		String userType = userService.getType();
		if (userType.equalsIgnoreCase("Admin"))
			indexPage = "index1";
		else if (userType.equalsIgnoreCase("Customer"))
			indexPage = "index2";
		return new ModelAndView(indexPage);
	}

	@GetMapping("gymitem")
	public ModelAndView showItemEntryPage() {
		GymItem gymItem = new GymItem();
		Long newId = gymItemDao.generateItemId();
		gymItem.setItemId(newId);
		ModelAndView mv = new ModelAndView("gymItemEntryPage");
		mv.addObject("itemRecord", gymItem);
		return mv;
	}

	@PostMapping("/gymitem")
	public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem) {
		gymItemDao.saveNewItem(gymItem);
		// return new ModelAndView("index");
		return new ModelAndView("redirect:/index");
	}

	@GetMapping("/gymitems")
	public ModelAndView showItemReportPage() {
		List<GymItem> itemList = gymItemDao.displayAllItems();
		ModelAndView mv = new ModelAndView("gymItemReportPage");
		mv.addObject("itemList", itemList);
		return mv;
	}

	@GetMapping("slot")
	public ModelAndView showEntryPage() {
		Slot slot = new Slot();
		Long newId = slotDao.generateSlotId();
		slot.setSlotId(newId);
		ModelAndView mv = new ModelAndView("slotEntryPage");
		mv.addObject("slotRecord", slot);
		return mv;
	}

	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slot) {
		slotDao.saveNewSlot(slot);
		List<GymItem> itemList = gymItemDao.displayAllItems();
		for (GymItem item : itemList) {
			SlotItemEmbed embed = new SlotItemEmbed(slot.getSlotId(), item.getItemId());
			SlotItem slotItem = new SlotItem(embed);
			slotItemDao.save(slotItem);
		}
		// return new ModelAndView("index");
		return new ModelAndView("redirect:/index");

	}

	@GetMapping("/slots")
	public ModelAndView slotReportPage() {
		List<Slot> slotList = slotDao.displayAllSlot();
		ModelAndView mv = new ModelAndView("slotReportPage");
		mv.addObject("slotList", slotList);
		return mv;

	}

	@GetMapping("/slot-show/{id}")
	public ModelAndView showSlotBookPage(@PathVariable Long id) {
		String fname = "";
		String userType = userService.getType();
		if (userType.equalsIgnoreCase("Admin"))
			fname = "slotBookPage1";
		else if (userType.equalsIgnoreCase("Customer"))
			fname = "slotBookPage2";
		GymBook book = new GymBook();
		Long newId = gymBookDao.generateBookingId();
		book.setBookingId(newId);
		Slot slot = slotDao.findSlotById(id);
		List<Item> itemList = itemService.getItemList(id);
		ModelAndView mv = new ModelAndView(fname);
		mv.addObject("slot", slot);
		mv.addObject("itemList", itemList);
		mv.addObject("gymBookRecord", book);
		if (userType.equalsIgnoreCase("Admin")) {
			List<String> userList = userService.getAllCustomers();
			mv.addObject("userList", userList);
		}
		return mv;
	}

	@PostMapping("/slot-book")
	public ModelAndView saveBookingReportPage(@RequestParam("slot_id") Long slotId,
			@RequestParam("selectItem") Long itemId, @RequestParam("userId") String userId,
			@ModelAttribute("gymBookRecord") GymBook gymBook) {

		String userType = userService.getType();
		String username = "";

		if (userId != null && !userId.isEmpty()) {
			if (userType.equalsIgnoreCase("Admin") || userType.equalsIgnoreCase("Customer")) {
				username = userId;
			}
		} else {
			org.springframework.security.core.Authentication authentication = SecurityContextHolder.getContext()
					.getAuthentication();
			username = authentication.getName();
		}
		GymBook existingBooking = gymBookDao.findBookingBySlotIdAndUsername(slotId, username);
		if (existingBooking != null) {
			throw new DuplicateBookingException();
		}
		GymItem gymItem = gymItemDao.findItemById(itemId);
		SlotItemEmbed embed = new SlotItemEmbed(slotId, itemId);
		SlotItem slotItem = slotItemDao.findItemById(embed);
		int totalSeats = gymItem.getTotalSeat();
		int seatBooked = slotItemDao.findSeatBookedById(embed);
		int available = totalSeats - seatBooked;

		if (available > 0) {
			Long newId = gymBookDao.generateBookingId();
			gymBook.setBookingId(newId);
			gymBook.setSlotId(slotId);
			gymBook.setItemId(itemId);
			gymBook.setUsername(username);

			gymBookDao.save(gymBook);

			seatBooked++;
			slotItem.setSeatBooked(seatBooked);
			slotItemDao.save(slotItem);

		} else {
			throw new SeatNotAvailableException();
		}
		GymBook bookedInfo = gymBookDao.findBookInfoById(gymBook.getBookingId());
		String viewName = userType.equalsIgnoreCase("Admin") ? "bookingReportPage1" : "bookingReportPage2";
		ModelAndView mv = new ModelAndView(viewName);
		mv.addObject("gymbook", bookedInfo);

		return mv;
	}

	@GetMapping("/slot-item-add/{id}")
	public ModelAndView saveItemSlots(@PathVariable Long id) {
		itemService.addNewItemToSlots(id);
		return new ModelAndView("redirect:/index");
	}

	@GetMapping("/bookings")
	public ModelAndView showSlotBookedPage(@ModelAttribute("gymBookRecord") GymBook gymBook) {
		String username = "";
		String userType = userService.getType();
		List<GymBook> bookList = gymBookDao.getBookList();
		if (userType.equalsIgnoreCase("Customer")) {

			username = userService.getUser().getUsername();
			bookList = gymBookDao.getEntitiesByUsername(username);

		}
		String fname = "";
		if (userType.equalsIgnoreCase("Admin"))
			fname = "slotBookedPage1";

		else if (userType.equalsIgnoreCase("Customer"))
			fname = "slotBookedPage2";

		ModelAndView mv = new ModelAndView(fname);
		mv.addObject("bookList", bookList);

		return mv;
	}

	@GetMapping("/delete-booking/{bookingId}")
	public ModelAndView deleteBooking(@PathVariable Long bookingId) {
		String userType = userService.getType();
		String username = userService.getUser().getUsername();
		GymBook gymBook = gymBookDao.findBookInfoById(bookingId);

		if (gymBook == null) {
			return new ModelAndView("redirect:/bookings");
		}
		boolean isAuthorized = false;
		if (userType.equalsIgnoreCase("Customer") && gymBook.getUsername().equalsIgnoreCase(username)) {
			isAuthorized = true;
		} else if (userType.equalsIgnoreCase("Admin")) {
			isAuthorized = true;
		}

		if (isAuthorized) {
			Long itemId = gymBook.getItemId();
			SlotItemEmbed embed = new SlotItemEmbed(gymBook.getSlotId(), itemId);
			SlotItem slotItem = slotItemDao.findItemById(embed);
			if (slotItem != null) {
				int seatBooked = slotItem.getSeatBooked();
				if (seatBooked > 0) {
					seatBooked--;
					slotItem.setSeatBooked(seatBooked);
					slotItemDao.save(slotItem);
				}
			}
			gymBookDao.deleteById(bookingId);

			return new ModelAndView("redirect:/bookings");
		} else {
			return new ModelAndView("redirect:/bookings");
		}
	}

	@ExceptionHandler(SeatNotAvailableException.class)
	public ModelAndView hanlderOperatorException(SeatNotAvailableException exception) {
		String message = "Seat not available for booking";
		ModelAndView mv = new ModelAndView("errorPage");
		mv.addObject("errorMessage", message);
		return mv;
	}

	@ExceptionHandler(DuplicateBookingException.class)
	public ModelAndView handlerOperatorException(DuplicateBookingException exception) {
		String message = "Already Seat has been Booked";
		ModelAndView mv = new ModelAndView("errorPage1");
		mv.addObject("errorMessage", message);
		return mv;
	}

}

package com.decoders.gymManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Slot {
	@Id
	private Long slotId;
	private String slotTime;
	private Double pricing;
	public Slot() {
		super();
	}
	public Slot(Long slotId, String slotTime, Double pricing) {
		super();
		this.slotId = slotId;
		this.slotTime = slotTime;
		this.pricing = pricing;
	}
	public Long getSlotId() {
		return slotId;
	}
	public void setSlotId(Long slotId) {
		this.slotId = slotId;
	}
	public String getSlotTime() {
		return slotTime;
	}
	public void setSlotTime(String slotTime) {
		this.slotTime = slotTime;
	}
	public Double getPricing() {
		return pricing;
	}
	public void setPricing(Double pricing) {
		this.pricing = pricing;
	}

	
}
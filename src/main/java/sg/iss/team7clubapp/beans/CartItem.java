package sg.iss.team7clubapp.beans;

import java.time.LocalDate;

import sg.iss.team7clubapp.model.Slot;

public class CartItem implements Comparable<CartItem> {
	private String facilityName;
	private LocalDate reservedDate;
	private Slot slot;
	private Boolean isDuplicate;

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public LocalDate getReservedDate() {
		return reservedDate;
	}

	public void setReservedDate(LocalDate reservedDate) {
		this.reservedDate = reservedDate;
	}

	public Slot getSlot() {
		return slot;
	}

	public void setSlot(Slot slot) {
		this.slot = slot;
	}
	
	
	
	public Boolean getIsDuplicate() {
		return isDuplicate;
	}

	public void setIsDuplicate(Boolean isDuplicate) {
		this.isDuplicate = isDuplicate;
	}


	@Override
	public String toString() {
		return "CartItem [facilityName=" + facilityName + ", reservedDate=" + reservedDate + ", slot=" + slot.getSlotNumber()
				+ ", isDuplicate=" + isDuplicate + "]";
	}

	public CartItem() {
		this("",LocalDate.now(),null,true);
	}
	

	public CartItem(String facilityName, LocalDate reservedDate, Slot slot, Boolean isDuplicate) {
		super();
		this.facilityName = facilityName;
		this.reservedDate = reservedDate;
		this.slot = slot;
		this.isDuplicate = isDuplicate;
	}

	@Override
	public boolean equals (Object object) {
	    boolean result = false;
	    if (object == null || object.getClass() != getClass()) {
	        result = false;
	    } else {
	        CartItem other = (CartItem) object;
	        if (this.facilityName.equals(other.getFacilityName()) && this.reservedDate.equals(other.getReservedDate())   && this.slot.getSlotNumber() == other.slot.getSlotNumber()) {
	            result = true;
	        }
	    }
	    return result;
	}
	
	public int compareTo(CartItem other) {
		
		int result = (this.getReservedDate().compareTo(other.getReservedDate()));
		if (result != 0) return result; 
		result = Integer.compare(this.slot.getSlotNumber(),other.slot.getSlotNumber()); 
		if (result != 0) return result; 
		return this.getFacilityName().compareTo(other.getFacilityName());

	}

}
package sg.iss.team7clubapp.model;

import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "slots")
public class Slot {

	@Id
	@Column(name = "slot_number")
	private int slotNumber;
	@Column(name = "slot_description")
	private String slotDescription;
	@Column(name = "time_start")
	private LocalTime timeStart;
	@Column(name = "time_end")
	private LocalTime timeEnd;

	@OneToMany (mappedBy="slot")
	private Set<BookingDetail> bookings = new HashSet<BookingDetail>();

	
	public int getSlotNumber() {
		return slotNumber;
	}

	public void setSlotNumber(int slotNumber) {
		this.slotNumber = slotNumber;
	}

	public String getSlotDescription() {
		return slotDescription;
	}

	public void setSlotDescription(String slotDescription) {
		this.slotDescription = slotDescription;
	}

	public LocalTime getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(LocalTime timeStart) {
		this.timeStart = timeStart;
	}

	public LocalTime getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(LocalTime timeEnd) {
		this.timeEnd = timeEnd;
	}

}
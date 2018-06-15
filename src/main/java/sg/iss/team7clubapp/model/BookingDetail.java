package sg.iss.team7clubapp.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.Facility;

@Entity
@Table(name = "booking_detail") 
public class BookingDetail {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="detail_id")
	private int detailId;
	
	@ManyToOne
	@JoinColumn(name = "booking_id")
	private Booking booking;

	@ManyToOne
	@JoinColumn(name = "facility_id")
	private Facility facility;

	@Column(name = "reserved_date")
	private LocalDate reservedDate;

	@ManyToOne
	@JoinColumn(name = "slot_number")
	private Slot slot;
	
	private String status;

	public int getDetailId() {
		return detailId;
	}

	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public Facility getFacility() {
		return facility;
	}

	public void setFacility(Facility facility) {
		this.facility = facility;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BookingDetail [detailId=" + detailId + ", booking=" + booking + ", facility=" + facility
				+ ", reservedDate=" + reservedDate + ", slot=" + slot + ", status=" + status + "]";
	}

	public BookingDetail(Booking booking, Facility facility, LocalDate reservedDate, Slot slot,
			String status) {
		this.detailId = 0;
		this.booking = booking;
		this.facility = facility;
		this.reservedDate = reservedDate;
		this.slot = slot;
		this.status = status;
	}

	public BookingDetail() {
		
	}
}

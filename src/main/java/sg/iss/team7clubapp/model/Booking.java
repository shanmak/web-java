package sg.iss.team7clubapp.model;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.User;

@Entity
@Table(name = "booking")
public class Booking {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="booking_id")
	private int bookingId;
	
	@ManyToOne
	@JoinColumn(name="userid")
	private User user; 
	
	@Column(name="booking_date")
	private LocalDate bookingDate;
	
	@OneToMany (mappedBy="booking", cascade = CascadeType.ALL)
	private List<BookingDetail> bookingitems = new ArrayList<BookingDetail>();
	
	public int getBookingId() {
		return bookingId;
	}



	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}




	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public LocalDate getBookingDate() {
		return bookingDate;
	}



	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}



	public List<BookingDetail> getBookingitems() {
		return bookingitems;
	}



	public void setBookingitems(List<BookingDetail> bookingitems) {
		this.bookingitems = bookingitems;
	}



	public Booking(int bookingId, User user, LocalDate bookingDate) {
		super();
		this.bookingId = bookingId;
		this.user = user;
		this.bookingDate = bookingDate;
	}

	

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", user=" + user + ", bookingDate=" + bookingDate + ", bookingitems="
				+ bookingitems + "]";
	}



	public Booking() {
		
	}
	
}

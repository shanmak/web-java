package sg.iss.team7clubapp.services;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import sg.iss.team7clubapp.beans.CartItem;
import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.Facility;

public interface BookingService {
	public List<Booking> findAll();

	public List<Booking> findByBookingId(int bookingid);

	public List<Booking> findByUserUserId(int userid);

	public List<Integer> showBookedSlots(String facid, LocalDate date);

	public LinkedHashMap<String, Boolean[]> showBookedSlotsByFacilityId(String factype, LocalDate date);

	public ArrayList<CartItem> addToCart(String bookdate, String count, String bookfacnames, String bookslots,
			ArrayList<CartItem> mycart);

	public ArrayList<CartItem> cleanCart(ArrayList<CartItem> mycart);

	public ArrayList<Boolean> createBookingFromCart(ArrayList<CartItem> mycart, int memberid);

	public LinkedHashMap<String, Boolean[]> showBookedSlotsForSingleFacility(String facid, LocalDate date);

	public ArrayList<Boolean> createMaintenanceBooking(ArrayList<CartItem> mycart, int memberid, String issueid);

	ArrayList<BookingDetail> allBookingDetails();

	public ArrayList<Booking> getAllBookings();

	public Page<BookingDetail> getAllBookingsPaged(Pageable pageable);

	public int cancelBookingById(int id);
}

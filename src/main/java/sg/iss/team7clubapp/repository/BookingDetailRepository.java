package sg.iss.team7clubapp.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.model.BookingDetail;

@Repository
@Transactional
public interface BookingDetailRepository extends JpaRepository<BookingDetail, Integer> {
	
	@Query(value = "SELECT b.slot.slotNumber FROM BookingDetail b WHERE status IN('booked','maintenance') AND facility.facilityId = :facid AND b.reservedDate = :date")
	List<Integer> showBookedSlots(@Param("facid") String facid, @Param("date")LocalDate date);
	 
	 @Query(value= "SELECT b.userid,b.booking_id,bd.facility_id,bd.reserved_date,bd.slot_number,bd.status,bd.detail_id FROM booking b, booking_detail bd where b.booking_id=bd.booking_id ",nativeQuery = true)
		ArrayList<BookingDetail> allBookingDetails();
	 
	 @Query(value= "SELECT bd FROM BookingDetail bd WHERE bd.booking.bookingId=:bookid")
		ArrayList<BookingDetail> findByBookingId(@Param("bookid") int bookid);
	 
		@Modifying(clearAutomatically = true)
		@Transactional
	 @Query(value = "UPDATE BookingDetail bd SET bd.status = 'cancelled' WHERE bd.detailId = :id ")
	 	int cancelBookingById(@Param("id") int detailid);
	 
		@Query(value="SELECT b.userid,b.booking_id,bd.facility_id,bd.reserved_date,bd.slot_number,bd.status,bd.detail_id FROM booking b, booking_detail bd where b.booking_id=bd.booking_id and b.userid=?1",nativeQuery = true)
		ArrayList<BookingDetail> bookingDetails(int i);
}
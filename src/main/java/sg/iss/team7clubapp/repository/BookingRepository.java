package sg.iss.team7clubapp.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import sg.iss.team7clubapp.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {

    List<Booking> findByBookingId(int bookingid);
    List<Booking> findByUserUserId(int userid);
    

}
package sg.iss.team7clubapp.services;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.beans.CartItem;
import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.model.Slot;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.repository.BookingDetailRepository;
import sg.iss.team7clubapp.repository.BookingRepository;

@Service
public class BookingServiceImpl implements BookingService{
	@Autowired
	private BookingRepository repository;

	@Autowired
	private BookingDetailRepository bdrepo;
	
    @Autowired
    private FacilityService fService;
    
    @Autowired
    private UserService uService;
    
    @Autowired
    private SlotService sService;
    
    @Autowired
    private DamageService dService;
	
	@Override
	public List<Booking> findAll() {
		List<Booking> bookings = (List<Booking>) repository.findAll();
		return bookings;
	}
	
	@Override
	public List<Booking> findByBookingId(int bookingid) {
		List<Booking> bookings = (List<Booking>) repository.findByBookingId(bookingid);
		return bookings;
	}

	@Override
	public List<Booking> findByUserUserId(int userid) {
		List<Booking> bookings = (List<Booking>) repository.findByUserUserId(userid);
		return bookings;
	}
	
	@Override
	public List<Integer> showBookedSlots(String facid, LocalDate date){
		List<Integer> bookedslots = (List<Integer>)bdrepo.showBookedSlots(facid, date);
		return bookedslots;
	}
	
	@Override
	public LinkedHashMap<String,Boolean[]> showBookedSlotsByFacilityId(String factype, LocalDate date) {
		ArrayList<Facility> flist = fService.findByFacilityType(factype);
		LinkedHashMap<String,Boolean[]> facslots = new LinkedHashMap<String,Boolean[]>();
		for (Facility f : flist) {
			List<Integer> bookedslots = showBookedSlots(f.getFacilityId(), date);
			Boolean[] boolslots = new Boolean[13];
			for(int i=0;i<=12;i++) {
				if(bookedslots.contains(i)) {
					boolslots[i] = true;
				} else {
					boolslots[i] = false;
				}
			}
			facslots.put(f.getFacilityName(), boolslots);
		}
		return facslots;
	}

	
	@Override
	public ArrayList<CartItem> addToCart(String bookdate, String count, String bookfacnames,String bookslots,
			ArrayList<CartItem> mycart) {
		
		ArrayList<CartItem> newcart = cleanCart(mycart);
		
		String booknamestring = bookfacnames.replaceAll("[^a-zA-Z0-9,\\s]", "");
		String[] bookname = booknamestring.split(",");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localbookdate = LocalDate.parse(bookdate, formatter);
		String bookslotstring = bookslots.replaceAll("[^0-9,#]", "");
		String[] bookslotarray =  bookslotstring.split(",");
		int num = 0;
		int n = Integer.parseInt(count);
		
		for(int i=0; i < n ;i++) { 
			String[] temp = new String[bookslotarray.length];
			temp = bookslotarray[i].trim().substring(1).split("#"); 
			for (String s : temp){
				s.trim();
				if (s != "0" && s!=""){
					num = Integer.parseInt(s);
					Slot slot = sService.findSlotById(num);
					if(num!=0) {
						CartItem c = new CartItem(bookname[i],localbookdate,slot,false);
						if(newcart.contains(c)) {
							c.setIsDuplicate(true);
						} 
						newcart.add(c);
					}
				}
			}
		}
		Collections.sort(newcart);
		return newcart;		
	}
	
	@Override
	public ArrayList<CartItem> cleanCart(ArrayList<CartItem> mycart) {
		ArrayList<CartItem> cleancart = new ArrayList<CartItem>();
		for(CartItem c : mycart){
	         if(!c.getIsDuplicate()) { cleancart.add(c); }	
	    }
		
		return cleancart;
	}
	
	@Override
	public ArrayList<Boolean> createBookingFromCart(ArrayList<CartItem> mycart, int memberid){
		
		User user = uService.findByUserId(memberid);
		Booking b = new Booking(0, user, LocalDate.now());
		b = repository.saveAndFlush(b);
		
	    ArrayList<Boolean> isSuccessful = new ArrayList<Boolean>();
		mycart = cleanCart(mycart);
	    for(CartItem c :mycart) {	
			Facility f = fService.findByFacilityName(c.getFacilityName());
			Boolean isConflict = isConflict(f.getFacilityId(), c.getReservedDate(), c.getSlot().getSlotNumber());
			Boolean success = false;
			if(!isConflict) {
					BookingDetail bd = new BookingDetail(b, f, c.getReservedDate(), c.getSlot(), "booked");
					bdrepo.save(bd);
					success=true;				
			}
			isSuccessful.add(success);
	    }
		return isSuccessful;
	}
	
	public Boolean isConflict(String facid, LocalDate resdate, int slotNumber) {
		Boolean isConflict = false;

		List<Integer> bookedslots = showBookedSlots (facid, resdate);
		for (Integer slot : bookedslots) {
			if(slotNumber == slot) {
				isConflict = true;
			}
		}
		return isConflict;
	}
	
	
	@Override
	public LinkedHashMap<String,Boolean[]> showBookedSlotsForSingleFacility(String facid, LocalDate date) {
		Facility f = fService.findByFacilityId(facid);
		LinkedHashMap<String,Boolean[]> facslots = new LinkedHashMap<String,Boolean[]>();
			List<Integer> bookedslots = showBookedSlots(f.getFacilityId(), date);
			Boolean[] boolslots = new Boolean[13];
			for(int i=0;i<=12;i++) {
				if(bookedslots.contains(i)) {
					boolslots[i] = true;
				} else {
					boolslots[i] = false;
				}
			}
		facslots.put(f.getFacilityName(), boolslots);
		return facslots;
	}
	

	@Override
	public ArrayList<Boolean> createMaintenanceBooking(ArrayList<CartItem> mycart, int memberid, String issueid){
		
		User user = uService.findByUserId(memberid);
		Booking b = new Booking(0, user, LocalDate.now());
		b = repository.saveAndFlush(b);
		
	    ArrayList<Boolean> isSuccessful = new ArrayList<Boolean>();
		mycart = cleanCart(mycart);
	    for(CartItem c :mycart) {	
			Facility f = fService.findByFacilityName(c.getFacilityName());
			Boolean isConflict = isConflict(f.getFacilityId(), c.getReservedDate(), c.getSlot().getSlotNumber());
			Boolean success = false;
			if(!isConflict) {
					BookingDetail bd = new BookingDetail(b, f, c.getReservedDate(), c.getSlot(), "maintenance");
					bdrepo.save(bd);
					success=true;	
					
					int id = Integer.parseInt(issueid);
					dService.updateStatus(id,"maintenance scheduled");
			}
			isSuccessful.add(success);
	    }
		return isSuccessful;
	}
	
	public ArrayList<BookingDetail> allBookingDetails(){
		
		ArrayList<BookingDetail> bk=bdrepo.allBookingDetails();
		return bk;
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class)
	public ArrayList<Booking> getAllBookings(){
		ArrayList<Booking> bookings = (ArrayList<Booking>)repository.findAll();
		for(Booking b : bookings) {
			ArrayList<BookingDetail> detaillist = bdrepo.findByBookingId(b.getBookingId());
			b.setBookingitems(detaillist);
		}
		return bookings;
	}
	
	@Override
	public int cancelBookingById(int id){
		int status = bdrepo.cancelBookingById(id);
		return status;
	}
	

    public Page<BookingDetail> getAllBookingsPaged(Pageable pageable) {
        return bdrepo.findAll(pageable);
    }

}


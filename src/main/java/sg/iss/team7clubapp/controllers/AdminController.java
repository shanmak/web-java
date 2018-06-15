package sg.iss.team7clubapp.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.iss.team7clubapp.beans.CartItem;
import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.DamageReport;
import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.services.BookingService;
import sg.iss.team7clubapp.services.DamageService;
import sg.iss.team7clubapp.services.FacilityService;
import sg.iss.team7clubapp.services.UserService;

@RequestMapping(value = "/admin")
@Controller
@ComponentScan("sg.iss.team7clubapp") 
public class AdminController {
	
    @Autowired
   BookingService bService;
	
	@Autowired
	private FacilityService fs;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private DamageService dService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView adminDashboard() {
		ModelAndView mav = new ModelAndView("admin/dashboard");
		return mav;
	}
	
	
	@RequestMapping(value="/list")
	public ModelAndView list() {
		
		ModelAndView mav= new ModelAndView("admin/fac-list");
		java.util.List<Facility> faclist=fs.FindallFacility();
		System.out.println("total size"+faclist.size());
		mav.addObject("faclist", faclist);
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public ModelAndView NewFacility() {
		
		ModelAndView mav = new ModelAndView("admin/newfacility","Facility", new Facility());
		
		return mav;
	}
	

	@RequestMapping(value="/new", method=RequestMethod.POST)
	public ModelAndView CreateFacility(@ModelAttribute Facility facility,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav= new ModelAndView();
		fs.CreateFacility(facility);	
		
		String mess=facility.getFacilityId();
		System.out.println("hello"+mess);
		redirectAttributes.addFlashAttribute("mess",mess);
		mav.setViewName("redirect:/admin/list");
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@PathVariable String id,final RedirectAttributes redirectAttributes)
	{
		ModelAndView mav = new ModelAndView("redirect:/admin/list");
		Facility facility = fs.findFacility(id);
		fs.removeFacility(facility);
		String message = "The facility " + facility.getFacilityId() + " was successfully deleted.";
		redirectAttributes.addFlashAttribute("message", message);
		
		return mav;
	} 
	
	
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable String id) {
		ModelAndView mav = new ModelAndView("admin/fac-edit");
		Facility Facility = fs.findFacility(id);
		
		mav.addObject("Facility", Facility);
		System.out.println(Facility.toString());
		
		return mav;
	
	}
	
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editStudent(@ModelAttribute @Valid Facility Facility, @PathVariable String id,
			 final RedirectAttributes redirectAttributes)  {
		/*System.out.println("student"+student.toString());
		if (result.hasErrors())
			return new ModelAndView("StudentFormEdit");*/
		fs.updateFacility(Facility);
		ModelAndView mav = new ModelAndView("redirect:/admin/list");
		////String message = "Student" + student.getNric() + " was successfully updated.";
		//redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	
	@RequestMapping(value = "/maintenance", method = RequestMethod.GET)
	public ModelAndView searchfacility() {
		ModelAndView mav = new ModelAndView("admin/maintenance");
		ArrayList<DamageReport> unresolvedlist = dService.findUnresolvedDamages(); 
		ArrayList<DamageReport> damagelist = dService.findResolvedDamages(); 
		mav.addObject("unresolvedlist", unresolvedlist);
		mav.addObject("damagelist", damagelist);
		return mav;
	}
	
	@RequestMapping(value = "/maintenancedetail/{id}", method = RequestMethod.GET)
	public ModelAndView maintenanceDetail(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("admin/maintenancedetail");
		DamageReport report = dService.findReport(id);
		
		mav.addObject("DamageReport", report);
		return mav;
		
	
	}
	
	@RequestMapping(value = "/maintenancedetail/{id}", method = RequestMethod.POST)
	public ModelAndView editReport(@ModelAttribute DamageReport report, @PathVariable int id,
			@RequestParam(value="status") String status)  {
		dService.updateStatus(id,status);
		ModelAndView mav = new ModelAndView("redirect:/admin/maintenance");
		return mav;
	}
	
	@RequestMapping(value = "plain/detail/{id}", method = RequestMethod.GET)
	public ModelAndView getNewDetail(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("admin/maintenancedetail");
		DamageReport report = dService.findReport(id);
		
		mav.addObject("DamageReport", report);
		return mav;
		
	}
	

	@RequestMapping(value = "/plain/createmaintenancebooking", method = RequestMethod.GET)
	public ModelAndView createMaintBooking(@RequestParam(value="bookdate") String bookdate,
			@RequestParam(value="facid") String facid)  {
		ModelAndView mav = new ModelAndView("admin/searchmaintenance");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate date = LocalDate.parse(bookdate, formatter);
		LinkedHashMap<String,Boolean[]> facslots = bService.showBookedSlotsForSingleFacility(facid, date);
		mav.addObject("date", date);
		mav.addObject("facslots", facslots);
		return mav;
	}
	
	
	@RequestMapping(value = "/plain/createmaintenancebooking", method = RequestMethod.POST)
	public ModelAndView addtocart(HttpSession session,
			@RequestParam(value="bookdate") String bookdate, 
		    @RequestParam(value="count") String count, 
		    @RequestParam(value="bookfacnames") String bookfacnames, 
		    @RequestParam(value="bookslots") String bookslots,
		    @RequestParam(value="issueid") String issueid) {
		ModelAndView mav = new ModelAndView("admin/confirm");

		ArrayList<CartItem> oldCart  = new ArrayList<CartItem>();
		ArrayList<CartItem> tempcart = bService.addToCart(bookdate, count, bookfacnames,bookslots, oldCart);
		int memberid = ((User)session.getAttribute("usersession")).getUserId();
		ArrayList<Boolean> cartsuccess = bService.createMaintenanceBooking(tempcart, memberid, issueid);

		mav.addObject("bookedcart", tempcart);
	    mav.addObject("cartsuccess", cartsuccess);
		
		return mav;
	}
	
	
	public ArrayList<CartItem> getSessionCart(HttpSession session){
		ArrayList<CartItem> myCart = new ArrayList<CartItem>();
		if (session.getAttribute("cartlist") != null)
		{  myCart = (ArrayList<CartItem>)session.getAttribute("cartlist"); 
			myCart = bService.cleanCart(myCart); }
		return myCart;		
	}
	
	@RequestMapping(value="/booking", method = RequestMethod.GET)
	public ModelAndView booking() {
		ModelAndView mav= new ModelAndView("admin/admin-book-details");
		
		ArrayList<BookingDetail> bd=bService.allBookingDetails();
		
		for (BookingDetail bookingDetail : bd) {

		System.out.println(	bookingDetail.getBooking().getUser().getUserName());
		System.out.println(	bookingDetail.getBooking().getBookingId());
		System.out.println(	bookingDetail.getReservedDate());
		System.out.println(	bookingDetail.getFacility().getFacilityName());
		System.out.println(	bookingDetail.getSlot().getSlotDescription());
		System.out.println(	bookingDetail.getStatus());
		}
		
		mav.addObject("bd", bd);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/createuser", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/newuser");
		
		User user = new User();
		model.addAttribute("userForm", user);
		return mav;
	}
	
	@RequestMapping(value = "/createuser", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute("userForm") User user, Model model, HttpSession session) {

		ModelAndView mav = new ModelAndView("dashboard");
		
		User newuser = new User();
	    try {
	    	newuser = uService.createUser(user);
	      }
	      catch (Exception ex) {
	        mav.addObject("creatingerror", true);
	        return mav;
	      }
	    
	      mav = new ModelAndView("redirect:/admin/home");
	      return mav;

	}
	
	@RequestMapping(value="/userlist", method = RequestMethod.GET)
	public ModelAndView userlist() {
		ModelAndView mav= new ModelAndView("admin/user-list");
		java.util.List<User> userlist=uService.findAllUser();
		
		mav.addObject("userlist", userlist);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable int id,final RedirectAttributes redirectAttributes)
	{
		ModelAndView mav = new ModelAndView("redirect:/admin/userlist");
		User user = uService.findUser(id);
		
		uService.removeUser(user);	
		
		String message = "The facility " + user.getUserId()+ " was successfully deleted.";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	} 
	
	@RequestMapping(value = "/useredit/{id}", method = RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("admin/user-edit");
		
        	User user = uService.findUser(id);
		
		mav.addObject("user", user);	
		
		return mav;
		
	}
	
	@RequestMapping(value = "/useredit/{id}", method = RequestMethod.POST)
	public ModelAndView editUser(@ModelAttribute @Valid User user, @PathVariable int id,
			 final RedirectAttributes redirectAttributes)  {

  	    user.setUserID(id);
		uService.updateUser(user);
		ModelAndView mav = new ModelAndView("redirect:/admin/userlist");

		return mav;
	}
	
	@RequestMapping(value="/bookinglist", method = RequestMethod.GET)
	public ModelAndView bookinglist() {
		
		ModelAndView mav= new ModelAndView("admin/booking-list");
		ArrayList<Booking> booklist=bService.getAllBookings();
		mav.addObject("booklist", booklist);

		return mav;
	}
	
	@RequestMapping(value="/cancel/{id}", method = RequestMethod.POST)
	public ModelAndView cancelBooking(@PathVariable int id) {
		
		int status = bService.cancelBookingById(id);
		
		ModelAndView mav= new ModelAndView("admin/booking-list");
		ArrayList<Booking> booklist=bService.getAllBookings();
		mav.addObject("booklist", booklist);

		return mav;
	}
	
	@RequestMapping(value="/bookinglistpaged")
	Page<BookingDetail> booklist(Pageable pageable){
		Page<BookingDetail> booklist = bService.getAllBookingsPaged(pageable);
		return booklist;
	}
	
	
	@RequestMapping(value = "/cancelbooking/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@PathVariable String id)
	{
		ModelAndView mav = new ModelAndView("admin/booking-list");
		int bookid = Integer.parseInt(id);
		bService.cancelBookingById(bookid);
		ArrayList<Booking> booklist=bService.getAllBookings();
		mav.addObject("booklist", booklist);
		mav.addObject("cancelsuccess",true);
//		String message = "The facility " + facility.getFacilityId() + " was successfully deleted.";
//		redirectAttributes.addFlashAttribute("message", message);
		
		return mav;
	}
	
}

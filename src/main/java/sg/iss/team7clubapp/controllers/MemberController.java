package sg.iss.team7clubapp.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.iss.team7clubapp.beans.CartItem;
import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.services.BookingService;
import sg.iss.team7clubapp.services.FacilityService;
import sg.iss.team7clubapp.services.UserService;

@RequestMapping(value = "/members")
@Controller
@ComponentScan("sg.iss.team7clubapp") 
public class MemberController {


    @Autowired
   BookingService bService;
    @Autowired
   FacilityService fService;
    @Autowired
   UserService uService;

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mav = new ModelAndView("members/welcome");
		List<Booking> myBookingList = bService.findByUserUserId(7);
		mav.addObject("myBookingList", myBookingList);
		return mav;
	}
	
	@RequestMapping(value = "/searchfacility", method = RequestMethod.GET)
	public ModelAndView searchfacility() {
		ModelAndView mav = new ModelAndView("members/searchfacility");
		List<String> factypes = fService.listAllFacilityType();
		mav.addObject("factypes", factypes);
		return mav;
	}
	
	@RequestMapping(value = "/searchresults", method = RequestMethod.GET)
	public ModelAndView searchresults(@RequestParam(value="bookdate") String bookdate, 
		    @RequestParam(value="factype") String factype) {
		ModelAndView mav = new ModelAndView("members/searchresults");
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate date = LocalDate.parse(bookdate, formatter);
		LinkedHashMap<String,Boolean[]> facslots = bService.showBookedSlotsByFacilityId(factype, date);
		mav.addObject("date", date);
		mav.addObject("facslots", facslots);
		return mav;
	}
	
	@RequestMapping(value = "/addtocart", method = RequestMethod.POST)
	public ModelAndView addtocart(HttpSession session,
			@RequestParam(value="bookdate") String bookdate, 
		    @RequestParam(value="count") String count, 
		    @RequestParam(value="bookfacnames") String bookfacnames, 
		    @RequestParam(value="bookslots") String bookslots) {
		ModelAndView mav = new ModelAndView("members/cartpage");

		ArrayList<CartItem> myCart  = getSessionCart(session);		
		ArrayList<CartItem> tempcart = bService.addToCart(bookdate, count, bookfacnames,bookslots, myCart);
		session.setAttribute("cartlist", tempcart);
		
		Boolean duplicate = false;
		for(CartItem c : tempcart) {
			if(c.getIsDuplicate()) {
				duplicate = true;
				break;
			}
		}
		mav.addObject("duplicate", duplicate);
		
		return mav;
	}
	
	@RequestMapping(value = "/viewcart", method = RequestMethod.GET)
	public ModelAndView viewCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("members/cartpage");
		
		ArrayList<CartItem> myCart  = getSessionCart(session);
		session.setAttribute("cartlist", myCart);
		return mav;
	}
	
	@RequestMapping(value = "/deletefromcart", method = RequestMethod.GET)
	public ModelAndView deleteFromCart(HttpSession session,
			@RequestParam(value="id") String id) {
		ModelAndView mav = new ModelAndView("members/cartpage");
		ArrayList<CartItem> myCart = getSessionCart(session);
		int index=Integer.parseInt(id);  
		myCart.remove(index);
		myCart = bService.cleanCart(myCart);
		session.setAttribute("cartlist", myCart);
		return mav;
	}
	
	@RequestMapping(value = "/confirmcart", method = RequestMethod.POST)
	public ModelAndView confirmCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("members/confirmpage");
		ArrayList<CartItem> myCart = getSessionCart(session);
		int memberid = ((User)session.getAttribute("usersession")).getUserId();
		ArrayList<Boolean> cartsuccess = bService.createBookingFromCart(myCart, memberid);

		session.setAttribute("cartlist", null);
		mav.addObject("bookedcart", myCart);
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
	
	@RequestMapping(value = "/mybooking",method = RequestMethod.GET)
	public ModelAndView mybookinglist(HttpSession session) {
		
		ModelAndView mav= new ModelAndView("members/book-details");
		int id = 0;
		try {
		id=((User)session.getAttribute("usersession")).getUserId();
		} catch (Exception ex) {
	        mav.addObject("iderror", true);		//***
	        return mav;
	      }

		ArrayList<BookingDetail> bd=uService.findmybookingdetails(id);
		mav.addObject("bd", bd);
				
		return mav;
	}
	


}
package sg.iss.team7clubapp;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sg.iss.team7clubapp.beans.CartItem;
import sg.iss.team7clubapp.model.Booking;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.services.BookingService;
import sg.iss.team7clubapp.services.UserService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/")
@Controller
@ComponentScan("sg.iss.team7clubapp") 
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	   UserService uService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String homepost(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView("login");
		if (session.getAttribute("usersession") != null)
		{  			
			User sessionuser = (User)session.getAttribute("usersession");
			if(sessionuser.getRole().equals("member")) {	
				return new ModelAndView("redirect:/members/welcome");
			}
			else if (sessionuser.getRole().equals("admin")) {
				return new ModelAndView("redirect:/admin/home");
			}
		}
		
		User user = new User();
		model.addAttribute("userForm", user);
		return mav;
	}
	
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public ModelAndView authenticate(Model model, @RequestParam(value="userName") String uname,
			@RequestParam(value="password") String password, HttpSession session) {

		ModelAndView mav = new ModelAndView("login");
		User user = uService.authenticate(uname, password);
		session.setAttribute("usersession", user);
		
		if(user != null) {
			if(user.getRole().equals("member")) {
				return new ModelAndView("redirect:/members/welcome");
			}
			else if (user.getRole().equals("admin")) {
				return new ModelAndView("redirect:/admin/home");
			}
			else {
		        mav.addObject("loginerror", true);
				return mav;
			}
		}
		mav.addObject("loginerror", true);
		return mav;
	}
	
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute("userForm") User user, Model model, HttpSession session) {

		ModelAndView mav = new ModelAndView("login");
		
		User newuser = new User();
	    try {
	    	newuser = uService.createUser(user);
	      }
	      catch (Exception ex) {
	        mav = new ModelAndView("signup");
	        mav.addObject("refilluser", user);
	        mav.addObject("creatingerror", true);
	        return mav;
	      }
	    
	      mav = new ModelAndView("redirect:/members/welcome");
	      session.setAttribute("isnewuser", true);
	      session.setAttribute("usersession", newuser);
	      return mav;

	}
	
	
	@RequestMapping(value = "/checkusername", method = RequestMethod.POST)
	public ModelAndView  checkpost(@RequestParam(value="username") String username, Locale locale, Model model) {
		
		ModelAndView mav = new ModelAndView("usernamefeedback");
		
		Boolean userexists = uService.userNameExists(username);
		if(username.isEmpty()) mav.addObject("feedbackisempty", true);
		mav.addObject("usercheckname", username);
		mav.addObject("feedback", userexists);
		return mav;
	}
	
	

	
	@RequestMapping(value = "/testpage", method = RequestMethod.GET)
	public String testpage(Model model) {
		return "testpage";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		session.setAttribute("usersession", null);	
		session.setAttribute("isnewuser", null);
		return mav;
	}
}

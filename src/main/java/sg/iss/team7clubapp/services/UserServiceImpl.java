package sg.iss.team7clubapp.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.repository.BookingDetailRepository;
import sg.iss.team7clubapp.repository.BookingRepository;
import sg.iss.team7clubapp.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserRepository repository;
	@Autowired
	private BookingDetailRepository bdrepo;
	
	@Override
	public User findByUserId(int userid) {
		User user = repository.findByUserId(userid);
		return user;
	}
	
	@Override
	public User createUser(User user) {
		User newuser = repository.save(user);
		return newuser;
	}
	
	@Override
	public Boolean userNameExists(String username) {
		return repository.existsByUserName(username);
	}
	
	@Override
	public User authenticate(String uname, String pwd) {
		User u = repository.findUserByNamePwd(uname, pwd);
		return u;
	}

	@Override
	@Transactional
	 public ArrayList<User> findAllUser(){
		
		ArrayList<User> list= (ArrayList<User>) repository.findAll();	
		
		return list;	
	}
	
	@Override
	@Transactional
	public void removeUser(User user) {
		repository.delete(user);
	} 
	
	@Override
	@Transactional
	public User findUser(int userId) {
		return repository.findOne(userId);

	} 
	
	@Override
	@Transactional
	public User updateUser(User u)
	{
		return repository.saveAndFlush(u);
	}
	
	@Override
	@Transactional
	public ArrayList<BookingDetail> findmybookingdetails(int i){
		
		 ArrayList<BookingDetail> membookinlist=bdrepo.bookingDetails(i);
		 
		 return membookinlist;
	}
}

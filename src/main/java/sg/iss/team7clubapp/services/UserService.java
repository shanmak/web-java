package sg.iss.team7clubapp.services;

import java.util.ArrayList;

import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.User;

public interface UserService {
	public User findByUserId(int userid);

	public User createUser(User user);

	public Boolean userNameExists(String username);

	public User authenticate(String uname, String pwd);

	ArrayList<User> findAllUser();

	void removeUser(User user);

	User updateUser(User user);

	User findUser(int userId);
	public ArrayList<BookingDetail> findmybookingdetails(int i);
}

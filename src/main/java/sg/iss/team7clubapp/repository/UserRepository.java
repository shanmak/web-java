package sg.iss.team7clubapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import sg.iss.team7clubapp.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query(value = "SELECT u FROM User u WHERE u.userId = :userid")
	User findByUserId(@Param("userid") int userid);

	@Query("SELECT Count(u)>0 from User u where u.userName=:username")
	Boolean existsByUserName(@Param("username") String username);

	@Query("SELECT u FROM User u WHERE u.userName=:uname AND u.password=:pwd")
	User findUserByNamePwd(@Param("uname") String uname, @Param("pwd") String pwd);
}
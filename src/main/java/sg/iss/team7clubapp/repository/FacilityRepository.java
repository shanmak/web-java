package sg.iss.team7clubapp.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import sg.iss.team7clubapp.model.Facility;

@Repository
public interface FacilityRepository extends JpaRepository<Facility, String> {

	@Query(value = "SELECT DISTINCT f.facilityType FROM Facility f ORDER BY f.facilityType" ) 
    List<String> listAllFacilityType();
	
	@Query(value = "SELECT f FROM Facility f WHERE f.facilityType = :factype ORDER BY f.facilityName")
	ArrayList<Facility> findByFacilityType(@Param("factype") String factype);
	
	@Query(value = "SELECT f FROM Facility f WHERE f.facilityName = :facname")
	Facility findByFacilityName(@Param("facname") String facname);
	
	@Query(value = "SELECT f FROM Facility f WHERE f.facilityId = :facid")
	Facility findByFacilityId(@Param("facid") String facid);
}
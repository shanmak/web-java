package sg.iss.team7clubapp.services;

import java.util.ArrayList;
import java.util.List;

import sg.iss.team7clubapp.model.Facility;

public interface FacilityService {
	public List<Facility> findAll();
	public List<String> listAllFacilityType();
	public ArrayList<Facility> findByFacilityType(String factype);
	public Facility findByFacilityName(String facname);
	
	
	public ArrayList<Facility> FindallFacility();
	
	Facility CreateFacility(Facility f);

	void removeFacility(Facility facility);

	Facility findFacility(String facilityId);
	
	Facility updateFacility(Facility facility);
	
	public Facility findByFacilityId(String facid);

}

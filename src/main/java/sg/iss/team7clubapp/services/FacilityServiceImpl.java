package sg.iss.team7clubapp.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.repository.FacilityRepository;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	private FacilityRepository repository;

	@Override
	public List<Facility> findAll() {
		List<Facility> facilities = (List<Facility>) repository.findAll();
		return facilities;
	}

	@Override
	public List<String> listAllFacilityType() {
		List<String> factypes = (List<String>) repository.listAllFacilityType();
		return factypes;
	}

	@Override
	public ArrayList<Facility> findByFacilityType(String factype) {
		ArrayList<Facility> facilities = (ArrayList<Facility>) repository.findByFacilityType(factype);
		return facilities;
	}

	@Override
	public Facility findByFacilityName(String facname) {
		Facility facility = (Facility) repository.findByFacilityName(facname);
		return facility;
	}

	@Override
	@Transactional
	public ArrayList<Facility> FindallFacility() {

		ArrayList<Facility> list = (ArrayList<Facility>) repository.findAll();

		return list;
	}

	@Override
	@Transactional
	public Facility CreateFacility(Facility f) {

		return repository.save(f);
	}

	@Override
	@Transactional
	public void removeFacility(Facility facility) {
		repository.delete(facility);
	}

	@Override
	@Transactional
	public Facility findFacility(String facilityId) {
		return repository.findOne(facilityId);

	}

	@Override
	@Transactional
	public Facility updateFacility(Facility f) {
		return repository.save(f);
	}

	
	@Override
	public Facility findByFacilityId(String facid) {
		Facility facility = (Facility) repository.findByFacilityId(facid);
		return facility;
	}
	
}

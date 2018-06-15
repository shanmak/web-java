package sg.iss.team7clubapp.services;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.model.DamageReport;
import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.model.User;
import sg.iss.team7clubapp.repository.DamageRepository;

@Service
public class DamageServiceImpl implements DamageService {
	
	@Autowired
	private DamageRepository repository;
	
	@Override
	public ArrayList<DamageReport> findUnresolvedDamages(){
		return repository.findUnresolvedDamages();
	}
	
	@Override
	public ArrayList<DamageReport> findResolvedDamages(){
		return repository.findResolvedDamages();
	}
	
	@Override
	public ArrayList<DamageReport> findAllDamages(){
		ArrayList<DamageReport> damages = (ArrayList<DamageReport>)repository.findAll();
		return damages;
	}
	
	@Override
	@Transactional
	public DamageReport findReport(int issueId) {
		return repository.findOne(issueId);

	}
	
	@Override
	@Transactional
	public DamageReport createReport(DamageReport report) {
		DamageReport newreport = repository.save(report);
		return newreport;
	}
	
	@Override
	@Transactional
	public DamageReport updateReport(DamageReport report) {
		return repository.save(report);
	}
	
	@Override
	@Transactional
	public void updateStatus(int id,String status) {
		repository.updateStatus(id,status);
	}
	
	
}

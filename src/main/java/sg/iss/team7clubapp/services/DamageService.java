package sg.iss.team7clubapp.services;

import java.time.LocalDate;
import java.util.ArrayList;

import sg.iss.team7clubapp.model.DamageReport;
import sg.iss.team7clubapp.model.Facility;
import sg.iss.team7clubapp.model.User;

public interface DamageService {
	public ArrayList<DamageReport> findUnresolvedDamages();
	public ArrayList<DamageReport> findResolvedDamages();
	
	public ArrayList<DamageReport> findAllDamages();
	public DamageReport findReport(int issueId);
	public DamageReport createReport(DamageReport report);
	public DamageReport updateReport(DamageReport report); 
	
	public void updateStatus(int id,String status);

}

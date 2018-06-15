package sg.iss.team7clubapp.repository;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sg.iss.team7clubapp.model.DamageReport;

@Repository
@Transactional
public interface DamageRepository extends JpaRepository<DamageReport, Integer> {

	@Query(value = "SELECT d FROM DamageReport d WHERE d.status NOT IN('resolved')")
	ArrayList<DamageReport> findUnresolvedDamages();
	
	@Query(value = "SELECT d FROM DamageReport d WHERE d.status IN('resolved')")
	ArrayList<DamageReport> findResolvedDamages();
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value = "UPDATE DamageReport d SET d.status=:status WHERE d.issueId = :id")
	void updateStatus(@Param("id") int id,@Param("status") String status);


}
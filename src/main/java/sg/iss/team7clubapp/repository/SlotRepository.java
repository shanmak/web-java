package sg.iss.team7clubapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import sg.iss.team7clubapp.model.Slot;

@Repository
public interface SlotRepository extends JpaRepository<Slot, Integer> {

	@Query(value = "SELECT s FROM Slot s WHERE s.slotNumber= :slotnum")
    Slot findSlotById(@Param("slotnum") int slotnum);
}
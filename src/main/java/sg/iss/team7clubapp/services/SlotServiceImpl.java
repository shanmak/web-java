package sg.iss.team7clubapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sg.iss.team7clubapp.model.Slot;
import sg.iss.team7clubapp.repository.SlotRepository;

@Service
public class SlotServiceImpl implements SlotService {
	
	@Autowired
	private SlotRepository repository;
	
	@Override
	public Slot findSlotById(int slotnum) {
		Slot slot = repository.findSlotById(slotnum);
		return slot;
	}
}

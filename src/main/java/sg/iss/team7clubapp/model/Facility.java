package sg.iss.team7clubapp.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import sg.iss.team7clubapp.model.BookingDetail;
import sg.iss.team7clubapp.model.DamageReport;

@Entity
@Table(name = "facility")
public class Facility implements Comparable<Facility>{

	@Id
	@Column (name="facility_id")
	private String facilityId;
	@Column (name="facility_name")
	private String facilityName;
	private String description;
	@Column (name="facility_type")
	private String facilityType;
	private String venue;
	private String image;
	private double price;

	@OneToMany (mappedBy="facility")
	private Set<BookingDetail> bookings = new HashSet<BookingDetail>();
	
	@OneToMany (mappedBy="facility", cascade = {CascadeType.ALL})
	private Set<DamageReport> damageReports = new HashSet<DamageReport>();
	
    public void addDamageReport(DamageReport report) {
    	damageReports.add(report);
    	report.setFacility(this);
    }
 
    public void removeDamageReport(DamageReport report) {
    	damageReports.remove(report);
    	report.setFacility(null);
    }
	
	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}
	public String getFacilityName() {
		return facilityName;
	}
	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String decription) {
		this.description = decription;
	}
	public String getFacilityType() {
		return facilityType;
	}
	public void setFacilityType(String facilityType) {
		this.facilityType = facilityType;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Facility(String facilityId, String facilityName, String decription, String facilityType, String venue,
			String image, double price) {
		this.facilityId = facilityId;
		this.facilityName = facilityName;
		this.description = decription;
		this.facilityType = facilityType;
		this.venue = venue;
		this.image = image;
		this.price = price;
	}
	
	public Facility() {
		
	}
	@Override
	public String toString() {
		return "Facility [facilityId=" + facilityId + ", facilityName=" + facilityName + ", description=" + description
				+ ", facilityType=" + facilityType + ", venue=" + venue + ", image=" + image + ", price=" + price + "]";
	}

	@Override
	public int compareTo(Facility other) {
		return this.facilityName.compareTo(other.facilityName);
	}
	
	
}

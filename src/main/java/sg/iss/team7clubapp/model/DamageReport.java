package sg.iss.team7clubapp.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "damage_report")
public class DamageReport {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column (name="issue_id")
	private int issueId;

	@ManyToOne (cascade = CascadeType.ALL)
	@JoinColumn(name="facility_id")
	private Facility facility; 
	
	@Column (name="issue_date")
	private LocalDate issueDate;
	private String description;
	private String status;
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public Facility getFacility() {
		return facility;
	}
	public void setFacility(Facility facility) {
		this.facility = facility;
	}
	public LocalDate getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(LocalDate issueDate) {
		this.issueDate = issueDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public DamageReport(int issueId, Facility facility, LocalDate issueDate, String description, String status) {
		this.issueId = 0;
		this.facility = facility;
		this.issueDate = issueDate;
		this.description = description;
		this.status = status;
	}
	public DamageReport() {
		this.issueId=0;
	}
	@Override
	public String toString() {
		return "DamageReport [issueId=" + issueId + ", facility=" + facility + ", issueDate=" + issueDate
				+ ", description=" + description + ", status=" + status + "]";
	}
	
}

package beans;

import java.sql.Timestamp;

public class Usersubmit {
	 private int id;
 	 private String cancertype;
 	 private String gene1;
 	 private String aberrancetype1;
 	 private String gene2;
 	private String aberrancetype2;
 	 private String pmid;
 	private String evidence;
 	 private String email;
 	 private Timestamp submittime;
 	public Usersubmit(){
 		
 	}
	public String getCancertype() {
		return cancertype;
	}
	public void setCancertype(String cancertype) {
		this.cancertype = cancertype;
	}
	public String getGene1() {
		return gene1;
	}
	public void setGene1(String gene1) {
		this.gene1 = gene1;
	}
	
	public String getAberrancetype1() {
		return aberrancetype1;
	}
	public void setAberrancetype1(String aberrancetype1) {
		this.aberrancetype1 = aberrancetype1;
	}
	public String getAberrancetype2() {
		return aberrancetype2;
	}
	public void setAberrancetype2(String aberrancetype2) {
		this.aberrancetype2 = aberrancetype2;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getGene2() {
		return gene2;
	}
	public void setGene2(String gene2) {
		this.gene2 = gene2;
	}
	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getSubmittime(){
		return submittime;
	}
	public void setSubmittime(Timestamp submittime) {
		this.submittime = submittime;
	}
	public Usersubmit(String cancertype, String gene1, String aberrancetype1, String gene2,
			String aberrancetype2, String pmid, String evidence, String email) {
		this.cancertype = cancertype;
		this.gene1 = gene1;
		this.aberrancetype1 = aberrancetype1;
		this.gene2 = gene2;
		this.aberrancetype2 = aberrancetype2;
		this.pmid = pmid;
		this.evidence = evidence;
		this.email = email;
	}


 	
}

package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import utils.SqlPool;

@SuppressWarnings("serial")
public class SubmitAction extends ActionSupport{

	private String cancertype;
	private String gene1;
	private String aberrancetype1;
	private String gene2;
	private String aberrancetype2;
	private String pmid;
	private String evidence;
	private String email;
	private String message;
	public String Submit() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt =null;
		String sql = "insert into meddc.usersubmit values(null,?,?,?,?,?,?,?,?,NOW())";
		try{
			   conn=SqlPool.getConnection();
			   pstmt=conn.prepareStatement(sql);
			   pstmt.setString(1, this.cancertype);
			   pstmt.setString(2, gene1);
			   pstmt.setString(3, aberrancetype1);
			   pstmt.setString(4, gene2);
			   pstmt.setString(5, aberrancetype2);
			   pstmt.setString(6, pmid);
			   pstmt.setString(7, evidence);
			   pstmt.setString(8, email);
			   pstmt.executeUpdate();
			   System.out.println(pstmt);
			}
			catch (Exception e){
				e.printStackTrace();
				message = "sorry,system busy,please try later.";
				return ERROR;
			}
			finally{
				pstmt.close();
				SqlPool.putBackConnection(conn);
			}
		message = "You have upload successfully";
		return SUCCESS;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
	
}

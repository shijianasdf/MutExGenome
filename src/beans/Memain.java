package beans;

public class Memain {
	private String mainid;
	private String tissueorigin;
	private String cancertype;
	private String subtype;
	private String genename1;
	private String geneid1;
	private String ensembleid1;
	private String aberrancetype1;
	private String genename2;
	private String geneid2;
	private String ensembleid2;
	private String aberrancetype2;
	private String evidence;
	private String plotimage;
	
	public Memain(){
		
	}
	public String getMainid() {
		return mainid;
	}
	public void setMainid(String mainid) {
		this.mainid = mainid;
	}
	public String getTissueorigin() {
		return tissueorigin;
	}
	public void setTissueorigin(String tissueorigin) {
		this.tissueorigin = tissueorigin;
	}
	public String getCancertype() {
		return cancertype;
	}
	public void setCancertype(String cancertype) {
		this.cancertype = cancertype;
	}
	public String getGenename1() {
		return genename1;
	}
	public void setGenename1(String genename1) {
		this.genename1 = genename1;
	}
	public String getGeneid1() {
		return geneid1;
	}
	public void setGeneid1(String geneid1) {
		this.geneid1 = geneid1;
	}
	public String getEnsembleid1() {
		return ensembleid1;
	}
	public void setEnsembleid1(String ensembleid1) {
		this.ensembleid1 = ensembleid1;
	}
	public String getGenename2() {
		return genename2;
	}
	public void setGenename2(String genename2) {
		this.genename2 = genename2;
	}
	public String getGeneid2() {
		return geneid2;
	}
	public void setGeneid2(String geneid2) {
		this.geneid2 = geneid2;
	}
	public String getEnsembleid2() {
		return ensembleid2;
	}
	public void setEnsembleid2(String ensembleid2) {
		this.ensembleid2 = ensembleid2;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
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
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public String getPlotimage() {
		return plotimage;
	}
	public void setPlotimage(String plotimage) {
		this.plotimage = plotimage;
	}
	public Memain(String mainid, String tissueorigin, String cancertype, String subtype, String genename1,
			String geneid1, String ensembleid1, String aberrancetype1, String genename2, String geneid2,
			String ensembleid2, String aberrancetype2, String evidence, String plotimage) {
		this.mainid = mainid;
		this.tissueorigin = tissueorigin;
		this.cancertype = cancertype;
		this.subtype = subtype;
		this.genename1 = genename1;
		this.geneid1 = geneid1;
		this.ensembleid1 = ensembleid1;
		this.aberrancetype1 = aberrancetype1;
		this.genename2 = genename2;
		this.geneid2 = geneid2;
		this.ensembleid2 = ensembleid2;
		this.aberrancetype2 = aberrancetype2;
		this.evidence = evidence;
		this.plotimage = plotimage;
	}

	

	
}

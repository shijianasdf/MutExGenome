package beans;

public class Edges {
     private String id;
     private String source;
     private String aberrancetype1;
     private String target;
     private String aberrancetype2;
     private String evidence;
     private String tissueorigin;
     private String cancertype;
     private String subtype;
     private String edgecolor;
     private String linestyle;
     public Edges(){
    	 
     }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}

	public String getEdgecolor() {
		return edgecolor;
	}
	public void setEdgecolor(String edgecolor) {
		this.edgecolor = edgecolor;
	}
	
	public String getCancertype() {
		return cancertype;
	}
	public void setCancertype(String cancertype) {
		this.cancertype = cancertype;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
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
	public String getLinestyle() {
		return linestyle;
	}
	public void setLinestyle(String linestyle) {
		this.linestyle = linestyle;
	}
	
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getTissueorigin() {
		return tissueorigin;
	}
	public void setTissueorigin(String tissueorigin) {
		this.tissueorigin = tissueorigin;
	}
	public Edges(String id, String source, String aberrancetype1, String target, String aberrancetype2, String evidence,
			String tissueorigin, String cancertype, String subtype, String edgecolor, String linestyle) {
		this.id = id;
		this.source = source;
		this.aberrancetype1 = aberrancetype1;
		this.target = target;
		this.aberrancetype2 = aberrancetype2;
		this.evidence = evidence;
		this.tissueorigin = tissueorigin;
		this.cancertype = cancertype;
		this.subtype = subtype;
		this.edgecolor = edgecolor;
		this.linestyle = linestyle;
	}


     
}

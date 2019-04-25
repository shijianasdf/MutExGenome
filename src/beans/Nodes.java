package beans;

public class Nodes {
	private String id;
	private String nodecolor;
	private String favorshape;
	public Nodes(){
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNodecolor() {
		return nodecolor;
	}
	public void setNodecolor(String nodecolor) {
		this.nodecolor = nodecolor;
	}
	public String getFavorshape() {
		return favorshape;
	}
	public void setFavorshape(String favorshape) {
		this.favorshape = favorshape;
	}
	public Nodes(String id, String nodecolor, String favorshape) {
		this.id = id;
		this.nodecolor = nodecolor;
		this.favorshape = favorshape;
	}
	
}

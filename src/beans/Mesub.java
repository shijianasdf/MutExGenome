package beans;

public class Mesub{
	private int id;
	private String aberrancesite1;
	private String aberrancesite2;
	private String description;
	private int pmid;
	private String mainid;	
	public Mesub(int id, String aberrancesite1, String aberrancesite2, String description, int pmid, String mainid) {
		this.id = id;
		this.aberrancesite1 = aberrancesite1;
		this.aberrancesite2 = aberrancesite2;
		this.description = description;
		this.pmid = pmid;
		this.mainid = mainid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public int getPmid() {
		return pmid;
	}
	public void setPmid(int pmid) {
		this.pmid = pmid;
	}
	public String getAberrancesite1() {
		return aberrancesite1;
	}
	public void setAberrancesite1(String aberrancesite1) {
		this.aberrancesite1 = aberrancesite1;
	}
	public String getAberrancesite2() {
		return aberrancesite2;
	}
	public void setAberrancesite2(String aberrancesite2) {
		this.aberrancesite2 = aberrancesite2;
	}
	public String getMainid() {
		return mainid;
	}
	public void setMainid(String mainid) {
		this.mainid = mainid;
	}
	public Mesub(){
		
	}

	
}

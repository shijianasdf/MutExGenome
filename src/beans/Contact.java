package beans;

public class Contact {
	private int id;
	private String name;
	private String email;
	private String tel;
	private String textarea;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTextarea() {
		return textarea;
	}
	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}
	public Contact(){
		
	}
	public Contact(String name, String email, String tel, String textarea){
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.textarea = textarea;
	} 	  
}

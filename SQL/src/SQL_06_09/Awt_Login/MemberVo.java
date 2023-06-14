package SQL_06_09.Awt_Login;

public class MemberVo {
	private String id;
	private String password;
	
	public MemberVo() {
		
	}
	
	public MemberVo(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}
	
	
}

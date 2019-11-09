package carrot.market.test.model;
/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 회원모델 
 * 
 */
public class User {

	private String email;
	private String name;
	private String encrypted_password;
	private String created_at;
	private String updated_at;

	public User() {
		super();
	}

	public User(String email, String name, String encrypted_password, String created_at, String updated_at) {
		super();
		this.email = email;
		this.name = name;
		this.encrypted_password = encrypted_password;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEncrypted_password() {
		return encrypted_password;
	}

	public void setEncrypted_password(String encrypted_password) {
		this.encrypted_password = encrypted_password;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", name=" + name + ", encrypted_password=" + encrypted_password
				+ ", created_at=" + created_at + ", updated_at=" + updated_at + "]";
	}

}

package member.model.vo;

public class Member {
	
	private int mem_num;
	private String email;
	private String password;
	private String name;
	private String birthday;
	private String phone;
	private String address;
	private int count;
	private String cansell;
	private String g_code;
	private String g_rank;
	
	public Member() {
		
	}

	public Member(int mem_num, String email, String password, String name, String birthday, String phone, String address,
			int count, String cansell, String g_code, String g_rank) {
		super();
		this.mem_num = mem_num;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.count = count;
		this.cansell = cansell;
		this.g_code = g_code;
		this.g_rank = g_rank;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCansell() {
		return cansell;
	}

	public void setCansell(String cansell) {
		this.cansell = cansell;
	}
	
	public String getG_Code() {
		return g_code;
	}

	public void setG_Code(String g_code) {
		this.g_code = g_code;
	}

	public String getG_Rank() {
		return g_rank;
	}

	public void setG_Rank(String g_rank) {
		this.g_rank = g_rank;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.mem_num + ", " + this.email + ", " + this.password + ", "
				+ this.name + ", " + this.birthday + ", " + this.phone + ", "
				+ this.address + ", " + this.count + ", " + this.cansell + ", "
				+ this.g_code + ", " + this.g_rank;
	}
	
}

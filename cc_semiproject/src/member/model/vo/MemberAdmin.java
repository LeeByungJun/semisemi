package member.model.vo;

import java.io.Serializable;

public class MemberAdmin implements Serializable{

	private static final long serialVersionUID = 5L;
	
	private int mem_num;
	private String email;
	private String name;
	private String phone;
	private String address;
	private int count;
	private String cansell;
	private String g_rank;
	
	public MemberAdmin() {
		
	}

	public MemberAdmin(int mem_num, String email, String name, String phone, String address,
			int count, String cansell, String g_rank) {
		super();
		this.mem_num = mem_num;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.count = count;
		this.cansell = cansell;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getG_Rank() {
		return g_rank;
	}

	public void setG_Rank(String g_rank) {
		this.g_rank = g_rank;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.mem_num + ", " + this.email + ", "
				+ this.name + ", " + this.phone + ", "
				+ this.address + ", " + this.count + ", " + this.cansell + ", "
				+ this.g_rank;
	}
	
}

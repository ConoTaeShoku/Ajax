package h.h.ajax1.vo;

public class Customer {

	private String custid;
	private String password;
	private String text;
	
	public Customer (){}
	
	public Customer(String custid, String password, String text) {
		this.custid = custid;
		this.password = password;
		this.text = text;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "Customer [custid=" + custid + ", password=" + password + ", text=" + text + "]";
	}

}

package h.h.ajax1.vo;

public class Comment {

	private int number;
	private String name;
	private String text;

	public Comment() {
	}

	public Comment(int number, String name, String text) {
		super();
		this.number = number;
		this.name = name;
		this.text = text;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "Comment [number=" + number + ", name=" + name + ", text=" + text + "]";
	}

}

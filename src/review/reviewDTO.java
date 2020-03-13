package review;

public class reviewDTO {
	int postnum;
	String nick;
	String pyung;
	String content;
	String date;
	
	public String getPyung() {
		return pyung;
	}
	public void setPyung(String pyung) {
		this.pyung = pyung;
	}
	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}

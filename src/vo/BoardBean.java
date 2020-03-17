package vo;

import java.sql.Date;

public class BoardBean {
	
	private int qnum;
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getQpass() {
		return qpass;
	}
	public void setQpass(String qpass) {
		this.qpass = qpass;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQfile() {
		return qfile;
	}
	public void setQfile(String qfile) {
		this.qfile = qfile;
	}
	public int getQref() {
		return qref;
	}
	public void setQref(int qref) {
		this.qref = qref;
	}
	public int getQlev() {
		return qlev;
	}
	public void setQlev(int qlev) {
		this.qlev = qlev;
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	private String nick;
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String qpass;
	private String qtitle;
	private String qcontent;
	private String qfile;
	private int qref;
	private int qlev;
	private int qseq;
	private int available;
	private Date date;
	private int readcount;
	private String keyword;
	private String search;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}
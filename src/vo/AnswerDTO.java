package vo;

import java.sql.Date;

public class AnswerDTO {
public int qnum;
public String id;
public String nick;
public String answer;
public int getQnum() {
	return qnum;
}
public void setQnum(int qnum) {
	this.qnum = qnum;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getNick() {
	return nick;
}
public void setNick(String nick) {
	this.nick = nick;
}
public String getAnswer() {
	return answer;
}
public void setAnswer(String answer) {
	this.answer = answer;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public Date date;
}

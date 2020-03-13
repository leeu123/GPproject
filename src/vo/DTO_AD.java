package vo;

public class DTO_AD {
	private String name;
	private String cell;
	private String email;
	private String type;
	private String store;
	private String price;
	private String home;
	private int readcount;
	private String content;
	private String postnum;
	private String file;
	private String dethome;
   private String keyword;
	
	
	public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
}
	public double getAvg_pyung() {
		return avg_pyung;
	}
	public void setAvg_pyung(double avg_pyung) {
		this.avg_pyung = avg_pyung;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	private String id;
	private String location;
	private int rnum;
	private String parking;
	private double avg_pyung;
	private String dcontent;
	private String nick;
	public String[] getNavloca() {
		return navloca;
	}
	public void setNavloca(String[] navloca) {
		this.navloca = navloca;
	}
	public String[] getNavtype() {
		return navtype;
	}
	public void setNavtype(String[] navtype) {
		this.navtype = navtype;
	}
	public String[] getNavprice() {
		return navprice;
	}
	public void setNavprice(String[] navprice) {
		this.navprice = navprice;
	}
	private String [] navloca;
	private String [] navtype;
	private String [] navprice;
	private int startpage;
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getFinish_time() {
		return finish_time;
	}
	public void setFinish_time(String finish_time) {
		this.finish_time = finish_time;
	}
	public String getBreak_time() {
		return break_time;
	}
	public void setBreak_time(String break_time) {
		this.break_time = break_time;
	}
	private String start_time;
	private String finish_time;
	private String break_time;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getDethome() {
		return dethome;
	}
	public void setDethome(String dethome) {
		this.dethome = dethome;
	}
	

}

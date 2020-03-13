package restaurant; //������������ ���񽺷� ����


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.DTO_AD;
import resdat.resdatDTO;

public class restauAction {
	static restauAction model = new restauAction();

	public static restauAction instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	
	
	public List<resdatDTO>  selectlistmasjip() { // 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjip");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	
	public List<resdatDTO>  selectlistmasjipkor() { // 한식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipkor");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipchn() { // 중식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipchn");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipjpn() { // 중식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipjpn");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipwest() { // 중식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipwest");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipworld() { // 중식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipworld");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipwhat() { // 중식 평점 베스트 10으로 평점과 식당번호(rnum)을 들고오기 위함
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectmasjipwhat");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public DTO_AD  selectRestau(int rnum) {  // 평점 베스트10에서 식당정보 들고 오기 위한 메소드 rnum으로 식당정보
		DTO_AD list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectOne("selectRestau",rnum);
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}

	
	
	public resdatDTO  selectResdat(int rnum) {  // 평점 베스트10에서 식당정보 들고 오기 위한 메소드 rnum으로 식당정보
		resdatDTO list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectOne("selectResdat",rnum);
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	
	public List<DTO_AD> selectViewtop() {  // 조회순으로 베스트 10 식당정보 
		List<DTO_AD> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectViewtop");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
		
	}
	
	public List<DTO_AD> navsearch(DTO_AD dtoad){
		System.out.println("");
		List<DTO_AD> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("navsearch",dtoad);
		System.out.println("aa"+list.size());
		sqlSession.close();
		return list;
	}
	public List<DTO_AD> navlistcount(DTO_AD dtoad){
		System.out.println("");
		List<DTO_AD> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("navlistcount",dtoad);
		sqlSession.close();
		return list;
	}
	
	public List<resdatDTO>  selectlistmasjipseoul() { // 서울 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipseoul");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipdj() { // 대전 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipdj");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipgj() { // 광주 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipgj");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipbs() { // 부산 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipbs");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipkk() { // 경기 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipkk");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipkw() { // 강원 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipkw");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipcb() { // 충북 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipcb");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipcn() { // 충남 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipcn");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	public List<resdatDTO>  selectlistmasjipic() { // 인천 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipic");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipsj() { // 세종 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipsj");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipus() { // 울산 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipus");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipkn() { // 경남 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipkn");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipkb() { // 경북 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipkb");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipdg() { // 대구 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipdg");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipjn() { // 전남 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipjn");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipjb() { // 전북 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipjb");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<resdatDTO>  selectlistmasjipjj() { // 제주 맛집 베스트 10 정보를
		List<resdatDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("masjipjj");
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}



}

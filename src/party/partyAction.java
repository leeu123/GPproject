package party; //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏟스뤄옙 占쏙옙占쏙옙


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import member.MemberDTO;
import party.PartyDTO;
import party.ApplyDTO;
import party.Preview;
import resdat.resdatDTO;
import vo.BoardBean;
import vo.ReviewBean;
import vo.reservationDTO;
import mybatis.SqlMapConfig;

public class partyAction {
	static partyAction model = new partyAction();

	public static partyAction instance() {
		return model;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	

	public void insertParty(PartyDTO PartyDTO) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertParty", PartyDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	//진행중인 파티 카테고리별 파티정보 불러오기
	public List<PartyDTO> selectlistParty(String cate) {
		List<PartyDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectlistParty",cate);
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<PartyDTO> selectParty(int pnum) {
		List<PartyDTO> sic = null;
		SqlSession sqlSession = factory.openSession();
		sic = sqlSession.selectList("selectParty",pnum);
		sqlSession.close();
		return sic;
	}
	
	public List<PartyDTO> selectlistPartyre(String cate) {
		List<PartyDTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("selectlistPartyre",cate);
		sqlSession.close();
		if(list!=null) {
		return list;
		}
		return null;
	}
	
	public List<PartyDTO> selectPartyre(int pnum) {
		List<PartyDTO> sic = null;
		SqlSession sqlSession = factory.openSession();
		sic = sqlSession.selectList("selectPartyre",pnum);
		sqlSession.close();
		return sic;
	}
	
	
	public void insertPreview(Preview preview) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertPreview", preview);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<Preview> selectlistPreview(int pnum) {
		List<Preview> sic = null;
		SqlSession sqlSession = factory.openSession();
		sic = sqlSession.selectList("selectlistPreview",pnum);
		sqlSession.close();
		if(sic.size()!=0) {
			return sic;
			}
			return null;
	}
	
	public void insertApply(ApplyDTO ApplyDTO) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insertApply", ApplyDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public boolean selectApply(ApplyDTO adto) {
		String psnum = null;
		SqlSession sqlSession = factory.openSession();
		psnum = sqlSession.selectOne("selectApply",adto);
		sqlSession.close();
		if(psnum !=null) {
			return true;
			}
			return false;
	}
	
	public int selectApplycount(int pnum) {
		int Apply_count = 0;
		SqlSession sqlSession = factory.openSession();
		Apply_count = sqlSession.selectOne("selectApplycount",pnum);
		sqlSession.close();
		if(Apply_count != 0) {
			return Apply_count;
			}
			return 0;
	}
	
	public boolean Applyable(int pnum) {
		int Applyable = 0;
		SqlSession sqlSession = factory.openSession();
		Applyable = sqlSession.selectOne("ApplyAble",pnum);
		sqlSession.close();
		if(Applyable != 0) {
			return true;
			}
			return false;
	}
	
	public reservationDTO cheres(reservationDTO rsdto) { // 예약한 정보 들고오기
		reservationDTO rsrs = null;
		SqlSession sqlSession = factory.openSession();
		rsrs = sqlSession.selectOne("checkres",rsdto);
		sqlSession.close();
		
		return rsrs;
	}
	
	
	public void reservation(reservationDTO rsdto) {  // 식당 예약 정보 입력
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("reservation", rsdto);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public boolean cancel(reservationDTO rsdto) {  // 식당 예약 정보 삭제 (취소)
		try{SqlSession sqlSession = factory.openSession();
		sqlSession.delete("cancel", rsdto);
		sqlSession.commit();
		sqlSession.close();
	}
		catch(Exception e) {
			return false;
		}
	 return true;
	 }
	
	
	public MemberDTO member(String id) {  // 회원정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		MemberDTO mb = sqlSession.selectOne("member",id);
		sqlSession.close();
		
		return mb;
	}
	
	
	public List<ReviewBean> review(String id) {  // 리뷰 게시판 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<ReviewBean> mb = sqlSession.selectList("review",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	
	public List<PartyDTO> party(String id) {  // 회원정보로 신청한 파티 정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<PartyDTO> mb = sqlSession.selectList("party",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	
	public List<PartyDTO> party1(String id) {  // 회원정보로 신청한 파티 정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<PartyDTO> mb = sqlSession.selectList("party1",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	
	
	public List<BoardBean> QnA(String id) {  // 회원정보로 신청한 파티 정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<BoardBean> mb = sqlSession.selectList("QnA",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	
	public List<PartyDTO> apparty(String id) {  // 회원정보로 신청한 파티 정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<PartyDTO> mb = sqlSession.selectList("apparty",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	
	public List<resdatDTO> resdat(String id) {  // 회원정보로 신청한 파티 정보 들고오기 id로
		SqlSession sqlSession = factory.openSession();
		List<resdatDTO> mb = sqlSession.selectList("resdat",id);
		sqlSession.close();
		if(mb.size()!=0) {
			return mb;
		}
		else {
			return null;
		}
	}
	




}

package controll; //占쏙옙占쏙옙占쏙옙占싱쏙옙

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDTO;

import java.util.*;

import party.PartyDTO;
import party.Preview;
import resdat.*;
import vo.*;

public interface partyCommandInter { // partyControllerServlet.java 에서 사용할 메소드의 인터페이스

	String inseParty(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String seleParty(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String selelistParty(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String selePartyre(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String selelistPartyre(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<Preview> selelistPreview(HttpServletRequest request, HttpServletResponse response) throws Exception;

	boolean insePreview(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String inseApply(HttpServletRequest request, HttpServletResponse response) throws Exception;

	boolean seleApply(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjip(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipkor(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipchn(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipjpn(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipwest(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipworld(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ArrayList<resdatDTO> selelistmasjipwhat(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<DTO_AD> seleViewtop(HttpServletRequest request, HttpServletResponse response) throws Exception;

	DTO_AD seleRestau(HttpServletRequest request, HttpServletResponse response) throws Exception;

	resdatDTO seleResdat(HttpServletRequest request, HttpServletResponse response) throws Exception;

	int seleApplycount(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public boolean Applyable(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String navsearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String navsearch2(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String reservation(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public reservationDTO checkReser(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public boolean rescancel(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String searchbar(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<resdatDTO> selelistmasjipseoul(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipdj(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipgj(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipbs(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipkk(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipkw(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipcb(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipcn(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public MemberDTO member(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<ReviewBean> review(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<PartyDTO> party(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<PartyDTO> party1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<BoardBean> QnA(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<PartyDTO> apparty(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<resdatDTO> resdat(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<resdatDTO> selelistmasjipic(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipsj(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipus(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipkn(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipkb(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipdg(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipjb(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipjn(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ArrayList<resdatDTO> selelistmasjipjj(HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	String searchbar2(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	
	
	public ArrayList<resdatDTO> resdatall(HttpServletRequest request, HttpServletResponse response) throws Exception; // 모든 댓글 들고오기
	
	public ArrayList<ReviewBean> reviewall(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<PartyDTO> partyall(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<PartyDTO> party1all(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ArrayList<BoardBean> QnAall(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ArrayList<DTO_AD> restauall(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String idrest(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public boolean deleteresdat(HttpServletRequest request, HttpServletResponse response) throws Exception; // 관리자 페이지 식당 댓글 없애ㄱ;ㅣ
	public boolean deleteqna(HttpServletRequest request, HttpServletResponse response) throws Exception; // 관리자 페이지 QnA 댓글 없애ㄱ;ㅣ
	public boolean deleteparty(HttpServletRequest request, HttpServletResponse response) throws Exception; // 관리자 페이지 QnA 댓글 없애ㄱ;ㅣ
	public boolean deletereview(HttpServletRequest request, HttpServletResponse response) throws Exception; // 관리자 페이지 QnA 댓글 없애ㄱ;ㅣ
	public boolean deleterestau(HttpServletRequest request, HttpServletResponse response) throws Exception; // 관리자 페이지 QnA 댓글 없애ㄱ;ㅣ

}

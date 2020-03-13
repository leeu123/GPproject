package controll; //db�������� ó�� -> �������� ����


import java.time.LocalDate;
import java.util.ArrayList;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.MemberDTO;
import model.Action;
import party.partyAction;
import restaurant.restauAction;
import vo.BoardBean;
import vo.DTO_AD;
import vo.PageInfo;
import vo.ReviewBean;
import vo.reservationDTO;
import party.PartyDTO;
import party.ApplyDTO;
import party.Preview;
import resdat.resdatDTO;

public class partyService implements partyCommandInter {
	static partyService impl = new partyService();

	public static partyService instance() {
		return impl;

	}

	@Override
	public String inseParty(HttpServletRequest request, HttpServletResponse response) throws Exception {  // 파티 등록하기
		try {
			PartyDTO PartyDTO = new PartyDTO();

			String realFolder = "";
			String saveFolder = "/party";
			int fileSize = 5 * 1024 * 1024;
			ServletContext context = request.getServletContext();
			realFolder = context.getRealPath(saveFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());
			PartyDTO.setTitle(multi.getParameter("title"));
			PartyDTO.setId(multi.getParameter("id"));
			PartyDTO.setNick(multi.getParameter("nick"));
			PartyDTO.setEmail(multi.getParameter("email"));
			PartyDTO.setPhone(multi.getParameter("phone"));
			PartyDTO.setCate(multi.getParameter("cate"));
			PartyDTO.setRname(multi.getParameter("rname"));
			PartyDTO.setRfile(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			
			PartyDTO.setAddno(multi.getParameter("addno"));
			PartyDTO.setAddr(multi.getParameter("addr"));
			PartyDTO.setAddr1(multi.getParameter("addr1"));
			PartyDTO.setAddr2(multi.getParameter("addr2"));
			
			PartyDTO.setPdate(multi.getParameter("pdate"));
			PartyDTO.setPtime(multi.getParameter("hour")+"시"+multi.getParameter("minu")+"분");
			
			PartyDTO.setSins(LocalDate.of(Integer.parseInt("20"+multi.getParameter("pdate").substring(0, 2)), Integer.parseInt(multi.getParameter("pdate").substring(2, 4)), Integer.parseInt(multi.getParameter("pdate").substring(4, 6))).minusDays(11).toString());
			PartyDTO.setSinf(LocalDate.of(Integer.parseInt("20"+multi.getParameter("pdate").substring(0, 2)), Integer.parseInt(multi.getParameter("pdate").substring(2, 4)), Integer.parseInt(multi.getParameter("pdate").substring(4, 6))).minusDays(1).toString());
			//입력받은 파티 날짜에서 -11과 -1을 한 후 파티신청 시작 날짜와 종료 날짜를 입력
		     System.out.println();
			
			PartyDTO.setPno(multi.getParameter("pno"));
			PartyDTO.setPreprice(multi.getParameter("preprice"));
			PartyDTO.setPtalk(multi.getParameter("ptalk"));
			partyAction model = partyAction.instance();
			model.insertParty(PartyDTO);

		} catch (Exception e) {
			System.out.println(e);
		}

		return "party.jsp";
	}
	
	@Override
	public String selelistParty(HttpServletRequest request, HttpServletResponse response) throws Exception {  // 진행중인 파티 category 별로 나올 수 있도록 파티 불러오기
		try{
		partyAction model = partyAction.instance();
	    ArrayList<PartyDTO> list = (ArrayList<PartyDTO>) model.selectlistParty(request.getParameter("cate"));
		if(list.size()!=0) {
		request.setAttribute("list", list);
		return "partycate.jsp";}
		else {
			return "noparty.jsp";
		}
		}
		catch(Exception e) {
			System.out.println(e);
			return "noparty.jsp";
		}
		
	}
	
	@Override
	public String seleParty(HttpServletRequest request, HttpServletResponse response) throws Exception { // 파티 번호로 파티 불러오기 
		try{partyAction model = partyAction.instance();
	    ArrayList<PartyDTO> sic = (ArrayList<PartyDTO>) model.selectParty(Integer.parseInt(request.getParameter("pnum")));
		if(sic.size()!=0) {request.setAttribute("sic", sic);
		return "party_info.jsp";}
		else {
			return "noparty.jsp";
		}}
		catch(Exception e) {
			System.out.println(e);
			return "noparty.jsp";
		}
	}
	
	@Override
	public String selelistPartyre(HttpServletRequest request, HttpServletResponse response) throws Exception {  // 완료된 파티 category 별로 나올 수 있도록 파티 불러오기
		try{partyAction model = partyAction.instance();
		
	    ArrayList<PartyDTO> list = (ArrayList<PartyDTO>) model.selectlistPartyre(request.getParameter("cate"));
		if(list.size()!=0) {request.setAttribute("list", list);
		return "partycatere.jsp";}
		else {
			return "noparty.jsp";
		}
		}
		catch(Exception e) {
			System.out.println(e);
			return "noparty.jsp";
		}
		
	}
	
	@Override
	public String selePartyre(HttpServletRequest request, HttpServletResponse response) throws Exception { // 파티 번호로 파티 불러오기 
		try{partyAction model = partyAction.instance();
	    ArrayList<PartyDTO> sic = (ArrayList<PartyDTO>) model.selectPartyre(Integer.parseInt(request.getParameter("pnum")));
		if(sic.size()!=0) {request.setAttribute("sic", sic);
		return "party_infore.jsp";}
		else {
			return "noparty.jsp";
		}}
		catch(Exception e) {
			System.out.println(e);
			return "noparty.jsp";
		}
	}
	
	@Override
	public boolean insePreview(HttpServletRequest request, HttpServletResponse response) throws Exception { //완료된 파티 번호 별로 댓글 달기
		try {
			Preview Preview = new Preview();
            Preview.setPnum(Integer.parseInt(request.getParameter("pnum")));
            Preview.setId(request.getParameter("id"));
            Preview.setNick(request.getParameter("nick"));
            Preview.setRcontent(request.getParameter("rcontent"));
            
            
            System.out.println(request.getParameter("pnum"));
            System.out.println(request.getParameter("id"));
            System.out.println(request.getParameter("nick"));
            System.out.println(request.getParameter("rcontent"));
            
			partyAction model = partyAction.instance();
			model.insertPreview(Preview);

		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		return true;
	}
	
	@Override
	public ArrayList<Preview> selelistPreview(HttpServletRequest request, HttpServletResponse response){  // 파티 후기 댓글 불러오기
		try{partyAction model = partyAction.instance();
	    ArrayList<Preview> list = (ArrayList<Preview>) model.selectlistPreview(Integer.parseInt(request.getParameter("pnum")));
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public String inseApply(HttpServletRequest request, HttpServletResponse response) throws Exception {  // 파티 신청 정보 입력
		try {
			ApplyDTO ApplyDTO = new ApplyDTO();
			ApplyDTO.setPnum(Integer.parseInt(request.getParameter("pnum")));
			ApplyDTO.setId(request.getParameter("id"));
			partyAction model = partyAction.instance();
			model.insertApply(ApplyDTO);
			

		} catch (Exception e) {
			System.out.println(e);
		}

		return "apply_success.jsp";
	}
	
	@Override
	public boolean seleApply(HttpServletRequest request, HttpServletResponse response){ // 이미 신청한 파티인지 확인하는 메소드
		try{
			ApplyDTO adto = new ApplyDTO();
			adto.setPnum(Integer.parseInt(request.getParameter("pnum")));
			adto.setId(request.getParameter("id"));
			partyAction model = partyAction.instance();
	        boolean tf = model.selectApply(adto);
	    if(tf) {
	    return true;
	    }
	    else {
	    	return false;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
	}
	
	
	@Override
	public ArrayList<resdatDTO> selelistmasjip(HttpServletRequest request, HttpServletResponse response){  // 평점 순 베스트 10 식당까지 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjip();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipkor(HttpServletRequest request, HttpServletResponse response){  // 한식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipkor();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipchn(HttpServletRequest request, HttpServletResponse response){  // 중식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipchn();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipjpn(HttpServletRequest request, HttpServletResponse response){  // 일식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipjpn();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipwest(HttpServletRequest request, HttpServletResponse response){  // 양식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipwest();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipwhat(HttpServletRequest request, HttpServletResponse response){  // 세계음식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipwhat();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipworld(HttpServletRequest request, HttpServletResponse response){  // 중식 평점 순 베스트 10 고르는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<resdatDTO> list = (ArrayList<resdatDTO>)model.selectlistmasjipworld();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	
	
	@Override
	public DTO_AD seleRestau(HttpServletRequest request, HttpServletResponse response){ // 평점순 식당번호에 맞는 식당정보 찾아오는 메소드
		try{restauAction model = restauAction.instance();
	    DTO_AD list = (DTO_AD)model.selectRestau(Integer.parseInt(request.getAttribute("rnum").toString()));
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	
	@Override
	public resdatDTO seleResdat(HttpServletRequest request, HttpServletResponse response){ // 평점순 식당번호에 맞는 식당정보 찾아오는 메소드
		try{restauAction model = restauAction.instance();
	    resdatDTO list = (resdatDTO)model.selectResdat(Integer.parseInt(request.getAttribute("rnum").toString()));
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	
	@Override
	public int seleApplycount(HttpServletRequest request, HttpServletResponse response){ //현재 신청명수 뽑아오기
		try{
			partyAction model = partyAction.instance();
	        int Apply_count = model.selectApplycount(Integer.parseInt(request.getAttribute("pnum").toString()));
	    if(Apply_count!=0) {
	    return Apply_count;
	    }
	    else {
	    	return 0;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return 0;
		}
		
	}
	
	@Override
	public boolean Applyable(HttpServletRequest request, HttpServletResponse response){  // 파티신청기간에 맞는지 확인하는 메소드
		try{
			partyAction model = partyAction.instance();
			System.out.println(request.getAttribute("pnum"));
	        boolean applyable = model.Applyable(Integer.parseInt(request.getAttribute("pnum").toString()));
	    if(applyable) {
	    return true;
	    }

		}
		catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	
	@Override
	public ArrayList<DTO_AD> seleViewtop(HttpServletRequest request, HttpServletResponse response){  // 조회수 순 top 10 뽑아내는 메소드
		try{restauAction model = restauAction.instance(); 
	    ArrayList<DTO_AD> list = (ArrayList<DTO_AD>)model.selectViewtop();
	    if(list != null) {
	    return list;
	    }
	    else {
	    	return null;
	    }
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	@Override
	public String navsearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("navsearch시작");
		request.setCharacterEncoding("UTF-8");
        String [] navloca = request.getParameterValues("location");
        String [] navtype = request.getParameterValues("type");
        String [] navprice = request.getParameterValues("price");
         
        
       DTO_AD dtoad = new DTO_AD();
       dtoad.setNavloca(navloca);
       dtoad.setNavtype(navtype);
       dtoad.setNavprice(navprice);
    
       String [] t1 = dtoad.getNavloca();
       for (int i = 0; i < t1.length; i++) {
		System.out.println(t1[i]);
	   }
       
       int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		
		int startrow=(page-1)*10;
		System.out.println("startrow="+startrow);
		dtoad.setStartpage(startrow);
		
		restauAction model = restauAction.instance();
		            
		ArrayList<DTO_AD> count=(ArrayList<DTO_AD>) model.navlistcount(dtoad);
		int listCount = count.size();
		ArrayList<DTO_AD> list = (ArrayList<DTO_AD>) model.navsearch(dtoad);
		
		System.out.println(listCount);
       
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		System.out.println("startPage="+startPage);
   	    int endPage = startPage+10-1;
   	    System.out.println("endPage="+endPage);
   	 System.out.println("listCount="+listCount);
     System.out.println("maxPage="+maxPage);
     System.out.println("page="+page);
     System.out.println("statPage="+startPage);

   	        
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		
		
	    if(list.size()!=0) {
		request.setAttribute("articleList", list);
		request.setAttribute("navloca", navloca);
		request.setAttribute("navtype", navtype);
		request.setAttribute("navprice", navprice);
		System.out.println("bb" + list.size());
		System.out.println("navsearch끝");
		return "searchpage.jsp";
		}
	    else {
			return "nosearch.jsp";
		}
	}

	@Override
	public String navsearch2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("navsearch시작");
		
		request.setCharacterEncoding("UTF-8");
		//session타입의 변수를 생성해서 값을 받아와야한다.
		HttpSession session = request.getSession();
		String [] navloca =  (String [])session.getAttribute("navloca");
		String [] navtype =  (String [])session.getAttribute("navtype");
		String [] navprice = (String [] )session.getAttribute("navprice");
         
        
       DTO_AD dtoad = new DTO_AD();
       dtoad.setNavloca(navloca);
       dtoad.setNavtype(navtype);
       dtoad.setNavprice(navprice);
    
       String [] t1 = dtoad.getNavloca();
       for (int i = 0; i < t1.length; i++) {
		System.out.println(t1[i]);
	   }
       
       int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		
		int startrow=(page-1)*10;
		System.out.println("startrow="+startrow);
		dtoad.setStartpage(startrow);
		
		restauAction model = restauAction.instance();
		            
		ArrayList<DTO_AD> count=(ArrayList<DTO_AD>) model.navlistcount(dtoad);
		int listCount = count.size();
		ArrayList<DTO_AD> list = (ArrayList<DTO_AD>) model.navsearch(dtoad);
		
		System.out.println(listCount);
       
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		System.out.println("startPage="+startPage);
   	    int endPage = startPage+10-1;
   	    System.out.println("endPage="+endPage);
   	 System.out.println("listCount="+listCount);
     System.out.println("maxPage="+maxPage);
     System.out.println("page="+page);
     System.out.println("statPage="+startPage);

   	        
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		
		
	    if(list.size()!=0) {
		request.setAttribute("articleList", list);
		request.setAttribute("navloca", navloca);
		request.setAttribute("navtype", navtype);
		request.setAttribute("navprice", navprice);
		System.out.println("bb" + list.size());
		System.out.println("navsearch끝");
		return "searchpage.jsp";
		}
	    else {
			return "nosearch.jsp";
		}
	}
	
	@Override
	public String reservation(HttpServletRequest request, HttpServletResponse response) throws Exception { // 식당 예약하기
		try {
			reservationDTO rsdto = new reservationDTO();
			System.out.println(request.getParameter("rnum"));
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("resdate"));
			System.out.println(request.getParameter("hour") + request.getParameter("minu"));

			rsdto.setRnum(Integer.parseInt(request.getParameter("rnum")));
			rsdto.setId(request.getParameter("id"));
			rsdto.setResdate(request.getParameter("resdate"));
			rsdto.setRestime(request.getParameter("hour") + "시" + request.getParameter("minu") + "분");

			partyAction model = partyAction.instance();
			model.reservation(rsdto);

		} catch (Exception e) {
			System.out.println(e);
			return "restaurantDetail.bo?rnum=" + request.getParameter("rnum");
		}
		return "restaurantDetail.bo?rnum=" + request.getParameter("rnum");
	}

	@Override
	public reservationDTO checkReser(HttpServletRequest request, HttpServletResponse response) throws Exception { // 예약가능한지
																													// 확인
		try {
			int rnum = (int) request.getAttribute("rnum");
			String id = (String) request.getAttribute("id");

			reservationDTO rsdto = new reservationDTO();

			rsdto.setRnum(rnum);
			rsdto.setId(id);

			reservationDTO rsrs = null;
			partyAction model = partyAction.instance();
			rsrs = model.cheres(rsdto);

			if (rsrs != null) {
				return rsrs;
			}
			return rsrs;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	@Override
	public boolean rescancel(HttpServletRequest request, HttpServletResponse response) throws Exception { // 예약취손
		try {
			System.out.println("취소까지 도착");
			int rnum = (int) request.getAttribute("rnum");
			String id = (String) request.getAttribute("id");

			reservationDTO rsdto = new reservationDTO();

			rsdto.setId(id);
			rsdto.setRnum(rnum);

			partyAction model = partyAction.instance();
			boolean s = model.cancel(rsdto);

			if (s) {
				return false;
			}
			return true;

		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}
	
	@Override
	public String searchbar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("searchbar시작");
		request.setCharacterEncoding("UTF-8");
        String keyword = request.getParameter("keyword_searchbar");
        System.out.println(keyword);
        
       DTO_AD dtoad = new DTO_AD();
       dtoad.setKeyword(keyword);
		System.out.println(dtoad.getKeyword());
	
       
       int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("page")==null){
			page=1;
		}
		Action model = Action.instance();
		ArrayList<DTO_AD> list = (ArrayList<DTO_AD>) model.searchbar(dtoad);
		int listCount=list.size();
		System.out.println(listCount);
       
		int maxPage=(int)((double)listCount/limit+0.95); //0.95�� ���ؼ� �ø� ó��.
   		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//���� �������� ������ ������ ������ ��.(10, 20, 30 ��...)
   	        int endPage = startPage+10-1;

   	        
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		
		
	    if(list.size()!=0) {
		request.setAttribute("articleList", list);
		System.out.println("bb" + list.size());
		System.out.println("searchbar끝");
		return "searchpage.jsp";
		}
	    else {
			return "nosearch.jsp";
		}
	}
	
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipseoul(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 서울 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipseoul();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipdj(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 대전 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipdj();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipgj(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 광주 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipgj();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipbs(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 부산 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipbs();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipkk(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 경기 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipkk();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipkw(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 강원 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipkw();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipcb(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 충북 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipcb();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipcn(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 충남 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipcn();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public MemberDTO member(HttpServletRequest request, HttpServletResponse response) throws Exception { // 마이페이지 회원 정보 들고오긴
																												
		try {
			partyAction model = partyAction.instance();
			
			MemberDTO mb =  model.member(request.getAttribute("id").toString());
			
			
			if(mb!=null) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<ReviewBean> review(HttpServletRequest request, HttpServletResponse response) throws Exception { // 작성한 리뷰 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<ReviewBean> mb =  (ArrayList<ReviewBean>)model.review(request.getAttribute("id").toString());
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<PartyDTO> party(HttpServletRequest request, HttpServletResponse response) throws Exception { // 신청한 파티 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<PartyDTO> mb =  (ArrayList<PartyDTO>)model.party(request.getAttribute("id").toString());
			
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<PartyDTO> party1(HttpServletRequest request, HttpServletResponse response) throws Exception { // 신청한 파티 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<PartyDTO> mb =  (ArrayList<PartyDTO>)model.party1(request.getAttribute("id").toString());
			
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	
	
	@Override
	public ArrayList<BoardBean> QnA(HttpServletRequest request, HttpServletResponse response) throws Exception { // 작성한 Q_A 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<BoardBean> mb =  (ArrayList<BoardBean>)model.QnA(request.getAttribute("id").toString());
			
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<PartyDTO> apparty(HttpServletRequest request, HttpServletResponse response) throws Exception { // 신청한 파티 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<PartyDTO> mb =  (ArrayList<PartyDTO>)model.apparty(request.getAttribute("id").toString());
			
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	
	@Override
	public ArrayList<resdatDTO> resdat(HttpServletRequest request, HttpServletResponse response) throws Exception { // 신청한 파티 정보 들고 오기
																												
		try {
			partyAction model = partyAction.instance();
			
			ArrayList<resdatDTO> mb =  (ArrayList<resdatDTO>)model.resdat(request.getAttribute("id").toString());
			
			
			if(mb.size()!=0) {
				return mb;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	@Override
	public ArrayList<resdatDTO> selelistmasjipic(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 인천 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipic();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipsj(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 세종 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipsj();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipus(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 울산 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipus();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipkn(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 경남 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipkn();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipkb(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 경북 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipkb();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipdg(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 대구 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipdg();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipjn(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 전남 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipjn();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipjb(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 전북 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipjb();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	@Override
	public ArrayList<resdatDTO> selelistmasjipjj(HttpServletRequest request, HttpServletResponse response)  throws Exception { // 제주 맛집 베스트 10
		try {
			restauAction model = restauAction.instance();
			ArrayList<resdatDTO> list = (ArrayList<resdatDTO>) model.selectlistmasjipjj();
			if (list != null) {
				return list;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	
	
	
	
	
	
	
	
	

}

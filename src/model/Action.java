package model; //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏟스뤄옙 占쏙옙占쏙옙


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.DTO_AD;
import mybatis.SqlMapConfig;


public class Action {
	
	static Action model = new Action();
	public static Action instance(){
		return model;
	}


	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();


public List<DTO_AD> searchbar(DTO_AD dtoad){
	System.out.println("action�룄李�");
	List<DTO_AD> list = null;
	SqlSession sqlSession = factory.openSession();
	list = sqlSession.selectList("searchbar",dtoad);
	for (int i = 0; i < list.size(); i++) {
		System.out.println(list.get(i));
	}
	System.out.println("aa"+list.size());
	System.out.println("action�걹");
	sqlSession.close();
	return list;
}

public int searchbarCount(DTO_AD dtoad){
	int list = 0;
	SqlSession sqlSession = factory.openSession();
	list = sqlSession.selectOne("searchbarCount",dtoad);
	System.out.println(list);
	sqlSession.close();
	return list;
}


}

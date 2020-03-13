package restaurant_svc;

import java.sql.Connection;
import restaurantDAO.RestaurantDAO;
import vo.DTO_AD;
import static db.JdbcUtil.*;

public class RestaurantDetailService {

	public DTO_AD getArticle(int rnum) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("2¹ø");
		DTO_AD article = null;
		Connection con = getConnection();
		RestaurantDAO restaurantDAO = RestaurantDAO.getInstance();
		restaurantDAO.setConnection(con);
		int updateCount = restaurantDAO.updateReadCount(rnum);
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = restaurantDAO.selectArticle(rnum);
		System.out.println(article.getFile());
		
		close(con);
		return article;
		
	}

}

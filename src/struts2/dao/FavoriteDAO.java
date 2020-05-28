package struts2.dao;

public interface FavoriteDAO {
	public int addFavorite(int house_id,int user_id) throws Exception;
	public int ifInFavorite(int house_id,int user_id) throws Exception;
}

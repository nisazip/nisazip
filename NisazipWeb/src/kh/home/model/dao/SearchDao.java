package kh.home.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class SearchDao {
	private Properties prop;
	
	public SearchDao(){
		prop = new Properties();
		
		String fileName = RoomDao.class.getResource("/config/home/home-query.properties").getPath();
	
		try{
			prop.load(new FileReader(fileName));
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
//	public ArrayList<Room> searchRoom(Connection con, String )
}

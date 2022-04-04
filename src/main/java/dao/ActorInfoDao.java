package dao;

import java.sql.Connection;
import java.util.List;

import util.DBUtil;
import vo.ActorInfo;

public class ActorInfoDao {
	public List<ActorInfo> selectActorUnfoListByPage(int beginRow, int rowPage) {
		connection conn = null;
		conn  = DBUtil.getConnection();
		String sql = 
		return List;
	}
}

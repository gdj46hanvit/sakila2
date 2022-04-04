package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import vo.ActorInfo;
public class ActorInfoDao {
	public List<ActorInfo> selectActorInfoListByPage(int beginRow, int rowPerPage){
		List<ActorInfo> list = new ArrayList<>();
		//데이터베이스 자원준비
		Connection conn =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//static 으로 바꿨기때문에 DBUtil = dbutil(); 객체 생성하지 않아도 된다.
		conn = DBUtil.getConnection(); // DBUtil 내에 DB연결 호출
		String sql = "select actor_id actorId, first_name firstName, last_name lastName, film_info filmInfo  from actor_info order By actor_id limit ?,?";
		try {
			stmt = conn.prepareStatement(sql);
			System.out.println("sql selectActionInfoListByPage : " + stmt);	//디버깅
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			while(rs.next()) {
				ActorInfo a = new ActorInfo();
				a.setActorId(rs.getInt("actorId"));
				a.setFirstName(rs.getString("firstName"));
				a.setLastName(rs.getString("lastName"));
				a.setFilmInfo(rs.getString("filmInfo"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
			rs.close();
			stmt.close();
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	// 총합 및 마지막 페이지
	public int Row() {
		int Row =0; //전체 행의 수 변수 초기화
		//DB자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		//DB연결
		conn = DBUtil.getConnection();
		//쿼리문 작성
		String sql ="select count(*) cnt from actor_info";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				Row = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("예외발생"); // 디봐 
		}finally {
			try {
				//데이터자원반납
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return Row; //전체 행의 수 리턴
	}
}
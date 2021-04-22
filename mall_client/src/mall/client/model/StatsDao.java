package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mall.client.commons.DBUtil;
import mall.client.vo.Stats;

public class StatsDao {
	private DBUtil dbutil;
	// 오늘 방문객
	public Stats selectStatsByToday() {
		// 초기화
		this.dbutil = new DBUtil();
		Stats stats = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// DB
		try {
			String sql = "SELECT stats_day statsDay, stats_count statsCount FROM stats WHERE stats_day=DATE(NOW())";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				stats = new Stats();
				stats.setStatsDay(rs.getString("statsDay"));
				stats.setStatsCount(rs.getLong("statsCount"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(rs, stmt, conn);
		}
		return stats;
	}
	// 오늘날자의 카운트가 없으면 1을 입력
	public void insertStats() {
		// 초기화
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;

		// DB
		try {
			String sql = "INSERT INTO stats(stats_day, stats_count) VALUES(DATE(NOW()), 1)";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(null, stmt, conn);
		}
		
	}
	// 오늘날자의 카운트가 있으면 +1을 업데이트
	public void updateStats() {
		// 초기화
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "UPDATE stats SET stats_count = stats_count+1 WHERE stats_day = DATE(NOW())";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(null, stmt, conn);
		}
		
	}
	// 전체 방문객
	public long selectStatsTotal() {
		// 초기화
		this.dbutil = new DBUtil();
		long total = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql ="SELECT SUM(stats_count) total FROM stats";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getLong("total");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(rs, stmt, conn);
		}
		return total;
	}
}

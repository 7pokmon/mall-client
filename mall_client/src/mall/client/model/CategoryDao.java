package mall.client.model;

import mall.client.commons.DBUtil;
import java.util.*;
import mall.client.vo.*;
import java.sql.*;

public class CategoryDao {
	private DBUtil dbUtil;
	// 카테고리목록
	public List<String> categoryList() {
		// 초기화
		List<String> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// DB
		try {
			String sql = "SELECT category_name categoryName FROM category";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			// 디버깅
			System.out.println(stmt+"<- 카테고리목록stmt");
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String categoryName = rs.getString("categoryName");
				list.add(categoryName);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
	
}

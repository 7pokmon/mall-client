package mall.client.model;

import java.sql.*;
import java.util.*;
import mall.client.commons.DBUtil;

public class CartDao {
	private DBUtil dbUtil;
	
	public List<Map<String, Object>> selectCartList() {
		this.dbUtil = new DBUtil();
		List<Map<String, Object>> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		/*
		 * 
		 * SELECT
			c.cart_no, 
			e.ebook_no, 
			e.ebook_title, 
			c.cart_date
			FROM cart c INNER JOIN ebook e
			ON c.ebook_no = e.ebook_no
		 * 
		 */
		try {
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("cartNo", rs.getInt("cartNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("cartDate", rs.getString("cartDate"));
				list.add(map);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return list;
	}
}
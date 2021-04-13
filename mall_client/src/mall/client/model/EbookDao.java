package mall.client.model;

import java.sql.*;
import java.util.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class EbookDao {
	private DBUtil dbutil; 
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage) {
		List<Ebook> list = new ArrayList<>();
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
		String sql = "SELECT ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
		conn = this.dbutil.getConnection();
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			Ebook ebook = new Ebook();
			ebook.setEbookTitle(rs.getString("ebookTitle"));
			ebook.setEbookPrice(rs.getInt("ebookPrice"));
			ebook.setEbookImg(rs.getString("ebookImg"));
			list.add(ebook);
		}
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 마지막은 finally 실행
			this.dbutil.close(rs, stmt, conn);
		}
		
		return list;
	}
}

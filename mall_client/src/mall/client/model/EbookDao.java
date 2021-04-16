package mall.client.model;

import java.sql.*;
import java.util.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class EbookDao {
	private DBUtil dbutil; 
	
	// 검색어별 전체페이지
	public int searchTotalCount(String searchWord) {
		// 초기화
		int totalCnt = 0;
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// DB
		try {
			String sql = "SELECT COUNT(*) cnt FROM ebook WHERE ebook_title LIKE ?";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%");
			
			// 디버깅
			System.out.println(stmt+"<--검색어별 전체페이지");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
				System.out.println("검색어totalCnt : "+ totalCnt);
			}

		} catch(Exception e) {
			e.printStackTrace();
 		} finally {
 			dbutil.close(rs, stmt, conn);
 		}
		
		return totalCnt;
	}
	
	// 카테고리별 전체페이지
	public int totalCount(String categoryName) {
		// 초기화
		int totalCnt = 0;
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// DB
		try {
			if(categoryName.equals("")) { // 전체목록 페이지
				String sql = "SELECT COUNT(*) cnt FROM ebook";
				conn = this.dbutil.getConnection();
				stmt = conn.prepareStatement(sql);
			} else { // 카테고리별 페이지
				String sql = "SELECT COUNT(*) cnt FROM ebook WHERE category_name=?";
				conn = this.dbutil.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryName);
			}
			
			// 디버깅
			System.out.println(stmt+"<--카테고리별 전체페이지");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
				System.out.println("totalCnt : "+ totalCnt);
			}

		} catch(Exception e) {
			e.printStackTrace();
 		} finally {
 			dbutil.close(rs, stmt, conn);
 		}
		
		return totalCnt;
	}
	
	// ebook상세보기
	public Ebook selectEbookOne(int ebookNo) {
		// 초기화
		this.dbutil = new DBUtil();
		Ebook ebook = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_company ebookCompany, ebook_page_count ebookPageCount, ebook_price ebookPrice, ebook_img ebookImg, ebook_summary ebookSummary, ebook_date ebookDate,ebook_state ebookState FROM ebook WHERE ebook_no=?";;
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ebookNo);
			//디버깅
			System.out.println(stmt + "<--Ebook상세보기");
			rs = stmt.executeQuery();
			if (rs.next()) {
				ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setCategoryName(rs.getString("categoryName"));
				ebook.setEbookISBN(rs.getString("ebookISBN"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookAuthor(rs.getString("ebookAuthor"));
				ebook.setEbookCompany(rs.getString("ebookCompany"));
				ebook.setEbookPageCount(rs.getInt("ebookPageCount"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				ebook.setEbookSummary(rs.getString("ebookSummary"));
				ebook.setEbookImg(rs.getString("ebookImg"));
				ebook.setEbookDate(rs.getString("ebookDate"));
				ebook.setEbookState(rs.getString("ebookState"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(rs, stmt, conn);
		}
		return ebook;
	}
	
	// 카테고리별 목록
	public List<Ebook> selectCategoryByPage(int beginRow, int rowPerPage, String categoryName) {
		// 초기화
		this.dbutil = new DBUtil();
		List<Ebook> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
		// 조건에맞는 쿼리생성
		if(categoryName.equals("")) { // 전체목록
			sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
		} else { // 카테고리 선택시 목록
			sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook WHERE category_name like ? ORDER BY ebook_date DESC LIMIT ?,?";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, categoryName);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
		}
		
		//디버깅
		System.out.println(stmt + "<--Ebook목록,검색어 동적쿼리");
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			Ebook ebook = new Ebook();
			ebook.setEbookNo(rs.getInt("ebookNo"));
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
	
	// 검색어별 목록
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage, String searchWord) {
		// 초기화
		this.dbutil = new DBUtil();
		List<Ebook> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// like연산자 통해 연관된 검색어 찾기
			String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook WHERE ebook_title like ? ORDER BY ebook_date DESC LIMIT ?,?";
			conn = this.dbutil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+searchWord+"%"); // like
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
			//디버깅
			System.out.println(stmt + "<--Ebook목록,검색어");
			rs = stmt.executeQuery();
		
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
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

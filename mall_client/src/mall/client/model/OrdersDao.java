package mall.client.model;

import java.sql.*;
import java.util.*;

import mall.client.commons.DBUtil;
import mall.client.vo.Client;
import mall.client.vo.Orders;

public class OrdersDao {
	private DBUtil dbUtil;
	
	// 페이징
	public int totalCount(Client client) {
		// 초기화
		int totalCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// DB
		try {
			String sql = "SELECT COUNT(*) cnt FROM orders WHERE client_no=?";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, client.getClientNo());
			// 디버깅
			System.out.println(stmt+"<-- 주문페이징stmt");
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
				System.out.println("검색어totalCnt : "+ totalCnt);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		
		return totalCnt;
	}
	
	// 주문리스트
	public List<Map<String, Object>> selectOrderListByClient(int beginRow, int rowPerPage, int clientNo) {
		// 초기화
		List<Map<String, Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// DB
		try {
			/*
			 *  SELECT
			 *  	o.orders_no ordersNo,
			 *  	o.ebook_no ebookNo,
			 *  	o.orders_date ordersDate,
			 *  	o.orders_state ordersState,
			 *  	e.ebook_title ebookTitle,
			 *  	e.ebook_price ebookPrice
			 *  FROM orders o INNER JOIN ebook e
			 *  On o.ebook_no = e.ebook_no
			 *  WHERE o.client_no = ?
			 */
			String sql = "SELECT o.orders_no ordersNo, o.ebook_no ebookNo, o.orders_date ordersDate,o.orders_state ordersState, e.ebook_title ebookTitle, e.ebook_price ebookPrice FROM orders o INNER JOIN ebook e On o.ebook_no = e.ebook_no WHERE o.client_no=? LIMIT ?,?";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, clientNo);
			stmt.setInt(2, beginRow);
			stmt.setInt(3, rowPerPage);
			// 디버깅
			System.out.println(stmt+"<-- 주문리스트stmt");
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("ordersNo", rs.getInt("ordersNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ordersDate", rs.getString("ordersDate"));
				map.put("ordersState", rs.getString("ordersState"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("ebookPrice", rs.getInt("ebookPrice"));
				list.add(map);
			}
			
		} catch(Exception e) {
			e.printStackTrace(); // 예외발생시 시스템을 멈추고 함수호출스택구조를 콘솔에 출력
		} finally {
			dbUtil.close(rs, stmt, conn);
		}
		return list;
	}
	
	// 상품주문
	public int insertOrders(Orders orders) {
		// 초기화
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		
		// DB
		try {
			String sql = "INSERT INTO orders(ebook_no, client_no, orders_date, orders_state) VALUES(?,?,NOW(),'주문완료')";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orders.getEbookNo());
			stmt.setInt(2, orders.getClientNo());
			// 디버깅
			System.out.println(stmt+"<-- 상품주문stmt");
			rowCnt = stmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace(); // 예외발생시 시스템을 멈추고 함수호출스택구조를 콘솔에 출력
		} finally {
			dbUtil.close(null, stmt, conn);
		}
		
		
		return rowCnt;
	}
}

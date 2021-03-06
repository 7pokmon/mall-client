

package mall.client.model;

import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.Client;

public class ClientDao {
	private DBUtil dbUtil;

	// 회원탈퇴
	public int deleteClient(String clientMail) {
		// 초기화
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		// DB
		try {
			conn = this.dbUtil.getConnection();
			String sql = "DELETE FROM client WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			// 디버깅
			System.out.println(stmt + "<--회원탈퇴");
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}
		return rowCnt;
	}

	// 비밀번호 수정
	public int updateClientPw(Client client) {
		// 초기화
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		// DB
		try {
			conn = this.dbUtil.getConnection();
			String sql = "UPDATE client SET client_pw=PASSWORD(?) WHERE client_mail=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientPw());
			stmt.setString(2, client.getClientMail());
			// 디버깅
			System.out.println(stmt + "<--비밀번호 수정");
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}
		return rowCnt;
	}

	// 회원정보
	public Client clientOne(String clientMail) {
		// 초기화
		Client client = null;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// sql
			String sql = "SELECT client_no clientNo, client_mail clientMail, client_date clientDate FROM client WHERE client_mail=?";
			// DB
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			// 디버깅
			System.out.println(stmt + "<--회원정보");
			rs = stmt.executeQuery();

			if (rs.next()) {
				client = new Client();
				client.setClientNo(rs.getInt("clientNo"));
				client.setClientMail(rs.getString("clientMail"));
				client.setClientDate(rs.getString("clientDate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}

		return client;
	}

	// 이메일 중복검사
	public String selectClientMail(String clientMail) {
		// 초기화
		String returnClientMail = null;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// sql
			String sql = "SELECT client_mail FROM client WHERE client_mail=?";
			// DB
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			// 디버깅
			System.out.println(stmt + "<--이메일 중복검사");
			rs = stmt.executeQuery();

			if (rs.next()) {
				returnClientMail = rs.getString("client_mail");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}

		return returnClientMail;
	}

	// 회원가입
	public int insertClient(Client client) {
		// 초기화
		int rowCnt = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// sql
			String sql = "INSERT INTO client(client_mail,client_pw,client_date) VALUES(?,PASSWORD(?),now())";
			// DB
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			// 디버깅
			System.out.println(stmt + "<--회원가입");
			stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(null, stmt, conn);
		}

		return rowCnt;
	}

	// 로그인
	public Client login(Client client) {
		this.dbUtil = new DBUtil();

		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT client_no clientNo, client_mail clientMail FROM client WHERE client_mail=? AND client_pw=PASSWORD(?) ";
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			// 디버깅
			System.out.println(stmt + "<--로그인");
			rs = stmt.executeQuery();
			if (rs.next()) {
				returnClient = new Client();
				returnClient.setClientNo(rs.getInt("clientNo"));
				returnClient.setClientMail(rs.getString("clientMail"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(rs, stmt, conn);
		}
		return returnClient;
	}
}

package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ict.db.DAO;

public class DAO {
		Connection conn;
		PreparedStatement pstm;
		ResultSet rs; // select문의 결과
		
		// 싱글턴
		private static DAO dao = new DAO();
		public static DAO getInstance() {
			return dao;
		}
		
		// DB 접속
		public Connection getConnection() {
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				String url = "jdbc:oracle:thin:@192.168.0.24:1521:xe";
				String user = "C##kdh";
				String password = "1234";
				conn = DriverManager.getConnection(url, user, password);
				return conn;
			} catch (Exception e) {
				System.out.println(e);
			} 
			return null;
		}
		
		// list
		public List<VO> getSelectAll(){
			try {
				List<VO> list = new ArrayList<VO>();
				conn = getConnection();
				String sql = "select * from guestbook3 order by idx";
				pstm = conn.prepareStatement(sql);
				rs = pstm.executeQuery();
				while(rs.next()) {
					VO vo = new VO();
					vo.setIdx(rs.getString("idx"));
					vo.setName(rs.getString("name"));
					vo.setSubject(rs.getString("subject"));
					vo.setContent(rs.getString("content"));
					vo.setEmail(rs.getString("email"));
					vo.setPwd(rs.getString("pwd"));
					vo.setF_name(rs.getString("f_name"));
					vo.setRegdate(rs.getString("regdate"));
					list.add(vo);
					
				}
				return list;
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					rs.close();
					pstm.close();
					conn.close();
				} catch (Exception e2) {
				}
			}
			return null;
		}
		
		// insert
		public int getInsert(VO vo) {
			System.out.println(vo);
			try {
				int result = 0;
				conn = getConnection();
				String sql = "insert into guestbook3 VALUES(guestbook3_seq.nextval,?,?,?,?,?,?,sysdate)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, vo.getName());
				pstm.setString(2, vo.getSubject());
				pstm.setString(3, vo.getContent());
				pstm.setString(4, vo.getEmail());
				pstm.setString(5, vo.getPwd());
				pstm.setString(6, vo.getF_name());
				result = pstm.executeUpdate();
				return result;
				
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					pstm.close();
					conn.close();
				} catch (Exception e2) {
				}
			}
			return 0;
			
		}
		
		// 상세보기
		public VO getSelectOne(String idx) {
			try {
				VO vo = null;
				conn = getConnection();
				String sql = "select * from guestbook3 where idx=?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, idx);
				rs = pstm.executeQuery();
				while (rs.next()) {
					vo = new VO();
					vo.setIdx(rs.getString("idx"));
					vo.setName(rs.getString("name"));
					vo.setSubject(rs.getString("subject"));
					vo.setContent(rs.getString("content"));
					vo.setEmail(rs.getString("email"));
					vo.setPwd(rs.getString("pwd"));
					vo.setF_name(rs.getString("f_name"));
					vo.setRegdate(rs.getString("regdate"));
				}
				return vo;
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					rs.close();
					pstm.close();
					conn.close();
				} catch (Exception e2) {
				}
			}
			return null;
		}
		
		// update
		public int getUpdate(VO vo) {
			try {
				int result = 0;
				conn = getConnection();
				String sql = "update guestbook3 set name=?,subject=?,content=?,email=?, f_name=? where idx=?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, vo.getName());
				pstm.setString(2, vo.getSubject());
				pstm.setString(3, vo.getContent());
				pstm.setString(4, vo.getEmail());
				pstm.setString(5, vo.getF_name());
				pstm.setString(6, vo.getIdx());
				result = pstm.executeUpdate();
				return result;
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					pstm.close();
					conn.close();
				} catch (Exception e2) {
				}
			}
			return 0;
		}
		
		// delete
		public int getDelete(String idx) {
			try {
				int result = 0;
				conn = getConnection();
				String sql = "delete from guestbook3 where idx=?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, idx);
				result = pstm.executeUpdate();
				return result;
			} catch (Exception e) {
				System.out.println(e);
			}finally {
				try {
					
				} catch (Exception e2) {
				}
			}
			return 0;
		}
}



































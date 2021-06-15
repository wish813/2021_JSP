package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO2 {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs; // select문의 결과
	
	// 싱글턴
	private static DAO2 dao2 = new DAO2();
	public static DAO2 getInstance() {
		return dao2;
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
	
	// select => 결과가 하나이면 VO, 결과가 여러개면 List<VO>에 담는다.
		public List<VO2> getSelectAll() {
			try {
				List<VO2> list = new ArrayList<VO2>();
				
				conn = getConnection();
				String sql = "select * from guestbook order by num";
				pstm = conn.prepareStatement(sql);
					
					rs = pstm.executeQuery();
					if(rs.next()) {
						VO2 vo2 = new VO2();
						vo2.setNum(rs.getString("num"));
						vo2.setName(rs.getString("name"));
						vo2.setPw(rs.getString("title"));
						vo2.setEmail(rs.getString("email"));
						vo2.setPw(rs.getString("pw"));
						vo2.setReg(rs.getString("reg"));
						list.add(vo2);
					}
					return list;
				} catch (Exception e) {
					System.out.println(e);
				}finally {
					try {
						rs.close();
						pstm.close();
						conn.close();
					} catch (Exception e2) {
					}
				}
				return null;
			}
	
}
























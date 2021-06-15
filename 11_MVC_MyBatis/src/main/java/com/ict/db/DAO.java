package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ict.db.DAO;

public class DAO {
		// MyBatis에서는 SqlSession 클래스를 이용해서
		// mapper.xml 파일의 태그들을 사용해서 SQL을 사용한다.
		private static SqlSession ss;
		private synchronized static SqlSession getsession() {
			if(ss==null) {
				// ss = DBService.getFactory().openSession();			// select문
				// ss = DBService.getFactory().openSession(true);		// autoCommit();
				
				// 트랜젝션 처리를 위해서 수동 commit()을 하자
				ss = DBService.getFactory().openSession(false);		   // 수동Commit();
			}
			return ss;
		}
		
		// list
		// MyBatis select문은 4가지로 구분된다.
		// 1. 결과가 여러개 일때 list<VO> => selectList() 라는 메소드사용
		// 2. 결과가 하나일때 VO => selectOne() 이라는 메소드 사용
		// 3. parameter값이 없을때
		// 4. parameter값이 있을때(파라미터가 2개 이상이면 무조건 VO 아니면 Mapper를 사용해야 한다.)
		public static List<VO> getSelectAll(){
			List<VO> list = new ArrayList<VO>();
			
			// getSession().sql명령과 같은 메소드 찾기
			// list = getsession().selectList(mapper의 id); // 파라미터가 없는 메소드
			// list = getsession().selectList(mapper의 id, 파라미터); // 파라미터가 있는 메소드
			list = getsession().selectList("list");
			return list;
		}
		
		// 상세보기
		public static VO getSelectOne(String idx) {
				VO vo = null;
				vo = getsession().selectOne("onelist", idx);
				return vo;
			
		}
		
		// insert
		// insert, update, delete는
		// getSession().insert("mapper의 id", 파라미터), getSession().update(), getSession().delete()
		// insert
		public static int getInsert(VO vo) {
				int result = 0;
				result = getsession().insert("insert", vo);
				// openSession(false)를 했기 때문에 commit를 해야 된다.
				ss.commit();
				return result;
		}
		
		/*
		// 상세보기
		public VO getSelectOne(String idx) {
			try {
				VO vo = null;
				conn = getConnection();
				String sql = "select * from guestbook2 where idx=?";
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
		*/
		
		// update
		// getSession().update("mapper의 id", 파라미터)
		// insert, update, delete는 openSession(false)를 했기 때문에 commit을 해야한다.
		public static int getUpdate(VO vo) {
				int result = 0;
				result = getsession().update("update", vo);
				ss.commit();
				
				return result;
		
		}
		
		// getSession().delete("mapper의 id", 파라미터)
		// insert, update, delete는 openSession(false)를 했기 때문에 commit을 해야한다.
		public static int getDelete(VO vo) {
				int result = 0;
				result = getsession().delete("delete", vo); 
				String sql = "delete from guestbook2 where idx=?";
				ss.commit();
				return result;
			
		}
}



































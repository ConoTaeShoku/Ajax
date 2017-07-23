package global.sesoc.ajaxTest.repository;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ajaxTest.dao.commentDAO;
import global.sesoc.ajaxTest.vo.Comment;

@Repository
public class CommentRepository {

	@Autowired
	SqlSession sqlSession;

	public int insert(Comment comment) {
		commentDAO dao = sqlSession.getMapper(commentDAO.class);
		int result = 0;
		try {
			result = dao.insert(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(int num) {
		commentDAO dao = sqlSession.getMapper(commentDAO.class);
		int result = 0;
		try {
			result = dao.delete(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<Comment> list() {
		commentDAO dao = sqlSession.getMapper(commentDAO.class);
		ArrayList<Comment> clist = null;
		try {
			clist = (ArrayList<Comment>) dao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clist;
	}
}

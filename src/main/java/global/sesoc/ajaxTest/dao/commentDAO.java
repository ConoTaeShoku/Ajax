package global.sesoc.ajaxTest.dao;

import java.util.ArrayList;

import global.sesoc.ajaxTest.vo.Comment;

public interface commentDAO {

	public int insert(Comment comment) throws Exception;

	public int delete(int num) throws Exception;

	public ArrayList<Comment> list() throws Exception;
}

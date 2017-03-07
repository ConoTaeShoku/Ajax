package h.h.ajax1.dao;

import java.util.ArrayList;

import h.h.ajax1.vo.Comment;

public interface commentDAO {

	public int insert(Comment comment) throws Exception;

	public int delete(int num) throws Exception;

	public ArrayList<Comment> list() throws Exception;
}

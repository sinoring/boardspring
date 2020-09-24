package com.boardspring.example.service;

import java.util.List;

import com.boardspring.example.domain.Comment;

public interface CommentService {
	public int commentCount();
	public List<Comment> commentList() throws Exception;
	public int commentInsert(Comment comment) throws Exception;
	public int commentModify(Comment comment) throws Exception;
	public int commentDelete(int cNum) throws Exception;
}

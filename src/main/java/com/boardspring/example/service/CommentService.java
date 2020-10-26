package com.boardspring.example.service;

import java.util.List;

import com.boardspring.example.domain.Comment;

public interface CommentService {
	public List<Comment> getReplyList(int bNum) throws Exception;
	public int saveReply(Comment comment) throws Exception;
	public int updateReply(Comment comment) throws Exception;
	public int deleteReply(int cNum) throws Exception;
}

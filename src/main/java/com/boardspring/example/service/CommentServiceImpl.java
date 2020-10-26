package com.boardspring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.domain.Comment;
import com.boardspring.example.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired CommentMapper commentmapper;
	
	@Override
	public List<Comment> getReplyList(int bNum) throws Exception{
		return commentmapper.getReplyList(bNum);
	}
	
	@Override
	public int saveReply(Comment comment) throws Exception{
		return commentmapper.saveReply(comment);
	}
	
	@Override
	public int updateReply(Comment comment) throws Exception{
		return commentmapper.updateReply(comment);
	}

	@Override
	public int deleteReply(int cNum) throws Exception{
		return commentmapper.deleteReply(cNum);
	}
	
}

package com.boardspring.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.domain.Comment;
import com.boardspring.example.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {
	@Autowired CommentMapper commentmapper;
	
	@Override
	public List<Comment> commentList(int bNum) throws Exception{
		return commentmapper.commentList(bNum);
	}

	@Override
	public int commentInsert(Comment comment) throws Exception{
		return commentmapper.commentInsert(comment);
	}
	
	@Override
	public int commentModify(Comment comment) throws Exception{
		return commentmapper.commentModify(comment);
	}
	
	@Override
	public int commentDelete(int cNum) throws Exception{
		return commentmapper.commentDelete(cNum);
	}

	@Override
	public int commentCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}

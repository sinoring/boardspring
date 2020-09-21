package com.boardspring.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.mapper.CommentMapper;

@Service("CommentServiceImpl")
public class CommentServiceImpl implements CommentService {
	@Autowired CommentMapper commentmapper;
	
	@Override
	public int CommentCount() {
		return commentmapper.CommentCount();
	}
	
}

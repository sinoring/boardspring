package com.boardspring.example.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	public int CommentCount();
}
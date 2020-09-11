package com.boardspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boardspring.example.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
	void insertBoard(Board board);
}

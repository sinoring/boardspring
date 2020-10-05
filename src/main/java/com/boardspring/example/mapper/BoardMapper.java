package com.boardspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boardspring.example.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
	public int boardListCnt();
	public void boardInsert(Board board);
	public Board boardView(int bNum);
	public boolean boardDel(int bNum);
	public void boardModify(Board board);
	public boolean updateHit(int bNum);
//	public int countBoardList() {
//		return (Integer) selectOne("Board.countBoardList");
//	}
}

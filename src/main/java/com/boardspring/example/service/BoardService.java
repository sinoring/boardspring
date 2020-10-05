package com.boardspring.example.service;

import java.util.List;

import com.boardspring.example.domain.Board;
import com.boardspring.example.paging.Criteria;

public interface BoardService {
	public List<Board> selectBoardList(Criteria cri);
	public int boardListCnt();
	public void boardInsert(Board board);
	public Board boardView(int bNum);
	public boolean updateHit(int bNum);
	public boolean boardDel(int bNum);
	public void boardModify(Board board);
//	int countBoardListTotal();
//	List<>
	
	
}

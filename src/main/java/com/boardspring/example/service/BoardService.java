package com.boardspring.example.service;

import java.util.List;

import com.boardspring.example.domain.Board;
import com.boardspring.example.domain.BoardCo;
import com.boardspring.example.paging.Search;

public interface BoardService {
	public List<Board> selectBoardList(Search search) throws Exception;
	public int boardListCnt(Search search) throws Exception;
	public void boardInsert(Board board) throws Exception;
	public Board boardView(int bNum) throws Exception;
	public boolean updateHit(int bNum) throws Exception;
	public boolean boardDel(int bNum) throws Exception;
	public void boardModify(Board board) throws Exception;
//	int countBoardListTotal();
//	List<>
	
	
}

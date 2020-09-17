package com.boardspring.example.service;

import java.util.List;

import com.boardspring.example.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();
	public void boardInsert(Board board);
	public Board boardView(int bNum);
	public boolean boardDel(int bNum);
	public void boardModify(Board board);
}

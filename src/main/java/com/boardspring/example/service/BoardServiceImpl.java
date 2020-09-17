package com.boardspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.domain.Board;
import com.boardspring.example.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(){
		return boardmapper.selectBoardList();
	};
	
	@Override
	public void boardInsert(Board board){
		boardmapper.boardInsert(board);
	}
	
	@Override
	public Board boardView(int bNum) {
		return boardmapper.boardView(bNum);
	}
	
	@Override
	public boolean boardDel(int bNum) {
		return boardmapper.boardDel(bNum);
	}
	
	@Override
	public void boardModify(Board board) {
		boardmapper.boardModify(board);
	}
	
}

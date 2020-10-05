package com.boardspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.domain.Board;
import com.boardspring.example.mapper.BoardMapper;
import com.boardspring.example.paging.Criteria;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(Criteria cri){
		return boardmapper.selectBoardList();
	};
	
	@Override
	public int boardListCnt() {
		return boardmapper.boardListCnt();
	}
	
	
//	@Override
//	public int countBoardListTotal() {
//		return boardmapper.countBoardList();
//	}
	
	@Override
	public void boardInsert(Board board){
		boardmapper.boardInsert(board);
	}
	
	@Override
	public Board boardView(int bNum) {
		return boardmapper.boardView(bNum);
	}
	
	@Override
	public boolean updateHit(int bNum) {
		return boardmapper.updateHit(bNum);
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

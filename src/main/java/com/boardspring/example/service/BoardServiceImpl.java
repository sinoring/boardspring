package com.boardspring.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boardspring.example.domain.Board;
import com.boardspring.example.mapper.BoardMapper;
import com.boardspring.example.paging.Search;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(Search search)throws Exception{
		return boardmapper.selectBoardList(search);
	};
	
	@Override
	public int boardListCnt()throws Exception {
		return boardmapper.boardListCnt();
	}
	
	
//	@Override
//	public int countBoardListTotal() {
//		return boardmapper.countBoardList();
//	}
	
	@Override
	public void boardInsert(Board board)throws Exception{
		boardmapper.boardInsert(board);
	}
	
	@Override
	public Board boardView(int bNum)throws Exception {
		return boardmapper.boardView(bNum);
	}
	
	@Override
	public boolean updateHit(int bNum)throws Exception  {
		return boardmapper.updateHit(bNum);
	}
	
	@Override
	public boolean boardDel(int bNum)throws Exception {
		return boardmapper.boardDel(bNum);
	}
	
	@Override
	public void boardModify(Board board)throws Exception {
		boardmapper.boardModify(board);
	}
	
}

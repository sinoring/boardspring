package com.boardspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boardspring.example.domain.Board;
import com.boardspring.example.paging.Search;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(Search search) throws Exception;
	public int boardListCnt(Search search) throws Exception;
	public void boardInsert(Board board) throws Exception;
	public Board boardView(int bNum) throws Exception;
	public boolean boardDel(int bNum) throws Exception ;
	public void boardModifyForm(int bNum) throws Exception;
	public void boardModify(Board board) throws Exception;
	public boolean updateHit(int bNum) throws Exception;
}

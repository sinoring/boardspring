package com.boardspring.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boardspring.example.domain.Board;
import com.boardspring.example.mapper.BoardMapper;
import com.boardspring.example.service.BoardService;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired BoardService boardservice;
	@RequestMapping("/")
	//게시글목록
	public String home(Model model) {
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/boardList";
	}
	
	//게시글작성페이지 (get)
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public ModelAndView writeForm() {
		return new ModelAndView("boardWrite");
	}
	
	//게시글작성페이지 (post)
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public ModelAndView wirte(@ModelAttribute("Board") Board board) {
		
		BoardMapper.insertBoard(board);
		
		return "/boardList";
	}
	
	
}

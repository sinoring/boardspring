package com.boardspring.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boardspring.example.domain.Board;
import com.boardspring.example.mapper.BoardMapper;
import com.boardspring.example.service.BoardService;

@org.springframework.stereotype.Controller
@RequestMapping("/board")
@ComponentScan(basePackageClasses=Controller.class)
public class Controller {

	@Autowired BoardService boardservice;
	
	//게시글목록
//	public String home(Model model) {
//		
//		List<Board> list = boardservice.selectBoardList();
//		model.addAttribute("list", list);
//		
//		return "/boardList";
//	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list() {
		List<Board> list = boardservice.selectBoardList();
		return new ModelAndView("boardList","list",list);
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public ModelAndView writeForm() {
		return new ModelAndView("boardWrite");
	}
	
//	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String write(Model model) {
		boardservice.boardInsert();
		
		return "redirect://localhost:8080/board";
	}
	
	
	
	}
	



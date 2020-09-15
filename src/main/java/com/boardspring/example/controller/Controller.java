package com.boardspring.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boardspring.example.domain.Board;
import com.boardspring.example.service.BoardService;

@org.springframework.stereotype.Controller

public class Controller {

	@Autowired BoardService boardservice;
	
//	게시글목록
	@RequestMapping("/")
	public String home(Model model) {
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/boardList";
	}

	
	@RequestMapping(value="/boardWrite")
	public String writeBoard() {
		return "/boardWrite";
	}
	
	@RequestMapping(value="/boardSave")
	public String saveBoard() {
		//boardservice.boardInsert(board);
		//return "redirect:/";
		return "/boardWrite";
	}
	
//	@RequestMapping(value="/#{bNum}", method=RequestMethod.GET)
//	public String viewBoard(Model model, @Requestparam("bNum")int bNum) {
//		model.addAttribute("boardView", boardservice.boardView(bNum));
//		return "/boardView";
//		
//	}
	
	
	}
	



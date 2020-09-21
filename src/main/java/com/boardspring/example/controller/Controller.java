package com.boardspring.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boardspring.example.domain.Board;
import com.boardspring.example.service.BoardService;
import com.boardspring.example.mapper.BoardMapper;

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
	public String saveBoard(Board board) {
		boardservice.boardInsert(board);
		return "redirect:/";
	}
	
	@RequestMapping(value="/boardView")
	public String boardView(Model model,@RequestParam("bNum")int bNum){
		model.addAttribute("boardView",boardservice.boardView(bNum));
		//jsp에 boardView. 형식으로 지정
		boardservice.updateHit(bNum);
		return "/boardView";
	}
	
	@RequestMapping(value="/boardDel")
	public String boardDel(@RequestParam("bNum")int bNum) {
		boardservice.boardDel(bNum);
		return "redirect:/";
	}
	
	@GetMapping(value="/boardModify")
	public String boardModify(@RequestParam("bNum")int bNum, Model model) {
		model.addAttribute("board", boardservice.boardView(bNum));
		return "/boardModify"; 
	}
	
//	@PostMapping(value="/boardModify2")
//	public String boardModify(Board board) {
//		boardservice.boardModify(board);
//		return "/boardModify";
//		//return "redirect:/";
//	}
	
	@RequestMapping("/boardMod")
	public String boardMod(Board board) {
		return "redirect:/";
	}
	

}



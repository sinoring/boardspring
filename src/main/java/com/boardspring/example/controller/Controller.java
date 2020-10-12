package com.boardspring.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boardspring.example.domain.Board;
import com.boardspring.example.domain.Comment;
import com.boardspring.example.domain.User;
import com.boardspring.example.service.BoardService;
import com.boardspring.example.service.CommentService;
import com.boardspring.example.service.UserService;
import com.mysql.cj.xdevapi.JsonArray;
import com.boardspring.example.mapper.BoardMapper;
import com.boardspring.example.paging.Criteria;

@org.springframework.stereotype.Controller

public class Controller {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;
	@Autowired CommentService commentservice;
	
//	@RequestMapping("/")
//	public String home(Model model) {
//		List<Board> list = boardservice.selectBoardList();
//		model.addAttribute("list" , list);
//		logger.debug("debug");
//		logger.info("info");
//		logger.error("error");
//		return "/boardList";
//		
//	}
	
//	�Խñ۸��
	@RequestMapping("/")
	public String home( Model model) {
	
		int boardListCnt = boardservice.boardListCnt();
		
		Criteria criteria = new Criteria();
		criteria.setCriteria(criteria);
		criteria.setTotalCount(boardListCnt);
		
		List<Board> list = boardservice.selectBoardList(criteria);
		
		model.addAttribute("list",list);
		model.addAttribute("paging", criteria);
		
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
		Board board = boardservice.boardView(bNum);
		model.addAttribute("boardView", board);
		//jsp�� boardView. �������� ����
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

	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		//��й�ȣ ��ȣȭ
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		//��������
		userservice.createUser(user);
		userservice.createAuthorities(user);
		
		return "/login";
	}
	
	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/admin")
	public String admin(Model model) {
		return "/admin";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/user/info")
	public String userInfo(Model model) {
		return "/user_info";
	}
	
	@RequestMapping(value="/denied")
	public String denied(Model model) {
		return "/denied";
	}
	
	@RequestMapping(value="/commentList")
	@ResponseBody
	public List<Comment> commentList(@RequestParam("bNum")int bNum) throws Exception{
		List<Comment> list = (commentservice.commentList(bNum));
		
		return list;
	}
	
	@RequestMapping(value="/commentInsert")
	@ResponseBody
	public Map<String, Object> commentInsert(@RequestBody Comment comment) throws Exception{
		Map<String, Object> success = new HashMap<>();
		try {
			commentservice.commentInsert(comment);
			success.put("status", "OK");
			} catch(Exception e) {
		e.printStackTrace();
		success.put("status", "false");
		}
		return success;
	}
	
	
//	  @RequestMapping(value="/commentInsert")
//	  @ResponseBody public String ajax_addComment(@ModelAttribute("Comment")
//	  Comment comment, HttpServletRequest request) throws Exception{ HttpSession
//	  session = request.getSession(); User user =
//	  (User)session.getAttribute("user");
//	  
//	  try { comment.setU_id(user.getU_id());
//	  commentservice.commentInsert(comment); } catch (Exception e) {
//	  e.printStackTrace(); 
//	  }
//	  
//	  return "success"; 
//	  }
	 
	
}
	

	




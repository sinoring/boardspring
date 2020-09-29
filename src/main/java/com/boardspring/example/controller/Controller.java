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
import com.boardspring.example.paging.PageMaker;

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
	
//	게시글목록
	@RequestMapping("/")
	public String home(@ModelAttribute("criteria") Criteria cri, Model model) {
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(100);
		
		List<Board> list = boardservice.selectBoardList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pagemaker", pagemaker);
		
		pagemaker.setTotalCount(boardservice.countBoardListTotal());
		
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

	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		//비밀번호 암호화
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		//유저생성
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
	
	
	@RequestMapping(value="/commentInsert")
	@ResponseBody
	public String ajax_addComment(@ModelAttribute("Comment") Comment comment, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		try {
			comment.setcUser(user.getU_id());
			commentservice.commentInsert(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="/commentList", produces="application/json; charset=utf-8")
//	@ResponseBody
//	public ResponseEntity ajax_commentList(@ModelAttribute("Board")Board board, HttpServletRequest request) throws Exception{
//		HttpHeaders responseHeaders = new HttpHeaders();
//		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
//		
//		List<Comment> comment = commentservice.commentList();
//		
//		if(comment.size() > 0) {
//			for(int i=0; i<comment.size(); i++) {
//				HashMap hm = new HashMap();
//				hm.put("cNum", comment.get(i).getcNum());
//				hm.put("cContent", comment.get(i).getcContent());
//				hm.put("cUser", comment.get(i).getcUser());
//				
//				hmlist.add(hm);
//			}
//		}
//		
//		JSONArray json = new JSONArray(hmlist);
//		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
//		
//	}
	

//	@RequestMapping("/commentList")
//	@ResponseBody //비동기 처리
//	public List<Comment> commentList(Model model) throws Exception{
//		return commentservice.commentList();
//		
//	}
//	
//	@RequestMapping("/commentInsert")
//	@ResponseBody
//	public int commentInsert(@RequestParam int bNum, @RequestParam String cContent, @RequestParam String cUser )throws Exception{
//		Comment comment = new Comment();
//		comment.setbNum(bNum);
//		comment.setcContent(cContent);
//		comment.setcUser(cUser);
//		
//		return commentservice.commentInsert(comment);
//	}
//	
//	@RequestMapping("/commentModify")
//	@ResponseBody
//	public int commentModify(@RequestParam int cNum, @RequestParam String cContent) throws Exception{
//		Comment comment = new Comment();
//		comment.setcNum(cNum);
//		comment.setcContent(cContent);
//		
//		return commentservice.commentModify(comment);
//	}
//	
//	@RequestMapping("/commentDelete/{cNum}")
//	@ResponseBody
//	public int commentDelete(@RequestParam int cNum) throws Exception{
//		Comment comment = new Comment();
//		comment.setcNum(cNum);
//		
//		return commentservice.commentDelete(cNum);
//	}
	
	
	
}



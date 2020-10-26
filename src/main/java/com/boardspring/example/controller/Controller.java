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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
import com.boardspring.example.paging.Search;

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
	
//	占쌉시글몌옙占�
	/*
	 * @RequestMapping(value = "/{page}/{range}", method=RequestMethod.GET) public
	 * String home( Model model, )throws Exception{ page }
	 */
	@RequestMapping("/")
	public String home( Model model, 
						@RequestParam(required = false, defaultValue="1") int page,
						@RequestParam(required = false, defaultValue="1") int range,
						@RequestParam(required = false, defaultValue="bTitle") String searchType,
						@RequestParam(required = false) String keyword,
						@ModelAttribute("search") Search search
						)throws Exception{
	
//		Criteria criteria = new Criteria();
//		criteria.setCriteria(criteria);
//		criteria.setTotalCount(boardListCnt);
		//占싯삼옙
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//占싯삼옙
		int listCnt = boardservice.boardListCnt(search);
		search.pageInfo(page, range, listCnt);
		
		//占쏙옙체占쌉시글쇽옙
		List<Board> list = boardservice.selectBoardList(search);
		
		//占쏙옙占쏙옙징
		model.addAttribute("list",list);
		model.addAttribute("pagingnation", search);
		
		//占쌉시깍옙화占쏙옙占쏙옙占�
		model.addAttribute("boardList",boardservice.selectBoardList(search));
		model.addAttribute("search",search);
		
		return "/boardList";
	}

	@RequestMapping(value="/boardWrite")
	public String writeBoard() {
		return "/boardWrite";
	}
	
	@RequestMapping(value="/boardSave")
	public String saveBoard(Board board)throws Exception {
		boardservice.boardInsert(board);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/boardView")
	public String boardView(Model model, @RequestParam("bNum")int bNum)throws Exception{
		Board board = boardservice.boardView(bNum);
		model.addAttribute("comment", new Comment());
		model.addAttribute("boardView", board);
		//jsp占쏙옙 boardView. 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		boardservice.updateHit(bNum);
		return "/boardView";
	}
	
	@RequestMapping(value="/deleteBoard")
	public String boardDel(@RequestParam("bNum")int bNum)throws Exception {
		boardservice.boardDel(bNum);
		return "redirect:/";
	}
	
	@RequestMapping(value="/boardMod")
	public String boardModify(@RequestParam("bNum")int bNum, Model model) throws Exception{
		Board board = boardservice.boardView(bNum);
		model.addAttribute("board", board);
		
		return "/boardModify";
	}
	
	@RequestMapping(value="/boardModify") //�쐞 boardModify �븿�닔媛��졇�샂
	public String update(Board board) throws Exception {
		boardservice.boardModify(board);
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
//	@RequestMapping(value="/boardModify")
//	public String boardModifyForm(@RequestParam("bNum")int bNum, Board board, Model model) throws Exception {
//        boardservice.boardModify(board);
//		//Board board = boardservice.boardModify(board);
//		return "/boardModify";
//	}
	
//	@RequestMapping(value="/boardModify")
//	public String boardModify(Board board) throws Exception {
//		boardservice.boardModify(board);
//		
//		return "redirect:/";
//	}
	
	
//	@RequestMapping(value="/boardMod")
//	public String boardModifyForm(@RequestParam("bNum")int bNum, Model model, HttpServletRequest request)throws Exception {
//		model.addAttribute("board", boardservice.boardView(bNum));
//		
//		Board board = new Board();
//		board.setbContent(request.getParameter("bContent"));
//		board.setbTitle(request.getParameter("bTitle"));
//		board.setbNum(Integer.parseInt(request.getParameter("bNum")));
//		
//		boardservice.boardModify(board);
//		
//		return "/boardMod";
//	}
	
//	@RequestMapping(value="/boardModify")
//	public String boardModify(Board board) throws Exception {
//		boardservice.boardModify(board);
//		
//		return "/boardMod";
//	}
	
//	@RequestMapping("/boardMod")
//	public String boardMod(Board board) {
//		return "redirect:/";
//	}

	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		//占쏙옙橘占싫� 占쏙옙호화
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		//占쏙옙占쏙옙占쏙옙占쏙옙
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
	public List<Comment> commentList( @RequestParam("bNum")int bNum, Model model) throws Exception{
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
	
	@RequestMapping(value="/commentModify")
	@ResponseBody
	public Map<String, Object> commentModify(@RequestBody Comment comment) throws Exception{
		Map<String, Object> success = new HashMap<>();
		try {
			commentservice.commentModify(comment);
			success.put("status", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			success.put("status", "false");
		} 
		return success;
		
	}
	
	@RequestMapping(value="/commentDelete")
	@ResponseBody
	public Map<String, Object> commentDelete(@RequestParam("bNum")int bNum) throws Exception{
		Map<String, Object> success = new HashMap<>();
		try {
			commentservice.commentDelete(bNum);
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
	

	




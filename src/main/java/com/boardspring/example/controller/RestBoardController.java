package com.boardspring.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.boardspring.example.domain.Comment;
import com.boardspring.example.service.CommentService;

@RestController
@RequestMapping(value="/restBoard")
public class RestBoardController {
	private static final Logger logger = LoggerFactory.getLogger(Controller.class);
	
	@Autowired
	private CommentService commentService;
	
	
	@RequestMapping(value="/getReplyList", method = RequestMethod.POST)
	public List<Comment> getReplyList(@RequestParam("bNum")int bNum) throws Exception{
		return commentService.getReplyList(bNum);
	}
	
	
	@RequestMapping(value="/saveReply" , method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody Comment comment) throws Exception{
		Map<String, Object> result = new HashMap<>();
		//jsp if문에있던 result
		
		try {
			commentService.saveReply(comment);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	@RequestMapping(value="/updateReply")
	public Map<String, Object> updateReply(@RequestBody Comment comment) throws Exception{
		Map<String, Object> result = new HashMap<>();
		
		try {
			commentService.updateReply(comment);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
}

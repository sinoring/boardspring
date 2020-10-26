package com.boardspring.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boardspring.example.domain.Comment;

@Mapper
public interface CommentMapper {
	/*
	 * public int commentCount() throws Exception; public List<Comment>
	 * commentList(int bNum) throws Exception; public int commentInsert(Comment
	 * comment) throws Exception; public int commentModify(Comment comment) throws
	 * Exception; public int commentDelete(int cNum) throws Exception;
	 */
	public List<Comment> getReplyList(int bNum) throws Exception;
	public int saveReply(Comment comment) throws Exception;
	public int updateReply(Comment comment) throws Exception;
	public int deleteReply(int cNum) throws Exception;
}

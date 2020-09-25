<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
    <div>board_no :</div>
    <div>${boardView.bNum}</div>
    <div>board_title :</div>
    <div>${boardView.bTitle}</div>
    <div>board_content :</div>
    <div>${boardView.bContent}</div>
    <div>board_user :</div>
    <div>${boardView.bUser}</div>
    <div>board_date :</div>
    <div>${boardView.bDate}</div>
    <div style= "float:right;">
        <input type="button" value="수정" onclick="location.href='boardModify?bNum=${boardView.bNum}'">
        <input type="button" value="삭제" onclick="del(${boardView.bNum})">
    </div>
    <br>
    <br>
    <div class="container">
    <div class="col-xs-12" style="margin:15px auto;">


    	<label for="content">Comment</label>
    	<form name="commentInsertForm">
    		<div class="input-group">
    			<input type="hidden" name="bNum" value="${boardView.bNum}"/>
    			<input type="text" class="form-control" id="content" name="cContent" placeholder="내용을 입력하세요.">
    			<span class="input-group-btn">
    				<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
    			</span>
    		</div>
    	</form>
    </div>
    </div>
    
    <div class="container">
    	<div class="commentList"></div>
    </div>
    <%@ include file="commentS.jsp" %>

<script>
	function del(bNum){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
			location.href='boardDel?bNum='+bNum;
			}
		}

</script>
</layoutTag:layout>
</body>
</html>
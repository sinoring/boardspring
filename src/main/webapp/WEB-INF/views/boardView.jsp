<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>

body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.board_title {
	font-weight : 700;
	font-size : 22px;
	margin : 10px;
}

.board_info_box {
	color : #6B6B6B;
	margin : 10px;
}

.board_author {
	font-size : 15px;
	margin-right : 15px;
}

.board_date {
	font-size : 15px;
}

.board_content {
	color : #444343;
	font-size : 20px;
	margin : 10px;
}



</style>
<title>boarview</title>

</head>
<body>
<h1 style="width:20px; margin:auto;">VIEW</h1>
     <article>
		<div class="container" role="main">
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardview.bTitle}"/></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardView.bUser}"/>,</span><span class="board_date"><c:out value="${boardView.bDate}"/></span>
				</div>
				<div class="board_content">${boardView.bContent}</div>

			</div>
		</div>
	</article> 
	
    <%-- <table class="boardview">
    	<tbody class="bg-white rounded shadow-sm">
    		<tr>
    			<th class="board_title">제목</th>
    			<td>${boardView.bTitle}</td>
    			<th class="board_hit">조회수</th>
    			<td>${boardView.bHit}</td>
    		</tr>
    		<tr>
    			<th class="board_author">작성자</th>
    			<td>${boardView.bUser}</td>
    			<th class="board_date">작성시간</th>
    			<td>${boardView.bDate}</td>
    		</tr>
    		<tr class="board_info_box">
    			<th>내용</th>
    			<td colspan="3" class="board_content">${boardView.bContent }</td>
    		</tr>

    	</tbody>
    </table> --%>
    <div style= "float:right;">
        <input type="button" class="btn btn-sm btn-primary"  value="수정" onclick="location.href='boardModify?bNum=${boardView.bNum}'">
        <input type="button" class="btn btn-sm btn-primary" id="btnDelete"  value="삭제" onclick="del(${boardView.bNum})">
    </div>
    <br>
    <br>
    
    <%@ include file="../views/comment.jsp" %>
    
   <script>
		$(document).on('click','#btnDelete', function(){
			var url = "${pageContext.request.contextPath}/deleteBoard";
			url = url + "?bNum=" + ${boardView.bNum};
			location.href = url;
			});

   </script>
</body>
</html>
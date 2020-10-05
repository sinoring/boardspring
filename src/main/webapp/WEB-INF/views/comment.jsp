<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class = "container">
	<form id="commentForm" name="commentForm" method="post">
	<br><br>
		<div>
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td>
							<textarea style="width: 1100px" rows="3" cols="30" id="cComment" name="cComment" placeholder="댓글을 입력해주세요."></textarea>
							
							<div>
								<a href="#" onClick="fn_comment('${result.code}')" class="btn pull-right btn-success">등록</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" id="bNum" name="bNum" value="${result.code }" />
	</form>
</div>
<div class="container">
	<form id="commentListForm" name="commentListForm" method="post">
		<div id="commentList"></div>
	</form>
</div>

<script>

//댓글등록
function fn_comment(code){

	$.ajax({
	type : 'POST',
	url : "<c:url value='/commentInsert'/>",
	data : $("#commentForm").serialize(),
	success : function(data){
		if(data=="success")
		{
			getCommentList();
			$("#comment").val("");

		}
	},
	error:function(request,status,error){
		}
	});
}

//초기페이지 로딩시 댓글 불러오기

$(function(){
	getCommentList();
});


//댓글불러오기

function getCommentList(){
	$.ajax({
		type : 'GET',
		url : "<c:url value='/boardList'/>",
		dataType : "json",
		data : $("#commentForm").serialize(),
		//serialize 메소드를 사용하면 form에있는 객체들을 한번에 불러올수이씀
		contentType : "application/x-www.form-urlencoded; charset=utf-8",
		// ajax 요청을할때 디폴트 콘텐트타입
		success : function(data){

			var html = "";
			var cCnt = data.length;

			if(data.length > 0){
					for(i=0; i<data.length; i++){
						html += "<div>";
						html += "<div><table class='table'><h6><strong>"+data[i].cUser+"</strong></h6>";
						html += "</table></div>";
						html += "</div>";
						}
				}else{
					html += "<div>";
					html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>"
					html += "</div>";
					}
				$("#cCnt").html(cCnt);
				$("commentList").html(html);
			},
			error:function(request,status,error){
				}
		});

}




</script>






</body>
</html>
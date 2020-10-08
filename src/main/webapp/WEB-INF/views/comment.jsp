<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script src="${path}/include/js/common.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<sec:authentication var="user" property="principal" />

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
							<textarea style="width: 1100px" rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력해주세요."></textarea>
							
							<div>
								<a href="#" onClick="fn_comment()" class="btn pull-right btn-success">등록</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" id="bNum" name="bNum" value="${boardView.bNum}" />
	</form>
</div>
<div class="container">
	<form id="commentListForm" name="commentListForm" method="post">
		<div id="commentList"></div>
	</form>
</div>



<script type="text/javascript">

$(document).ready(function(){
	commentList();
});


//댓글등록

function fn_comment(){
	
	$.ajax({
		type : 'POST',
		url : "/commentInsert",
		contentType: 'application/json',
		//data : $("#commentForm").serialize(), //serialize 요즘안씀
		data : JSON.stringify(
			{ 
				cContent: $('#cContent').val(), 
				bNum: ${boardView.bNum},
				u_id: '${user.username }' 
			}
		), 
		success : function(data){
			console.log(data);
			if(data=="success")
			{	alert("댓글이 등록되었습니다.");
				//getCommentList();
				//$("#comment").val("");

				$('#commentForm').append(data);
				//만약 커멘트리스트가 추가가아닌 for문으로 돌면 #이아니라 .으로 해야함(클래스)
			}
		},
		error:function(request,status,error){
		}
	});

}

//초기페이지 로딩시 댓글 불러오기




//댓글불러오기

function commentList(){
	
	$.ajax({
		type : 'GET',
		url : "/commentList",
		dataType : "json",
		/*data : $("#commentForm").serialize()  */
		data : JSON.stringify({cContent: $('#cContent').val(), bNum: $('#bNum').val()}),
		//serialize 메소드를 사용하면 form에있는 객체들을 한번에 불러올수이씀
		contentType: 'application/json',
		// ajax 요청을할때 디폴트 콘텐트타입
		success : function(data){

			var htmls = "";
			if(data < 1){
				htmls.push("등록된 댓글이 없습니다.");
				} else{
					$(data).each(function(){
						htmls += "<div>";
						htmls += "<div><table class='table'><h6><strong>"+data[i].u_id+"</strong></h6>";
						htmls += "</table></div>";
						htmls += "</div>";

						});
					}
					$("#commentList").html(html);

				}
	});
}
			
			/* var html = "";
			var cCnt = data.length;

			if(result.length > 0){
					for(i=0; i<data.length; i++){
						html += "<div>";
						html += "<div><table class='table'><h6><strong>"+data[i].u_id+"</strong></h6>";
						html += "</table></div>";
						html += "</div>";
						}
				}else{
					html += "<div>";
					html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>"
					html += "</div>";
					}
				$("#cCnt").html(cCnt);
				$("#commentListForm").html(html);
			},
			error:function(request,status,error){
				}
		}); */






</script>






</body>
</html>
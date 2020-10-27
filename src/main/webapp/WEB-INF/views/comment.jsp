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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->
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
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px;">
				<table class="table">
					<tr>
						<td>
							<textarea style="width: 1100px" rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력해주세요."></textarea>
							
							<div>
								<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저장 </button>

							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" id="bNum" name="bNum" value="${boardView.bNum}" />
	</form>
</div>
<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
	<h6 class="border-bottom pb-2 mb-0" style="text-align:center">Reply list</h6>
	<div id="replyList"></div>
</div> 




<script type="text/javascript">

$(document).ready(function(){
	showReplyList();
});


//댓글등록

function showReplyList(){
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/restBoard/getReplyList",
		data : { bNum: $('#bNum').val() },
		dataType : "json",
		success : function(result){
			var htmls = "";
				if(result.length < 1){
					htmls.push("등록된 댓글이 없습니다.");
					} else{
						$(result).each(function(){
							htmls += '<div style="width:1090px; margin:auto;';
							htmls += '<div class="media text-muted pt-3"  id="cNum">' + this.cNum + "";
							htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
							htmls += '<title>Placeholder</title>';
							//htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
							//htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
							htmls += '</svg>';
							htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
							htmls += '<span class="d-block">';
							htmls += '<strong class="text-gray-dark">' + this.u_id + '</strong>';
							htmls += '<span style="padding-left: 7px; font-size: 12px">';
							htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.cNum + ', \'' + this.u_id + '\', \'' + this.cContent + '\' )" style="padding-right:5px">수정</a>';
		                    htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.cNum + ')" >삭제</a>';
		                    htmls += '</span>';
		                    htmls += '</span>';
		                    htmls += '<br>';
		                    htmls += '<div style="font-size:18px">'+this.cContent;
		                    htmls += '</p>';
		                    htmls += '</div>';
		                    htmls += '</div>';
							});
						}
						$("#replyList").html(htmls);
			}
		});
}


$(document).on('click', '#btnReplySave' , function(){

	$.ajax({
		url : "${pageContext.request.contextPath}/restBoard/saveReply",
		type : 'POST',
		contentType: 'application/json',
		dataType : 'text',
		data : JSON.stringify(
				{
					cContent: $('#cContent').val(), 
					bNum: ${boardView.bNum},
					u_id: '${user.username }'
					
					}
				),
		success : function(result){
			showReplyList();
			$('#cContent').val("");
			$('#u_id').val("");
			//$("#replyList").append(data);
			}
		, error : function(error){
			console.log("에러:" + error);
			
			}
		});
});


function fn_editReply(cNum, u_id, cContent){
	var htmls = "";

	htmls += '<div class="media text-muted pt-3" id="cNum' + cNum + '">';
	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">' + u_id + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + cNum + ', \'' + u_id + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
	htmls += cContent;
	htmls += '</textarea>';
	
	htmls += '</p>';
	htmls += '</div>';
	
	$('#cNum' + cNum).replaceWith(htmls);
	$('#cNum' + cNum + '#editContent').focus(); 

}

function fn_updateReply(cNum, u_id){
	$.ajax({
		url : "${pageContext.request.contextPath}/restBoard/updateReply",
		contentType : "application/json","X-HTTP-Method-Override" : "POST",
		data : JSON.stringify({
				"cContent" : $('#editContent').val(),
				"cNum" : cNum
			}),
		type : 'POST',
		dataType : 'text',
		success: function(result){
			console.log(result);
			showReplyList();
			}
			,error : function(error){
				console.log("에러 : " + error);
				}
		});
}


function fn_deleteReply(cNum){
	$.ajax({
		url : "${pageContext.request.contextPath}/restBoard/deleteReply",
		data : {cNum : cNum},
		type : 'POST',
		dataType : 'text',
		success : function(result){
			showReplyList();

			}
			,error : function(error){
				console.log("에러: " + error);
				}
		});
}





/* function fn_comment(){
	
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

				$("#commentList").append(data);
				//만약 커멘트리스트가 추가가아닌 for문으로 돌면 #이아니라 .으로 해야함(클래스)
			}
		},
		error:function(request,status,error){
		}
	});

} */


 /* function commentEditModify(bNum, cDate, cContent){
	var htmls = "";
	htmls += '<div class="media text-muted pt-3" id="bNum' + bNum + '">';
	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	htmls += '<title>Placeholder</title>';
	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	htmls += '</svg>';
	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	htmls += '<span class="d-block">';
	htmls += '<strong class="text-gray-dark">' + cDate + '</strong>';
	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	htmls += '<a href="javascript:void(0)" onclick="commentModify(' + bNum + ', \'' + cDate + '\')" style="padding-right:5px">저장</a>';
	htmls += '<a href="javascript:void(0)" onClick="commentList()">취소<a>';
	htmls += '</span>';
	htmls += '</span>';		
	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
	htmls += cContent;
	htmls += '</textarea>';
	htmls += '</p>';
	htmls += '</div>';
	$('#bNum' + bNum).replaceWith(htmls);
	$('#bNum' + bNum + '#editContent').focus();

}  */ 

	/* function commentModify(bNum, cDate, cContent){
	$.ajax({
		url : "${pageContext.request.contextPath}/commentModify}",
		type : "POST",
		data : JSON.stringify(
			{
				cContent: $('#editContent').val(), 
				bNum: ${boardView.bNum}

			}
		),
		contentType : "application/json", "X-HTTP-Method-Override": "POST";
		dataType : "text",
		success : function(data){
			console.log(data);
			commentList();
		}
			, error: function(error){
				console.log("에러: " + error);
				}
		}); 
} */

	/*   function commentDel(bNum){
		$.ajax({
				url : '/commentDelete?cNum=' + cNum,
				type : 'POST',
				data : {bNum: ${boardView.bNum}},
				dataType : 'text',
				success : function(data){
					commentList();
					
					}
					,error: function(error){
							console.log("에러" + error);
						}
			})
		}  */ 

</script>






</body>
</html>
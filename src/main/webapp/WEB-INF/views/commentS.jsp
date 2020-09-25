<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		var bNum = '${boardView.bNum}';
		$('[name=commentInsertBtn]').click(function(){ //commentInsertbtn을 클릭하면
			var insertData = $('[name=commentInsertForm]').serialize(); //insertdata에 코멘트인서트폼 내용을 가져옴 
			commentInsert(insertData); //insert 함수 호출
		});

		//댓글목록
		function commentList(){
			$.ajax({
				url : '/commentList',
				type : 'get',
				data : {'bNum':bNum},
				success : function(data){
					var a = '';
					$.each(data, function(key,value){
						a += '<div class="commentArea" style="boarder-bottom:1px solid darkgray; margin-bottom:15px;">';
						a += '<div class="commentInfo'+value.cNum+'">'+'댓글번호 : '+value.cNum+'작성자 : '+value.cUser;
						a += '<a onclick="commentUpdate('+value.cNum+',\''+value.cContent+'\');"> 수정 </a>';
						a += '<a onclick="commentDelete('+value.cNum+');"> 삭제 </a> </div>';
		                a += '<div class="commentContent'+value.cNum+'"> <p> 내용 : '+value.cContent +'</p>';
						a += '</div></div>';
					});

					$(".commentList").html(a);
					}
				});
			}

//댓글 등록
function commentInsert(insertData){
	$.ajax({
		url : '/commentInsert',
		type : 'post',
		data : insertData,
		success : function(data){
			if(data == 1){
				commentList(); //댓글작성후 댓글목록 불러오기
				$('[name=cContent]').val('');
				}
			}
		});
}

function commentUpdate(cNum){
	var updateContent = $('[name=cContent_'+cNum+']').val();

	$.ajax({
		url : '/commentUpdate',
		type : 'post',
		data : {'cContent' : updateContent, 'cNum' : cNum}
		success : function(data){
			if(data == 1) commentList(bNum); //댓글수정후 목록출력
			}

		});
}

function commentDelete(cNum){
	$.ajax({
		url : '/commentDelete'+cNum,
		type : 'post',
		success : function(data){
			if(data==1) commentList(bNum); //댓글삭제후 목록출력
			}
		});
}


$(document).ready(function(){
	commentList(); //페이지 로딩시 댓글목록 출력
});





	</script>


</body>
</html>
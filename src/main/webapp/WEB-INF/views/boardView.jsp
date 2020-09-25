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
    			<input type="text" class="form-control" id="cContent" name="cContent" placeholder="내용을 입력하세요.">
    			<span class="input-group-btn">
    				<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
    			</span>
    		</div>
    	</form>
    </div>
    
    
    <div class="container">
    	<div class="commentList"></div>
    </div>
    </div>
    

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
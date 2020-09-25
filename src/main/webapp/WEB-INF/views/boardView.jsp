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
        <input type="button" value="����" onclick="location.href='boardModify?bNum=${boardView.bNum}'">
        <input type="button" value="����" onclick="del(${boardView.bNum})">
    </div>
    <br>
    <br>
    <div class="container">
    <div class="col-xs-12" style="margin:15px auto;">


    	<label for="content">Comment</label>
    	<form name="commentInsertForm">
    		<div class="input-group">
    			<input type="hidden" name="bNum" value="${boardView.bNum}"/>
    			<input type="text" class="form-control" id="cContent" name="cContent" placeholder="������ �Է��ϼ���.">
    			<span class="input-group-btn">
    				<button class="btn btn-default" type="button" name="commentInsertBtn">���</button>
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
$('[name=commentInsertBtn]').click(function(){ //commentInsertbtn�� Ŭ���ϸ�
	var insertData = $('[name=commentInsertForm]').serialize(); //insertdata�� �ڸ�Ʈ�μ�Ʈ�� ������ ������ 
	commentInsert(insertData); //insert �Լ� ȣ��
});

//��۸��
function commentList(){
	$.ajax({
		url : '/commentList',
		type : 'get',
		data : {'bNum':bNum},
		success : function(data){
			var a = '';
			$.each(data, function(key,value){
				a += '<div class="commentArea" style="boarder-bottom:1px solid darkgray; margin-bottom:15px;">';
				a += '<div class="commentInfo'+value.cNum+'">'+'��۹�ȣ : '+value.cNum+'�ۼ��� : '+value.cUser;
				a += '<a onclick="commentUpdate('+value.cNum+',\''+value.cContent+'\');"> ���� </a>';
				a += '<a onclick="commentDelete('+value.cNum+');"> ���� </a> </div>';
                a += '<div class="commentContent'+value.cNum+'"> <p> ���� : '+value.cContent +'</p>';
				a += '</div></div>';
			});

			$(".commentList").html(a);
			}
		});
	}

//��� ���
function commentInsert(insertData){
$.ajax({
url : '/commentInsert',
type : 'post',
data : insertData,
success : function(data){
	if(data == 1){
		commentList(); //����ۼ��� ��۸�� �ҷ�����
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
	if(data == 1) commentList(bNum); //��ۼ����� ������
	}

});
}

function commentDelete(cNum){
$.ajax({
url : '/commentDelete'+cNum,
type : 'post',
success : function(data){
	if(data==1) commentList(bNum); //��ۻ����� ������
	}
});
}


$(document).ready(function(){
commentList(); //������ �ε��� ��۸�� ���
});

	function del(bNum){
		var chk = confirm("���� �����Ͻðڽ��ϱ�?");
		if(chk){
			location.href='boardDel?bNum='+bNum;
			}
		}

</script>
</layoutTag:layout>
</body>
</html>
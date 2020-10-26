<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link href="css/style.css" rel="stylesheet"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
       <%-- <h3 style="width:500px; margin:auto; padding-top:200px;"> 게시글 수정</h3>
	<div style="padding : 30px; width:500px; margin:auto;">
		<form action="/boardMod" method="POST" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label>
				<input type="text" name="bTitle" class="form-control" id="exampleFormControlInput1">
			</div>
			
			<div class="form-group">
				<label>password</label>
				<input type="password" name="bPw" class="form-control">
			</div>
			<div class="form-group">
				<label  for="exampleFormControlInput1">작성자</label>
				<input type="text" name="bUser" class="form-control" id="exampleFormControlInput1">
			</div>
			<div>
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea name="bContent" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
			</div>
			<br>
			<input type="submit" class="btn btn-default" value="작성" style="width:100px; margin:auto;">
		</form>
	</div>  --%>
		               
		         		               
		               <form action="/boardMod" method="POST" >
		              //<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"> 
		                <table class="table table-striped row">
		                    <tr>
		                        <th class="col-md-2">작성자</th>
		                        <td><input class="form-control" type="text" name="bUser" value="${board.bUser}"></td>
		                    </tr>
		                    <tr>
		                    	<th class="col-md-2">번호</th>
		                    	<td><input class="form-control" type="text" name="bNum" value="${board.bNum}"></td>
		                    </tr>
		                    <tr>
		                        <th>제목</th>
		                        <td><input class="form-control" type="text" name="bTitle" value="${board.bTitle}"></td>
		                    </tr>
		                    <tr>
		                        <th>내용</th>
		                        <td><textarea class="form-control" name="bContent" rows="10" cols="">${board.bContent}</textarea></td>
		                    </tr>
		                   
		                    <tr>
		                        <td><input class="btn btn-primary" type="submit" value="수정"></td>
		                        <td><input class="btn btn-primary" type="button" value="목록" onclick="location.href='/'"></td> 
		                    </tr>  
	                	</table> 
	                	</form>
	            	<!-- </form>
	            </div>
            </div>
        </div> -->
    </body>
</html>
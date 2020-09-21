<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="container">
            <div class="col-md-7 col-md-offset-2">
	            <div class="page-hearder" style="padding-bottom: 20px;">
	                <h1>글쓰기 화면</h1>
	            </div>
	            <div>
	                <form class="form-group" name="frm-modify" action="/boardMod" method="post">
	                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
		                <table class="table table-striped row">
		                    <tr>
		                        <th class="col-md-2">작성자</th>
		                        <td>${board.bUser}</td>
		                    </tr>
		                    <tr>
		                        <th>제목</th>
		                        <td><input class="form-control" type="text" name="bTitle" value="${board.bTitle}"></td>
		                    </tr>
		                    <tr>
		                        <th>내용</th>
		                        <td><textarea class="form-control" name="bContent" rows="10" cols="">
		                        ${board.bContent}
		                        </textarea></td>
		                    </tr>
		                    <tr>
		                        <th>암호</th>
		                        <td><input class="form-control" type="password" name="bPw" value="${board.bPw}">
		                        	<input type="hidden" name="id" value="${board.bPw}">
		                        </td>
		                    </tr>
		                    <tr>
		                        <td><input class="btn btn-primary" type="submit" value="수정"></td>
		                        <td><input class="btn btn-primary" type="button" value="목록" onclick="location.href='/'"></td> 
		                    </tr>  
	                	</table>
	            	</form>
	            </div>
            </div>
        </div>
    </body>
</html>
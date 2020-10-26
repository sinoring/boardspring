<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3 style="width:500px; margin:auto; padding-top:200px;"> 게시글 작성</h3>
	<div style="padding : 30px; width:500px; margin:auto;">
		<form action="/boardSave" method="POST" >
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
	</div> 
</body>
</html>
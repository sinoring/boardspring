<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3> �Խñ� �ۼ�</h3>
	<div style="padding : 30px;">
		<form action="/boardSave" method="POST" >
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
			<div class="form-group">
				<label>����</label>
				<input type="text" name="bTitle" class="from-control">
			</div>
			<div class="form-group">
				<label>ID</label>
				<input type="number" name="bId" class="from-control">
			</div>
			<div class="form-group">
				<label>password</label>
				<input type="password" name="bPw" class="from-control">
			</div>
			<div class="form-group">
				<label>�ۼ���</label>
				<input type="text" name="bUser" class="from-control">
			</div>
			<div>
				<label>����</label>
				<textarea name="bContent" class="from-control" rows="5"></textarea>
			</div>
			<input type="submit" class="btn btn-default" value="�ۼ�">
		</form>
	</div> 
</body>
</html>
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
		<form method="POST" action="/boardWrite">
			<div class="form-group">
				<label>����</label>
				<input type="text" name="bNum" class="from-control">
			</div>
			<div class="form-group">
				<label>�ۼ���</label>
				<input type="text" name="bUser" class="from-control">
			</div>
			<div>
				<label>����</label>
				<textarea name="bContent" class="from-control" rows="5"></textarea>
			</div>
			<button type="submit" class="btn btn-default">�ۼ�</button>
		</form>
	</div> 
</body>
</html>
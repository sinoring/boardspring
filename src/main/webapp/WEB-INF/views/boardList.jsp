<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글목록</h2>
	<div>
		<a href="/login">로그인</a>
		<a href="/beforeSignUp">회원가입</a>
	</div>
	<button class="btn btn-primary" style="float : right;" onclick="location.href='/boardWrite'">작성</button>
	<table class="table">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.bNum }</td>
				<td><a href="/boardView?bNum=${list.bNum}">${list.bTitle }</a></td>
				<td>${list.bUser }</td>
				<td>${list.bDate }</td>
				<td>${list.bHit }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null){
		name = auth.getName();
	}
%>
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
		<hr>
		<div>
		
			<sec:authorize access="isAnonymous()">
				<a href="/login">로그인</a>
				<a href="/beforeSignUp">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<h2><%=name %>님 반갑습니다.</h2>
				<a href="/logout">로그아웃</a>
			</sec:authorize>
		</div>
		<div>
			<sec:authorize access="isAuthenticated()">
				<a href="/user/info">내 정보</a>
				<a href="/admin">관리자</a>
			</sec:authorize>
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
		<ul class="btn-group pagination" style="textalign:center">
			<c:if test="${paging.prev }">
				<li>
					<a href="/?page=${paging.makeQuery(paging.startPage-1)}">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
				<li>
					<a href='<c:url value="/?page=${pageNum }"/>'>${pageNum }</a>
				</li>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage > 0 }">
				<li>
					<a href="/?page=${paging.makeQuery(paging.endPage+1)}">다음</a>
				</li>
			</c:if>

		</ul>
		
		<div class="form-group row justify-content-center"  style="width:300px; margin:auto;">
			<div style="padding-right:10px;">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="bTitle">제목</option>
					<option value="bContent">내용</option>
					<option value="bUser">작성자</option>
				</select>
			</div>
			<div style="padding-right:10px;">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
			</div>
			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<script>
		
			$(document).on('click','#btnSearch', function(e){
				e.preventDefault();
				var url = "$(selectBoardList)";
				url = url + "?searchType=" + $('$searchType'.val());
				url = url + "&keyword=" + $('$keyword'.val());
				location.href = url;
				console.log(url);
				}


					)
		</script>
</body>
</html>
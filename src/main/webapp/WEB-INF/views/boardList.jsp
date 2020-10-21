<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
				<h2><sec:authentication property="principal.username"/>님 반갑습니다.</h2>
				<a href="/logout">로그아웃</a>
			</sec:authorize>
		</div>
		<div>
			<sec:authorize access="isAuthenticated()">
				<a href="/user/info">내 정보</a>
				<a href="/admin">관리자</a>
			</sec:authorize>
		</div>
			<sec:authorize access="isAuthenticated()">
				<button class="btn btn-primary" style="float : right;" onclick="location.href='/boardWrite'">작성</button>
			</sec:authorize>
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
			<c:if test="${pagingnation.prev }">
				<%-- <li>
					<a href="/?page=${pagingnation.makeQuery(pagingnation.startPage-1)}">이전</a>
				</li> --%>
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagingnation.page}','${pagingnation.range}','${pagingnation.rangeSize}','${search.searchType }', '${search.keyword }')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagingnation.startPage}" end="${pagingnation.endPage }" var="idx">
				<li class="page-item">
					<c:out value="${pagingnation.page == idx ? 'active' : ''}"/>
						<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagingnation.range}', '${pagingnation.rangeSize}','${search.searchType }', '${search.keyword }')"> ${idx} </a>
				</li>
			</c:forEach>
			<c:if test="${pagingnation.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="fn_next('${pagingnation.range}','${pagingnation.range}', '${pagingnation.rangeSize}','${search.searchType }', '${search.keyword }')" >Next</a>
				</li>
			</c:if>
		</ul>
		
		<div class="form-group row justify-content-center"  style="width:200px; margin:auto;">
			
				<div style="padding-right:10px;">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="bTitle">제목</option>
						<option value="bContent">내용</option>
						<option value="bUser">작성자</option>
					</select>
				</div>
			
				<div style="padding-right:10px;">
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" >
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
			
		</div>
		
		
		<script>
		function fn_prev(page, range, rangeSize){
			var page = ((range-2) * rangeSize) + 1;
			var range = range - 1;

			var url = "${pageContext.request.contextPath}/";
			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
			
			}

		function fn_pagination(page, range,rangeSize, searchType, keyword ){
			var url = "${pageContext.request.contextPath}/";
			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
			
			}

		function fn_next(page, range,rangeSize){
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;

			var url = "${pageContext.request.contextPath}/";
			url = url + "?page=" + page;
			url = url + "&range=" + range;

			location.href = url;
			
			}


		
		$(document).on('click', '#btnSearch', function(e){
			let page = ${pagingnation.page};
			let range = ${pagingnation.range};
			let searchType = '${pagingnation.searchType}';
			let keyword = '${pagingnation.keyword}';

			e.preventDefault();
			var url = "${pageContext.request.contextPath}/";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
			
			if(keyword == 'null'){
				alert("검색어를 입력해주세요.");
				location.href='/'
				}
		});	
		
		</script>
		
		
</body>
</html>
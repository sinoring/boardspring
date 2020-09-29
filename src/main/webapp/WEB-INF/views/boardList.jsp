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
	<h2>�Խñ۸��</h2>
		<hr>
		<div>
		
			<sec:authorize access="isAnonymous()">
				<a href="/login">�α���</a>
				<a href="/beforeSignUp">ȸ������</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<h2><%=name %>�� �ݰ����ϴ�.</h2>
				<a href="/logout">�α׾ƿ�</a>
			</sec:authorize>
		</div>
		<div>
			<sec:authorize access="isAuthenticated()">
				<a href="/user/info">�� ����</a>
				<a href="/admin">������</a>
			</sec:authorize>
		</div>
		<button class="btn btn-primary" style="float : right;" onclick="location.href='/boardWrite'">�ۼ�</button>
		<table class="table">
			<tr>
				<th>No</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���¥</th>
				<th>��ȸ��</th>
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
		<ul class="btn-group pagination">
			<c:if test="${pagemaker.prev }">
			<li>
				<a href='<c:url value="/boardList?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
			</li>
			</c:if>
			<c:forEach begin="${pagemaker.startPage }" end="${pagemaker.endPage }" var="pageNum">
			<li>
				<a href='<c:url value="/boardList?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
			</li>
			</c:forEach>
			<c:if test="${pagemaker.next && pagemaker.endPage > 0 }">
			<li>
				<a href='<c:url value="/boardList?page=${pagemaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
			</li>
			</c:if>
			
			
		</ul>
</body>
</html>
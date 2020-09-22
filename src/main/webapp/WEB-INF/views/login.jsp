<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
.container {
	width: 385px;
	line-height: 50px;
	margin: 40px auto;
}

h5 {
	text-align: center;
}

h5 span {
	color: teal;
}

.login {
	background-color: rgb(255, 80, 90);
	color: white;
	border-radius: 5px;
	border: 0;
	padding: 10px 172px;
}

p {
	text-align: center;
}


input {
	border: 1px solid lightgray;
	border-radius: 3px;
	
}

</style>
</head>
<body>

	<c:if test="${ loginResult == -1 || loginResult == 0 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
	</c:if>
	<div>
	<h5>로그인 페이지</h5>
	<form action="/login" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="text" placeholder="아이디" name="username" required style="height:30px; width: 380px"/><br>
		<input type="password" placeholder="비밀번호" name="password" required style="height:30px; width: 380px"/><br>
		<input id = "remember_me" name="remember-me" type="checkbox"/>아이디 기억하기<br>
		<input type="submit" value="로그인" class="login"/>
	</form>
	<p><a href="/signup"><input type="button" value="회원가입"></a></p>
	
	</div>
</body>
</html>
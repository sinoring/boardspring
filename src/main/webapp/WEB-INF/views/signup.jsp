<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
        .container {
            width: 500px;
            margin: 40px auto;
            line-height: 16px;
        }
        h5 {
            text-align: center;
        }
        
        .n {
            font-size: 13px;
        }
        #signup {
            background-color: rgb(255, 80, 90);
            color: white;
            border: 0;
            border-radius: 5px;
            padding: 10px 224px;
        }
        .bottom input {
            background-color: white;
            border: 0;
            color: teal;
            font-size: 16px;
        }
        
        input {
            border: 1px solid lightgray;
            border-radius: 3px;
        }
    </style>
</head>
<body>
	
	<c:if test="${ joinResult == 0}">
			<script>
			alert("아이디가 중복됩니다.");
			</script>
	</c:if>
	<div class="container">
		
		<h5>회원 가입</h5>
		<form action="/signup" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="text" placeholder="아이디" name="username" required style="height:30px; width:495px"/><br>
			<input type="password" placeholder="비밀번호" name="password" required style="height:30px; width: 495px" /><br>
            <input type="text" placeholder="이름" name="uName" required style="height:30px; width: 495px" /><br>
			<p>
			<input type="submit" value="가입하기" id="signUp"/>
			</p>
		</form>
	</div>
</body>
</html>
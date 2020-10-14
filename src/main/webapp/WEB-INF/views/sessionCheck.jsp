<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.u_id == null}">
	<script>
		alery("로그인 하신 후에 이용해주세요.");
		location.href="${path}/";
	</script>
</c:if>
</body>
</html>
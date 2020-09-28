<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
    <div>board_no :</div>
    <div>${boardView.bNum}</div>
    <div>board_title :</div>
    <div>${boardView.bTitle}</div>
    <div>board_content :</div>
    <div>${boardView.bContent}</div>
    <div>board_user :</div>
    <div>${boardView.bUser}</div>
    <div>board_date :</div>
    <div>${boardView.bDate}</div>
    <div style= "float:right;">
        <input type="button" value="수정" onclick="location.href='boardModify?bNum=${boardView.bNum}'">
        <input type="button" value="삭제" onclick="del(${boardView.bNum})">
    </div>
    <br>
    <br>
    <%@ include file="../views/comment.jsp" %>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#btnJoin").click(function(){
		document.form1.action="${path}/member/join.do";
	});
	$("#btnLogin").click(function(){
		document.form1.action="${path}/member/loginCheck.do";
		document.form1.submit();
	});
	$("#btnFind").click(function(){
		document.form1.action="${path}/member/find.do";
	});
});
</script>
<title>메인 페이지</title>
</head>
<body>
<h2>${msg}</h2>
<h3>로그인</h3>
<form name="form1" method="post">
<c:choose>
<c:when test="${msg == 'success'}"> 
	아이디 : ${memberId}<br>
	닉네임 : ${memberName}<br>
	<a href="${path}/member/logout.do">로그아웃</a>
	<a href="${path}/board/list.do">게시판 리스트</a>
</c:when>
<c:otherwise>
아이디 : <input name="memberId" id="memberId" placeholder="아이디를 입력해 주세요">
<br>
비밀번호 :
<input name="memberPw" id="memberPw" type="password">
<button type="button" id="btnLogin">로그인</button><br>
<button id="btnJoin">회원가입</button>
<button id="btnFind">ID/PW 찾기</button>
</c:otherwise>
</c:choose>
</form>

</body>
</html>
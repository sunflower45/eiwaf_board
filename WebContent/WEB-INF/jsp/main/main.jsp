<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>${msg}</h2>
<h3>로그인</h3>
<form name="form1" method="post" action="${path}/member/loginCheck.do">
<c:choose>
<c:when test="${msg == 'success'}"> 
	아이디 : ${memberId}<br>
	닉네임 : ${memberName}<br>
	<a href="${path}/board/list.do">게시판 리스트</a>
</c:when>
<c:otherwise>
아이디 : <input name="memberId" id="memberId" placeholder="아이디를 입력해 주세요">
<br>
비밀번호 :
<input name="memberPw" id="memberPw" type="password">
<button type="submit">로그인</button>
</c:otherwise>
</c:choose>
</form>

</body>
</html>
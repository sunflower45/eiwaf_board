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
<h3>�α���</h3>
<form name="form1" method="post" action="${path}/member/loginCheck.do">
<c:choose>
<c:when test="${msg == 'success'}"> 
	���̵� : ${memberId}<br>
	�г��� : ${memberName}<br>
	<a href="${path}/board/list.do">�Խ��� ����Ʈ</a>
</c:when>
<c:otherwise>
���̵� : <input name="memberId" id="memberId" placeholder="���̵� �Է��� �ּ���">
<br>
��й�ȣ :
<input name="memberPw" id="memberPw" type="password">
<button type="submit">�α���</button>
</c:otherwise>
</c:choose>
</form>

</body>
</html>
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
<title>���� ������</title>
</head>
<body>
<h2>${msg}</h2>
<h3>�α���</h3>
<form name="form1" method="post">
<c:choose>
<c:when test="${msg == 'success'}"> 
	���̵� : ${memberId}<br>
	�г��� : ${memberName}<br>
	<a href="${path}/member/logout.do">�α׾ƿ�</a>
	<a href="${path}/board/list.do">�Խ��� ����Ʈ</a>
</c:when>
<c:otherwise>
���̵� : <input name="memberId" id="memberId" placeholder="���̵� �Է��� �ּ���">
<br>
��й�ȣ :
<input name="memberPw" id="memberPw" type="password">
<button type="button" id="btnLogin">�α���</button><br>
<button id="btnJoin">ȸ������</button>
<button id="btnFind">ID/PW ã��</button>
</c:otherwise>
</c:choose>
</form>

</body>
</html>
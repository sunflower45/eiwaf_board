<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${path}/board/list.do" style="margin-top:10px">�Խ���</a>
<c:choose>
	<c:when test="${sessionScope.memberId != null}">
		<a href="${path}/member/logout.do">�α׾ƿ�</a>		
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.memberId }���� �α������Դϴ�.
	</c:when>
	<c:otherwise>
		<a href="${path}/main.do">�α���</a>
	</c:otherwise>
</c:choose>
</body>
</html>
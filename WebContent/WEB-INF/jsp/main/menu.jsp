<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<a href="${path}/board/list.do">�Խ���</a>
<c:choose>
	<c:when test="${sessionScope.id != null}">
		${sessionScope.id }���� �α������Դϴ�.
		<a href="${path}/member/logout.do">�α׾ƿ�</a>		
	</c:when>
	<c:otherwise>
		<a href="${path}/main.do">�α���</a>
	</c:otherwise>
</c:choose>

</body>
</html>
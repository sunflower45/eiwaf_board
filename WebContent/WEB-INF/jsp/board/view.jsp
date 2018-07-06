<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ����</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")){
				document.form1.action="${path}/board/delete.do";
				document.form1.submit();
			}
		});
		$("#btnUpdate").click(function(){
			location.href = "${path}/board/modify.do?boardBno=${dto.boardBno}";
				
		})
		$("#toList").click(function(){
			location.href = "${path}/board/list.do";
		})
	})
</script>
</head>
<body>
<h2>�Խñ� ����</h2>
<form name="form1" method="post">
	<div>
		�ۼ����� : ${dto.boardRegdate}
	</div>
	<div>
		��ȸ�� : ${dto.boardViewcnt}
	</div>
	<div>
		���� : ${dto.boardTitle}
	</div>
	<div>
		���� : ${dto.boardContent}
	</div>
	<div>
		�̸� : ${dto.boardWriter}
	</div>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<c:if test="${sessionScope.memberName == dto.boardWriter}">
			<button type="button" id="btnUpdate">����</button>
			<button type="button" id = "btnDelete">����</button>
		</c:if>
		<button type="button" id="toList">�������</button>
	</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� �ۼ�</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnSave").click(function(){
			var title = $("#boardTitle").val();
			var content = $("#boardContent").val();
			var writer = $("#boardWriter").val();
			if(title == ""){
				alert("������ �Է��ϼ���");
				document.form1.boardTitle.focus();
				return;
			}
			if(content == ""){
				alert("������ �Է��ϼ���");
				document.form1.boardContent.focus();
				return;
			}
			document.form1.submit();
		});
		$("#toList").click(function(){
            location.href = "${path}/board/list.do";

		});
	})
</script>
</head>
<body>
<h2>�Խñ� �ۼ�</h2>
<form name="form1" method="post" action="${path}/board/insert.do">
	<div>
		����
		<input name="boardTitle" id="boardTitle" size="80" placeholder="������ �Է��� �ּ���">
	</div>
	<div>
		����
		<textarea name="boardContent" id="boardContent" rows="4" cols="80" placeholder="������ �Է��� �ּ���"></textarea>
	</div>
	<div>
		�̸�
		<input name="boardWriter" id="boardWriter" value="${sessionScope.memberName}">
	</div>
	<div style="width:650px; text-align:center;">
		<button type="button" id="btnSave">Ȯ��</button>
		<button type="reset">���</button>
		<button type="button" id="toList">�������</button>
	</div>
</form>
</body>
</html>
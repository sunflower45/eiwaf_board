<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ����</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")){
				document.form1.action="${path}/board/delete.do";
				document.form1.submit();
			}
		});
		

		$("#btnToList").click(function(){
			location.href = "${path}/board/list.do";
		})
		
		
		
		$("#btnUpdete").click(function(){
            alert("�����Ǿ����ϴ�.");
            var title = $("#boardTitle").val();
            var content = $("#boardContent").val();
            var writer = $("#boardWriter").val();
            if(title == ""){
                alert("������ �Է��ϼ���");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("������ �Է��ϼ���");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("�̸��� �Է��ϼ���");
                document.form1.writer.focus();
                return;
            }
            document.form1.action="${path}/board/update.do"
            // ���� �Է��� �����͸� ������ ����
            document.form1.submit();
        });
	})
</script>
</head>
<body style="margin-left:20px">
<h2>�Խñ� ����</h2>
<form name="form1" method="post">
<table class="table" style="width:800px">
	<tr>
		<td>�ۼ�����</td>
		<td>${dto.boardRegdate}</td>
	</tr>
	<tr>
		<td>��ȸ��</td>
		<td>${dto.boardViewcnt}</td>
	</tr>
	<tr>
		<td>����</td>
		<td><input name="boardTitle" class="form-control" id="boardTitle" size="80" value="${dto.boardTitle}" placeholder="������ �Է����ּ���"></td>
	</tr>
	<tr>
		<td>����</td>
		<td><textarea name="boardContent"  class="form-control" id="boardContent" rows="4" cols="80" placeholder="������ �Է����ּ���">${dto.boardContent}</textarea></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td>${dto.boardWriter}</td>
	</tr>
</table>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<button type="button" id="btnUpdete" class="btn btn-success">����</button>
		<button type="button" id = "btnDelete" class="btn btn-success">����</button>
		<button type="button" id="btnToList" class="btn btn-success">�������</button>
	</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		���� :
		<input name="boardTitle" id="boardTitle" size="80" value="${dto.boardTitle}" placeholder="������ �Է����ּ���">
	</div>
	<div>
		���� :
		<textarea name="boardContent" id="boardContent" rows="4" cols="80" placeholder="������ �Է����ּ���">${dto.boardContent}</textarea>
	</div>
	<div>
		�̸� : 
		<input name="boardWriter" id="boardWriter" value="${dto.boardWriter}">
	</div>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<button type="button" id="btnUpdete">����</button>
		<button type="button" id = "btnDelete">����</button>
		
			<button type="button" id="btnToList">�������</button>
	</div>
</form>
</body>
</html>
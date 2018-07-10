<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 작성</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#btnSave").click(function(){
			var title = $("#boardTitle").val();
			var content = $("#boardContent").val();
			var writer = $("#boardWriter").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.boardTitle.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요");
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
<body style="margin-left:20px">
<h2>게시글 작성</h2>
<form name="form1" method="post" action="${path}/board/insert.do">

	<table class="table" style="width:800px">
		<tr>
			<td>제목</td>
			<td><input name="boardTitle" class="form-control"  id="boardTitle" size="80" placeholder="제목을 입력해 주세요"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="boardContent" class="form-control"  id="boardContent" rows="4" cols="80" placeholder="내용을 입력해 주세요"></textarea></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${sessionScope.memberName}
		</tr>
	</table>
	<div style="width:650px; text-align:center;">
		<button type="button" class="btn btn-success" id="btnSave">확인</button>
		<button type="reset" class="btn btn-success" >취소</button>
		<button type="button" class="btn btn-success" id="toList">목록으로</button>
	</div>
</form>
</body>
</html>
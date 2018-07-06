<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 작성</title>
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
<body>
<h2>게시글 작성</h2>
<form name="form1" method="post" action="${path}/board/insert.do">
	<div>
		제목
		<input name="boardTitle" id="boardTitle" size="80" placeholder="제목을 입력해 주세요">
	</div>
	<div>
		내용
		<textarea name="boardContent" id="boardContent" rows="4" cols="80" placeholder="내용을 입력해 주세요"></textarea>
	</div>
	<div>
		이름
		<input name="boardWriter" id="boardWriter" value="${sessionScope.memberName}">
	</div>
	<div style="width:650px; text-align:center;">
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
		<button type="button" id="toList">목록으로</button>
	</div>
</form>
</body>
</html>
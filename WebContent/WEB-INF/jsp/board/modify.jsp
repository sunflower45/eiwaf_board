<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 보기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/board/delete.do";
				document.form1.submit();
			}
		});
		

		$("#btnToList").click(function(){
			location.href = "${path}/board/list.do";
		})
		
		
		
		$("#btnUpdete").click(function(){
            alert("수정되었습니다.");
            var title = $("#boardTitle").val();
            var content = $("#boardContent").val();
            var writer = $("#boardWriter").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            document.form1.action="${path}/board/update.do"
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
	})
</script>
</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post">
	<div>
		작성일자 : ${dto.boardRegdate}
	</div>
	<div>
		조회수 : ${dto.boardViewcnt}
	</div>
	<div>
		제목 :
		<input name="boardTitle" id="boardTitle" size="80" value="${dto.boardTitle}" placeholder="제목을 입력해주세요">
	</div>
	<div>
		내용 :
		<textarea name="boardContent" id="boardContent" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.boardContent}</textarea>
	</div>
	<div>
		이름 : 
		<input name="boardWriter" id="boardWriter" value="${dto.boardWriter}">
	</div>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<button type="button" id="btnUpdete">수정</button>
		<button type="button" id = "btnDelete">삭제</button>
		
			<button type="button" id="btnToList">목록으로</button>
	</div>
</form>
</body>
</html>
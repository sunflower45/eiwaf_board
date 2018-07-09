<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 보기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		listReply();
		
		
		$("#btnReply").click(function(){
			replyJson();
		});
		
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
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
	
	
	
	function replyJson(){
		var replyText = $("#replyText").val();
		var boardBno = "${dto.boardBno}";
		$.ajax({
			method:"post",
			url : "http://localhost:8080/reply/insert.do",
			data : { boardBno : boardBno,replyText : replyText },
			success : function(){
				alert('댓글이 등록되었습니다.');
				listReply();
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        }
		})
	}
	
	
 	function listReply(){
		$.ajax({
			method : 'get',
			url : "http://localhost:8080/reply/list.do?replyBno=${dto.boardBno}",
			
			success : function(result) {
				$("#listReply").html(result);	
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        }
		})
	}
	 
	 
	 function reply(){
		var replyText = $("#replyText").val();
		var boardBno = "${dto.boardBno}";
		//var param = "replyText="+replyText+"&boardBno="+boardBno;
		$.ajax({
			method:'post',
			url:"http://localhost:8080/reply/insert.do",
			data:{replyText : replyText, boardBno : boardBno},
			success : function(){
				alert('댓글이 등록되었습니다.');
				listReply();
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        }
		})
	}
	
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
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
		제목 : ${dto.boardTitle}
	</div>
	<div>
		내용 : ${dto.boardContent}
	</div>
	<div>
		이름 : ${dto.boardWriter}
	</div>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<c:if test="${sessionScope.memberName == dto.boardWriter}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id = "btnDelete">삭제</button>
		</c:if>
		<button type="button" id="toList">목록으로</button>
	</div>
</form>
<div style="width:650px;text-align:center;">
	<br>
	<c:if test="${sessionScope.memberId != null}">
		<textarea rows="5" cols="80" id="replyText" placeholder="댓글을 작성해주세요"></textarea>
		<br>
		<button type="button" id="btnReply">댓글 작성</button>
	</c:if>
</div>
<div id="listReply"></div>
</body>
</html>
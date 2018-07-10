<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

$("#btnReplyUpdate").click(function(){
	replyUpdate();
});

function replyUpdate(){
	var replyText = $("#replyText2").val();
	var replyRno = $("#replyRno").val();
	console.log("replyRno : "+replyRno);
	console.log("replyText : "+replyText);
	$.ajax({
		method:'post',
		url : "http://localhost:8080/reply/update.do",
		data : {replyText : replyText, replyRno : replyRno},
		success : function(result){
			console.log(result);
			$("#modifyReply").css("visibility", "hidden");
			listReply();
		},
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
	})
}
$("#btnReplyDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			method : 'delete',
			url : "http://localhost:8080/reply/delete.do?replyRno=${vo.replyRno}",
			success : function(result){
				console.log(result);
				alert("삭제되었습니다.");
				$("#modifyReply").css("visibility", "hidden");
				listReply();
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	        }
		})
	}
});

$("#btnReplyClose").click(function(){
	$("#modifyReply").css("visibility", "hidden");
});
</script>
</head>
<body>
댓글 번호 : ${vo.replyRno }<br>
<textarea style="width:400px" class="form-control" id="replyText2" name="replyText2" rows="5" cols="82">
	${vo.replyText}
</textarea>
<input type="hidden" name="replyRno" id = "replyRno" value="${vo.replyRno}">

<div>
	<c:if test="${sessionScope.memberId == vo.replyer }">
		<button style="margin-top:10px" class="btn btn-success btn-xs" type="button" id="btnReplyUpdate">수정</button>
		<button style="margin-top:10px"  class="btn btn-success btn-xs"type="button" id="btnReplyDelete">삭제</button>

	</c:if>
	<button style="margin-top:10px"  class="btn btn-success btn-xs" type="button" id="btnReplyClose">닫기</button>
</div>
</body>
</html>
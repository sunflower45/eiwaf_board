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
	if(confirm("�����Ͻðڽ��ϱ�?")){
		$.ajax({
			method : 'delete',
			url : "http://localhost:8080/reply/delete.do?replyRno=${vo.replyRno}",
			success : function(result){
				console.log(result);
				alert("�����Ǿ����ϴ�.");
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
��� ��ȣ : ${vo.replyRno }<br>
<textarea id="replyText2" name="replyText2" rows="5" cols="82">
	${vo.replyText }
</textarea>
<input type="hidden" name="replyRno" id = "replyRno" value="${vo.replyRno}">

<div style="text-align:center;">
	<c:if test="${sessionScope.memberId == vo.replyer }">
		<button type="button" id="btnReplyUpdate">����</button>
		<button type="button" id="btnReplyDelete">����</button>

	</c:if>
	<button type="button" id="btnReplyClose">�ݱ�</button>
</div>
</body>
</html>
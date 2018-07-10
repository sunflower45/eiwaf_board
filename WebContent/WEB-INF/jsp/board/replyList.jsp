<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
function showReplyModify(replyRno){
	
	$.ajax({
		method:'get',
		url:"${path}/reply/detail.do?replyRno="+replyRno,
		success : function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility", "visible");
		},
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
	})
}
</script>
</head>
<body>

	<table style="width:700px">
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.replyer} ${row.replyRegdate}
				<br>
				${row.replyText}
				<br>
				<c:if test="${sessionScope.memberId==row.replyer}">
					<input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.replyRno}')">
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
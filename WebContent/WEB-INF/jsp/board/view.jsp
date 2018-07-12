<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/eiwaf/eiwaf-1.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/util.comn.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/sample.comn.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/sample.menu.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
				
		});
		
		$("#toList").click(function(){
			location.href = "${path}/board/list.do";
		});
		
		
		
	})
	
	
	
	function replyJson(){
		
		var f = document.form1;
		var result = svcf_Ajax("http://localhost:8080/reply/insert.do", f, {
			async : false,
			procType : "R"
		});
		svcf_SyncCallbackFn(result, replyJsonCallback);
	}
	function replyJsonCallback(status, data){
		alert('댓글이 등록되었습니다.');
		listReply();
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
<body style="margin-top:10px;margin-left:20px">
<jsp:include page="../main/menu.jsp" ></jsp:include>

<h2 >게시글 보기</h2>
<form name="form1" method="post">
	<table style="width:800px;" class="table table-striped">
		<tr>
			<td style="width:200px">작성일자</td>
			<td>${dto.boardRegdate}
			</td>
		</tr>
		<tr>
			<td style="width:200px">조회수</td>
			<td>${dto.boardViewcnt}</td>
		</tr>
		<tr>
			<td style="width:200px">제목</td>
			<td>${dto.boardTitle}</td>
		</tr>
		<tr>
			<td style="width:200px">내용</td>
			<td>${dto.boardContent}</td>
		</tr>
		
		<tr>
			<td style="width:200px">이름</td>
			<td> ${dto.boardWriter}</td>
		</tr>
	</table>

	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<input type="hidden" name="replyer" value="${sessionScope.memberName}">
		<c:if test="${sessionScope.memberName == dto.boardWriter}">
			<button type="button"  style="margin-left:300px" id="btnUpdate" class="btn btn-success">수정</button>
			<button type="button" id = "btnDelete" class="btn btn-success">삭제</button>
		</c:if>
		<button type="button" id="toList" class="btn btn-success">목록으로</button>
	</div>
<div style="width:650px;text-align:center;">

	<br>
	<c:if test="${sessionScope.memberId != null}">
		<textarea rows="5" style="margin-left:100px" cols="80" name="replyText" id="replyText" class="form-control" placeholder="댓글을 작성해주세요"></textarea>
		<br>
		<button type="button" id="btnReply" style="margin-left:150px" class="btn btn-success" >댓글 작성</button>
	</c:if>
</div>
</form>

<div id="listReply"></div>
</body>
</html>
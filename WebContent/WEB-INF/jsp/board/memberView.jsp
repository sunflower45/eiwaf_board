<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			location.href="${path}/member/delete.do?memberId=${dto.memberId}";
			
		}
	})
	
	$("#toList").click(function(){
		location.href="${path}/member/admin.do";
	})
})
</script>
<title>회원 정보 수정</title>
</head >
<body style="margin-top:10px;margin-left:20px">
<jsp:include page="../main/menu.jsp" ></jsp:include>
<h2 style="margin-left:150px">회원 정보 수정</h2>
<form name="from1" method="post" action="${path}/member/update.do">
	<table class="table" style="width:500px">
		<tr>
			<td>아이디</td>
			<td><input name="memberId" value="${dto.memberId}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="memberPw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="memberName" value="${dto.memberName }"></td>
		</tr>
		<tr>
			<td>이메일 주소</td>
			<td><input name="memberEmail" value="${dto.memberEmail}"></td>
		</tr>
		<tr>
			<td>회원가입일자</td>
			<td><input value="${dto.memberRegdate}" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit"  id="btnUpdate" class="btn btn-success">수정</button>
				<button type="button" id="btnDelete" class="btn btn-success">삭제</button>
				<button type="button" id="toList" class="btn btn-success">목록으로</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
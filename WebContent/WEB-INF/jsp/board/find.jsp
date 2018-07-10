<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 찾기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

$(document).on('click', '#toLogin', function(){
	location.href = "${path}/main.do";

})
$(document).on('click','#findId',function(){
	var memberName = $('#memberName1').val();
	var memberEmail = $('#memberEmail').val();
	$.ajax({
        url:'http://localhost:8080/member/findId.do',
        method:'POST',
        data: {memberName : memberName ,  memberEmail : memberEmail},
        success:function(data){
        	alert("회원님의 정보로 등록된 아이디는 : "+data.memberId+" 입니다.");

        },
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
    });
	$("#memberName").val("");
	$("#memberEmail").val("");
});
$(document).on('click','#findPw',function(){
	var memberName = $('#memberName2').val();
	var memberId = $('#memberId').val();
	console.log(memberName, memberId);
	$.ajax({
        url:'http://localhost:8080/member/findPw.do',
        method:'POST',
        type:'text',
        data: {memberName : memberName ,  memberId : memberId},
        success:function(data){
        	console.log(data);
        	alert("회원님의 정보로 등록된 아이디는 : "+data.memberPw+" 입니다.");

        },
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
    });
	$("#memberName").val("");
	$("#memberId").val("");
});

</script>
</head>
<body>
<h1 style="margin-left:50px">회원정보 찾기</h1>

<form method='post'>
	<table style="width:400px" class="table">
		<tr>
			<td for="text">이름</td>
			<td><input class="form-control" type="text" id="memberName1"></td>
		</tr>
		
		<tr>
			<td for="text">이메일</td>
			<td><input class="form-control"  type="text" id="memberEmail"></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-default" id="findId" value="아이디 찾기">
			</td>
			<td></td>
		</tr>
	</table>
	
</form>

<form method='post'>
	
<br><br><br>
	<table style="width:400px" class="table">
		<tr>
			<td for="text">이름</td>
			<td><input class="form-control"  type="text" id="memberName2"></td>
		</tr>
		
		<tr>
			<td for="text">아이디</td>
			<td><input class="form-control"  type="text" id="memberId"></td>
		</tr>
		<tr>
			<td><input type="button"  class="btn btn-default" id="findPw" value="비밀번호 찾기">
			</td>
			<td></td>
		</tr>
	</table>
</form>

<input style="margin-left:150px" type="button"  class="btn btn-default" id="toLogin" value="로그인 화면">
</body>
</html>
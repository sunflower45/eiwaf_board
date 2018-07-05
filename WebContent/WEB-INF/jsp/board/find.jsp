<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 찾기</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>


$(document).on('click','#findId',function(){
	var memberName = $('#memberName1').val();
	var memberEmail = $('#memberEmail').val();
	$.ajax({
        url:'http://localhost:8080/member/findId.do',
        method:'POST',
        type:'text',
        data: {memberName : memberName ,  memberEmail : memberEmail},
        success:function(data){
        	$("#idList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+data.memberId+" 입니다.</h1>");

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
        	$("#idList").append("<h1>"+"회원님의 정보로 등록된 비밀번호는 : "+data.memberPw+" 입니다.</h1>");

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
<h1>회원정보 찾기</h1>

<form method='post'>
	
	<label for="text">이름 : </label>
	<input type="text" id="memberName1">
	<br>
	<label for="text">이메일 : </label>
	<input type="text" id="memberEmail">
	
	<br>
	<input type="button" id="findId" value="아이디 찾기">
	<br><br>
</form>
<form method='post'>
	
	<label for="text">이름 : </label>
	<input type="text" id="memberName2">
	<br>
	<label for="text">아이디 : </label>
	<input type="text" id="memberId">
	
	<br>
	<input type="button" id="findPw" value="비밀번호 찾기">
	<br><br>
</form>



<ul id="idList"></ul>

<ul id="pwList"></ul>
</body>
</html>
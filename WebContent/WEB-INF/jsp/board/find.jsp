<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ã��</title>
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
        	$("#idList").append("<h1>"+"ȸ������ ������ ��ϵ� ���̵�� : "+data.memberId+" �Դϴ�.</h1>");

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
        	$("#idList").append("<h1>"+"ȸ������ ������ ��ϵ� ��й�ȣ�� : "+data.memberPw+" �Դϴ�.</h1>");

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
<h1>ȸ������ ã��</h1>

<form method='post'>
	
	<label for="text">�̸� : </label>
	<input type="text" id="memberName1">
	<br>
	<label for="text">�̸��� : </label>
	<input type="text" id="memberEmail">
	
	<br>
	<input type="button" id="findId" value="���̵� ã��">
	<br><br>
</form>
<form method='post'>
	
	<label for="text">�̸� : </label>
	<input type="text" id="memberName2">
	<br>
	<label for="text">���̵� : </label>
	<input type="text" id="memberId">
	
	<br>
	<input type="button" id="findPw" value="��й�ȣ ã��">
	<br><br>
</form>



<ul id="idList"></ul>

<ul id="pwList"></ul>
</body>
</html>
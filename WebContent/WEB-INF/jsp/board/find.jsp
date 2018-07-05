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
	var name = $('#memberName').val();
	var email = $('#memberEmail').val();
 	var postData = {memberName : name ,  memberEmail : email};
 	console.log(postData);
	$.ajaxSettings.traditional = true;
	$.ajax({
        url:'http://localhost:8080/member/findId.do',
        type:'POST',
        data: JSON.stringify(postData),
        contextType : 'application/json',
        success:function(data){
        	alert("ajax 완료");
        	var memberId = data.memberId;
       	 	$("#idList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+memberId+" 입니다.</h1>");

        },
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
    });
});

</script>
</head>
<body>
<h1>회원정보 찾기</h1>
<form method='post'>
	
	<label for="text">이름 : </label>
	<input type="text" id="memberName">
	<br>
	<label for="text">이메일 : </label>
	<input type="text" id="memberEmail">
	
	<button id="findId" type="submit">아이디 찾기</button><br><br>
</form>

<span id="idList"></span>

</body>
</html>
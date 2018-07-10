<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).on('click', '#toLogin', function(){
	location.href = "${path}/main.do";

})
$(document).ready(function () {
	//[1] lblError 레이어 클리어
    $('#memberPw').keyup(function () {
        // $('#lblError').remove(); // 제거
        $('#lblError').text(''); // 클리어
    });
    //[2] 암호 확인 기능 구현
    $('#memberPwCheck').keyup(function () {
        if ($('#memberPw').val() != $('#memberPwCheck').val()) {
            $('#lblError').text(''); // 클리어
            $('#lblError').html("<b>암호가 틀립니다.</b>"); // 레이어에 HTML 출력
        }
        else {
            $('#lblError').text(''); // 클리어
            $('#lblError').html("<b>암호가 맞습니다.</b>"); // 레이어에 텍스트 출력
        }
    });

});
$(document).on('click', '#idCheck', function(){
    	var memberId = $("#memberId").val();
    	$.ajax({
    		method : 'POST',
    		async: true,
    		data : {memberId : memberId},
    		url : 'http://localhost:8080/member/idCheck.do',
    		success : function(data){
    			if(data.cnt == "1"){
    				alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
    				$("#memberId").focus();
    			} else {
    				alert("사용 가능한 아이디입니다.");
    				$("#memberPw").focus();
    			} 
    		},
    		error : function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
    	})
});
</script>
</head>
<body>
<h1 style="margin-left:10px">회원가입 페이지</h1>
  <form id="form1" action="${path}/member/joinUpdate.do" method="post">
	<table class="table" style="margin-left:10px;width:800px;">
		<tr>
			<td>아이디</td>
			<td><input class="form-control" type="text" id="memberId" name="memberId">
			<button id="idCheck"class="btn btn-default"  style="margin-top:10px;" type="button">아이디 중복 검사</button>
			</td>
			
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input  class="form-control"  type="password" id="memberPw" name="memberPw"></td>
		</tr>
		
		<tr>
			<td>비밀번호 확인 &nbsp;</td>
			<td><input  class="form-control"  type="password" id="memberPwCheck" name="memberPwCheck">
			<div style="margin-top:10px" id="lblError">
					암호를 입력하세요
			</div>
			</td>
			
		</tr>
		<tr>
			<td>이름</td>
			<td><input class="form-control"  type="text" id="memberName" name="memberName"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input class="form-control"  type="text" name="memberEmail" id="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button class="btn btn-default" type="submit" id="submitBtn" >가입하기</button>&nbsp;&nbsp;&nbsp;
			<input  class="btn btn-default" type="reset" value="다시작성">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default" id="toLogin" type="button" value="로그인 화면">
			</td>
			
		</tr>
	</table>
	
</form>
</body>
</html>
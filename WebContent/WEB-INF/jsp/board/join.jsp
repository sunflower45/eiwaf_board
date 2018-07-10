<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">


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
    		data : {memberId : memberId},
    		type : 'text',
    		contentType:"application/json; charset=utf-8",
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
<h1>회원가입 페이지</h1>
  <form id="form1" action="${path}/member/joinUpdate.do" method="post">
	<table>
		<tr>
			
			<td>아이디</td>
			<td><input type="text" id="memberId" name="memberId"></td>
			<td id="exist"></td>
			<td><button id="idCheck" type="button">아이디 중복 검사</button></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="memberPw" name="memberPw"></td>
		</tr>
		
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="memberPwCheck" name="memberPwCheck"></td>
		</tr>
		<tr>
			<td>
				<div id="lblError">
					암호를 입력하세요
				</div>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="memberName" name="memberName"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="memberEmail" id="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button type="submit" id="submitBtn" >가입하기</button><input type="reset" value="다시작성"></td>
		</tr>
	</table>
	
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
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
</script>
</head>
<body>
<h1>회원가입 페이지</h1>
<form action="/member/joinUpdate.do" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberId"></td>
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
			<td><input type="text" name="memberName"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="가입하기"><input type="reset" value="다시작성"></td>
		</tr>
	</table>
	
</form>
</body>
</html>
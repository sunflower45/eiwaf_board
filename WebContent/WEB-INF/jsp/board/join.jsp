<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    //[1] lblError ���̾� Ŭ����
    $('#memberPw').keyup(function () {
        // $('#lblError').remove(); // ����
        $('#lblError').text(''); // Ŭ����
    });
    //[2] ��ȣ Ȯ�� ��� ����
    $('#memberPwCheck').keyup(function () {
        if ($('#memberPw').val() != $('#memberPwCheck').val()) {
            $('#lblError').text(''); // Ŭ����
            $('#lblError').html("<b>��ȣ�� Ʋ���ϴ�.</b>"); // ���̾ HTML ���
        }
        else {
            $('#lblError').text(''); // Ŭ����
            $('#lblError').html("<b>��ȣ�� �½��ϴ�.</b>"); // ���̾ �ؽ�Ʈ ���
        }
    });
});
</script>
</head>
<body>
<h1>ȸ������ ������</h1>
<form action="/member/joinUpdate.do" method="post">
	<table>
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="memberId"></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="password" id="memberPw" name="memberPw"></td>
		</tr>
		
		<tr>
			<td>��й�ȣ Ȯ��</td>
			<td><input type="password" id="memberPwCheck" name="memberPwCheck"></td>
		</tr>
		<tr>
			<td>
				<div id="lblError">
					��ȣ�� �Է��ϼ���
				</div>
			</td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><input type="text" name="memberName"></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input type="text" name="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="�����ϱ�"><input type="reset" value="�ٽ��ۼ�"></td>
		</tr>
	</table>
	
</form>
</body>
</html>
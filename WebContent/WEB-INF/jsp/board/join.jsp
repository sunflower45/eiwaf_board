<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
    				alert("���̵� �����մϴ�. �ٸ� ���̵� �Է����ּ���.");
    				$("#memberId").focus();
    			} else {
    				alert("��� ������ ���̵��Դϴ�.");
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
<h1>ȸ������ ������</h1>
  <form id="form1" action="${path}/member/joinUpdate.do" method="post">
	<table>
		<tr>
			
			<td>���̵�</td>
			<td><input type="text" id="memberId" name="memberId"></td>
			<td id="exist"></td>
			<td><button id="idCheck" type="button">���̵� �ߺ� �˻�</button></td>
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
			<td><input type="text" id="memberName" name="memberName"></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input type="text" name="memberEmail" id="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button type="submit" id="submitBtn" >�����ϱ�</button><input type="reset" value="�ٽ��ۼ�"></td>
		</tr>
	</table>
	
</form>
</body>
</html>
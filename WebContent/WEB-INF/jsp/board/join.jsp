<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).on('click', '#toLogin', function(){
	location.href = "${path}/main.do";

})
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
    		async: true,
    		data : {memberId : memberId},
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
<h1 style="margin-left:10px">ȸ������ ������</h1>
  <form id="form1" action="${path}/member/joinUpdate.do" method="post">
	<table class="table" style="margin-left:10px;width:800px;">
		<tr>
			<td>���̵�</td>
			<td><input class="form-control" type="text" id="memberId" name="memberId">
			<button id="idCheck"class="btn btn-default"  style="margin-top:10px;" type="button">���̵� �ߺ� �˻�</button>
			</td>
			
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input  class="form-control"  type="password" id="memberPw" name="memberPw"></td>
		</tr>
		
		<tr>
			<td>��й�ȣ Ȯ�� &nbsp;</td>
			<td><input  class="form-control"  type="password" id="memberPwCheck" name="memberPwCheck">
			<div style="margin-top:10px" id="lblError">
					��ȣ�� �Է��ϼ���
			</div>
			</td>
			
		</tr>
		<tr>
			<td>�̸�</td>
			<td><input class="form-control"  type="text" id="memberName" name="memberName"></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input class="form-control"  type="text" name="memberEmail" id="memberEmail"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button class="btn btn-default" type="submit" id="submitBtn" >�����ϱ�</button>&nbsp;&nbsp;&nbsp;
			<input  class="btn btn-default" type="reset" value="�ٽ��ۼ�">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default" id="toLogin" type="button" value="�α��� ȭ��">
			</td>
			
		</tr>
	</table>
	
</form>
</body>
</html>
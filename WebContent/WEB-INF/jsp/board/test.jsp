<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).on('click', '#btn', function(){
	var id = $("#id").val();
	$.ajax({
		url:"http://localhost:8080/member/ajax.do",
		method : "post",
		type : "text",
		data : {id : id},
		success : function(data) {
			alert("success"+data);
			console.log(data.id);
			$("#list").append(data.id);
		},
		error : function(request, status, error ){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
	});
	$("#id").val("");
})
</script>
</head>
<body>
<form method="POST">
	이름: <input type="text" id="id" /> <br/>
	
	<input type="button" id="btn" value="SEND">
</form>
<ul id="list"></ul>

</body>
</html>
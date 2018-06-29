<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/board/write.do";
        });
    });
</script>
</head>
<body>
<h2>게시글 목록</h2>
<button type="button" id="btnWrite">글쓰기</button>
<table border="1" width="600px">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>이름</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <tr>
</table>
</body>
</html>
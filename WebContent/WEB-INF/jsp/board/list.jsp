<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
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
<jsp:include page="../main/menu.jsp" ></jsp:include>
	<h2>${sessionScope.memberId} 님 안녕하세요</h2>
	<h2>게시글 목록</h2>
	<form name="form1" method="post" action="${path}/board/list.do">
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"></c:out> >제목+내용</option>
			<option value="board_writer" <c:out value="${map.searchOption == 'board_writer'?'selected':''}"/> >이름</option>
			<option value="board_content" <c:out value="${map.searchOption == 'board_content'?'selected':''}"></c:out> >내용</option>
            <option value="board_title" <c:out value="${map.searchOption == 'board_title'?'selected':''}"></c:out> >제목</option>
		</select>
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="조회">
	<c:if test="${sessionScope.memberId != null}">
		<button type="button" id="btnWrite">글쓰기</button>
	</c:if>
	</form>
	${map.count} 개의 게시물이 있습니다.
	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.boardBno}</td>
				<td><a href="/board/view.do?boardBno=${row.boardBno}">${row.boardTitle}</a></td>
				<td>${row.boardWriter}</td>
				<td>${row.boardRegdate}</td>
				<td>${row.boardViewcnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color:red">${num }</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a> $nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>

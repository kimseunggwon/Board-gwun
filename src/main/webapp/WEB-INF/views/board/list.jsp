<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board"%>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
</style>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>

<script>
	$(document).ready(
			function() {

				var result = '<c:out value="${result}"/>';

				checkModal(result);
				
				history.replaceState({}, null,null);

				function checkModal(result) {

					if (result === '' || history.state) {
						return;
					}
					
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					
					$("#myModal").modal("show");
				}
				
				// PageNation
				$("#list-pagenation1 a").click(function(e) {
					// 기본 액션 중지 (hyperlink 역할 안함)
					e.preventDefault();
					
					console.log("a요소 클릭됨");
					
					var actionForm = $("#actionForm");
					
					// form의 pageNum input의 값을 a 요소의 href값으로 변경
					actionForm.find("[name=pageNum]").val($(this).attr("href"));
					
					// submit
					actionForm.submit();
				});
				
			});
	
	
	
</script>

</head>

<style type="text/css">
 
 @font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style> 
 
<body>

	<bd:navbar />
	<div class="container">
       <h1>글 목록</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>

              <tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno }</td>
					<td>
					
					
					
					
					<c:url value="/board/get" var="getUrl">
						<c:param name="bno" value="${board.bno }" />
						<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
						<c:param name="amount" value="${pageMaker.cri.amount }" />
						<c:param name="type" value="${pageMaker.cri.type }"	/>
						<c:param name="keyword" value="${pageMaker.cri.keyword }" />
						
					</c:url>
					
					
					<a href="${getUrl}">
						${board.title } 
						<c:if test="${board.replyCnt > 0 }">
							[${board.replyCnt }]
						</c:if>
						
					</a>
					
					</td> 
					<td>${board.writerName }</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/>
					</td>
				</tr>
			</c:forEach>			
		</tbody>
		
	</table>
</div>
			
			<!-- 모달 -->

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"></h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		
		
		<!--  pagenation -->
<div>
<nav aria-label="Page navigation example">
  <ul id="list-pagenation1" class="pagination justify-content-center">
  
  	<c:if test="${pageMaker.prev }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
	    </li>
  	</c:if>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
	<%-- href value
	href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"
	 --%>
	    <li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
	    href="${num }">${num }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
	    </li>
	</c:if>
  </ul>
</nav>
 
<%-- 페이지 링크용 form    검색후  페이지를 이동해서 동일한 검색 사항들 유지되도록       --%>
<div style="display: none;">
	<form id="actionForm" action="${appRoot }/board/list" method="get">
		<input name="pageNum" value="${cri.pageNum }" />
		<input name="amount" value="${cri.amount }" />
		<input name="type" value="${cri.type }" />
		<input name="keyword" value="${cri.keyword }" />
	</form>
</div>

</div>
		
</body>
</html>





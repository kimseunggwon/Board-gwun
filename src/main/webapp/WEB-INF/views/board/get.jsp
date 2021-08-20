<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html> 
<head>
 
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>

<!-- 댓글 입력 모달 설정 -->
<script>
var appRoot = "${appRoot}";
var boardBno = "${board.bno}";
var userid = "${pinfo.member.userid}";
</script>

<!-- funciton ajax  -->
<script src="${appRoot }/resources/js/get.js"></script>


<script>
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "${appRoot}/board/modify").submit();
			});
			
			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "${appRoot }/board/list");
				operForm.submit();
				 
			});
		});
	</script>

</head>
<body>

<bd:navbar />
<div class="container">

	<h1>Board Read Page</h1>
	
	<div class="row">
		<div class="col-12">
			<form>
				<div class="form-group">
					<label >Bno</label> <input class="form-control" name='bno'
					 value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label >Title</label> <input class="form-control" name='title'
					 value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label >Text area</label> <textarea class="form-control" name='content'
					 readonly="readonly"> <c:out value="${board.content }" /></textarea> 
				</div>
				
				<c:if test="${not empty board.fileName }">
					<div>
						<img class="img-fluid" 
						src="${imgRoot}${board.bno }/${board.fileName}">
					</div>
				</c:if> 
				
				<div class="form-group">
					<label >Writer</label> <input class="form-control" name='writer'
					 value='<c:out value="${board.writer }"/>' readonly="readonly">
				</div>
				
				<button type="button" data-oper='modify' class="btn btn-primary">수정/삭제하기</button>
				
				
			</form>
			
				<form id='operForm' action="${appRoot }/board/modify" method="get">
				 <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>' />
				</form>
				
		</div>
	</div>
</div>

<!--  댓글 쓰기 버튼  -->
<div class="container">
	<div class="row">
		<div class="col-12">
			<h3>댓글 </h3>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reply-insert-modal">댓글 작성</button>
			<ul class="list-unstyled" id="reply-list-container">
			
			</ul>
		</div>
	</div>
</div>  
 

<!-- 댓글 입력 모달 -->

<div class="modal fade" id="reply-insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 댓글</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <input type="text" value="${board.bno }" readonly hidden id="reply-bno-input1">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="text" readonly value="${pinfo.member.userName }" class="form-control" />
            <input type="hidden" value="${pinfo.member.userid }" class="form-control" id="reply-replyer-input1">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">댓글</label>
            <textarea class="form-control" id="reply-reply-textarea1"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="reply-insert-btn1" type="button" class="btn btn-primary">댓글 입력</button>
      </div>
    </div>
  </div>
</div>




</body>
</html>
















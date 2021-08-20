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

<script> 
$(document).ready(function(){
	
	var formObj = $("#modify-form");	
	
	$('button').on('click',function(e){
		
		e.preventDefault();
		
		var operation =$(this).data("oper");
		
		console.log(operation); 
		
		if(operation === 'remove'){
			formObj.attr("action", "${appRoot}/board/remove");
		}else if(operation === 'list'){
			//move to list
			formObj.attr("action", "${appRoot}/board/list").attr("method","get");
			formObj.empty();
		} 
		
		formObj.submit();
	});
});

</script>

</head>
<body>
<bd:navbar />
<div class="container">	
   
   <h1>Board modify Page</h1>
	
	<div class="row">
		<div class="col-12">
			<form id="modify-form" role="form" action="${appRoot }/board/modify" method="post" enctype="multipart/form-data">
			
				<div class="form-group">
					<label >Bno</label> 
					<input class="form-control" name='bno'
					 value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label >Title</label> <input class="form-control" name='title'
					 value='<c:out value="${board.title }"/>'>
				</div>
				
				<div class="form-group">
					<label >Text area</label>
			    <textarea class="form-control" name='content'> <c:out value="${board.content }" /></textarea> 
				</div> 
				
				<c:if test="${not empty board.fileName }">
					<div>
						<img class="img-fluid" 
						src="${imgRoot}${board.bno }/${board.fileName}">
					</div>
				</c:if>
				<div class="form-group">
					<label for="input3">파일</label>
					<input id="input3" class="form-control" type="file" name="file" accept="image/*">
				</div>
				
				<div class="form-group">
					<label >Writer</label> <input class="form-control" name='writer'
					 value='<c:out value="${board.writer }"/>' readonly="readonly" >
				</div>
				
				<div class="form-group">
					<label >RegDate</label> 
					<input class="form-control" name='regDate'
					 value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.
					 regdate }" />' readonly="readonly">
				</div>
				
				
				<div class="form-group">
					<label >Update Date</label> 
					<input class="form-control" name='updateDate'
					 value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.
					 updateDate }" />' readonly="readonly">
				</div>
				
				
				<button type="submit" data-oper='modify' class="btn btn-primary">modify</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">remove</button>
				<button type="submit" data-oper='list' class="btn btn-info">list</button>
				
				
			</form>
		</div>
	</div>
</div>
   
   
</div>
</body>
</html>







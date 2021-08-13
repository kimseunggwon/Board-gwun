<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html> 
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>

<bd:navbar />
<div class="container">

	<h1>글 쓰기</h1> 
	
	<div class="row">
		<div class="col-12">
			<form role="form" action="${appRoot }/board/register" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label >제목</label>
					<input id="input1" class="form-control" name="title">
				</div>
				<div class="form-group"> 
					<label >내용</label>
					<textarea id="textarea1" class="form-control" name="content"></textarea>
				</div>
				<div class="form-group"> 
					<label >작성자</label>
					<textarea id="textarea1" class="form-control" name="writer"></textarea>
				</div>
				<div class="form-group"> 
					<label for="input3">파일</label>
					<input id="input3" class="form-control" type="file" name="file" accept="image/*">
				</div>
				
				<button type="submit" class="btn btn-primary">글 쓰기</button>
				<button type="reset" class="btn btn-info">초기화</button>
				
				
			</form>
		</div>
	</div>
</div>
</body>
</html>
















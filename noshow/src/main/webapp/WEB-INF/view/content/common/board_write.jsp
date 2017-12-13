<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function() {

		$("#submit").click(function() {
			if (confirm("등록하시겠습니까?")) {
				document.form.submit();
			}
			var title = $("#boardSubject").val();
			var content = $("#boardText").val();
			var writer = $("#writer").val();

			if (title == "") {
				alert("제목을 입력하세요");
				document.form.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form.content.focus();
				return;
			}

			// 입력한 데이터를 서버로 전송
			document.form.submit();
		});
	});
</script>
<div class="container" style="width: 800px;">
	<h2>게시글 작성하기</h2>
	
	<form name="form" method="post" action="${initParam.rootPath }/insertBoard.do">

		<div>
			작성자 : <input type="text" name="memberId" id="memberId" value="<sec:authentication property='principal.memberId' />" class="form-control">
		</div> 
		<div>
			제목 <input type="text" name="boardSubject" id="boardSubject" size="80" class="form-control" placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="boardText" id="boardText" rows="16" cols="80" class="form-control" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
		</div>
		
		<button type="submit" id="submit" class="btn btn-default" style="float: right;">등록</button>
		<sec:csrfInput />
	</form>
	
</div>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function() {
		$(".memberId").on("click", function() {
			if (confirm("권한을 주시겟습니까?")) {
				$(this).parent().submit();
			} else {
				return false;
			}
		});
	});
</script>
<div class="container">
	<h2>일반 회원</h2>
	<div class="col-sm-12" style="background: #fff; min-height: 600px; margin-bottom: 10px; padding-top: 20px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>사용자 ID</th>
					<th>사용자 이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>관리자 권한 주기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.member}" var="item">
					<tr>
						<td>${item.memberId }</td>
						<td>${item.memberName }</td>
						<td><fmt:formatDate value="${item.memberBirthday }" pattern="yyyy-MM-dd" /></td>
						<td>${item.memberGender }</td>
						<td>${item.memberTel }</td>
						<td>${item.memberEmail }</td>
						<td>
							<form action="${initParam.rootPath}/memberAuthority_update.do" class="admin">
								<input type="hidden"  value="${item.memberId }" name="memberId">   
								<button type="button" class="memberId">관리자 권한 주기!</button>
							</form>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
			<sec:csrfInput />
		</table>
	</div>
</div>
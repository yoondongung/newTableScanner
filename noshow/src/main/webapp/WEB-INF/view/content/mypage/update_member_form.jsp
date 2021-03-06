<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.noshow.vo.Member"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Date birthday = ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getMemberBirthday();
%>

<script type="text/javascript">
	window.onload = function name() {
		var memberGender = document.getElementsByName("memberGender");
		var Gender = '<sec:authentication property="principal.memberGender"/>'
		for (var i = 0; memberGender.length; i++) {
			if (memberGender[i].value == Gender) {
				memberGender[i].checked = true;
			}
		}
	}
</script>
<style>
.mainTemplate{ 
background: #FAFAFA;    
} 
</style>
<sec:csrfInput />

<div class="col-md-10" style="background: #fff; padding-bottom: 50px;">
	<c:if test="{not empty requestScope.errorMessage}">
		<div>${requestScope.errorMessage }</div>
	</c:if>
	<form class="form-horizontal" method="post" action="${initParam.rootPath}/update_Member.do" style="padding-top: 40px;">
		<sec:csrfInput />
		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberId">ID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="ID" name="memberId" id="memberId" value='<sec:authentication property="principal.memberId"/>'
					readonly="readonly"
				>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="oldMemberPassword">기존 비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" placeholder="oldPassword" name="oldMemberPassword" id="oldMemberPassword" required="required">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberPassword">새로운 비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" placeholder="newPassword" name="memberPassword" id="memberPassword" required="required">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberName">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="Name" id="memberName" name="memberName"
					value='<sec:authentication property="principal.memberName"/>' readonly="readonly"
				>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberBirthday">Birthday</label>
			<div class="col-sm-10">
				<input type="date" class="form-control" name="memberBirthday" id="memberBirthday"
					value="<fmt:formatDate value='<%=birthday %>' pattern='yyyy-MM-dd'/>"
				>
			</div>
		</div>


		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberTel">Tel</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" value="<sec:authentication property='principal.memberTel'/>" name="memberTel" id="memberTel">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="memberEmail">Email</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" value="<sec:authentication property='principal.memberEmail'/>" name="memberEmail" id="memberEmail">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">Gender</label> <label class="radio-inline"> <input type="radio" name="memberGender" value="male">남자
			</label> <label class="radio-inline"> <input type="radio" name="memberGender" value="female">여자
			</label>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" style="float: right;">정보수정</button>   
			</div>
		</div>

	</form>

</div>



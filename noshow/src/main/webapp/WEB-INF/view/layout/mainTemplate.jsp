<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${initParam.rootPath }/resource/bootstrap/css/bootstrap-theme.min.css">
<script src="${initParam.rootPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script src="${initParam.rootPath }/resource/jquery/jquery-ui.min.js"></script>
<script src="${initParam.rootPath }/resource/bootstrap/js/bootstrap.min.js"></script>
<title>TabelScanner</title>
<style type="text/css">

.whole {
	height: 600px;
	margin-top: 20px;
}

.side, .content {
	height: 100%;
	padding: 10px;
}

.side {
	background-color: #E0FFFF;
}

@media screen and (max-width: 750px) { /*화면이 웹 스크린이고 width가 750px 이하가 되면 아래의 css 설정이 적용됨.*/
	.side, .whole {
		height: auto;
	}
}
</style>
</head>
<body>
     <header style="height: 70px; padding-bottom: 10px; border-bottom: 1px solid #E0E0E0;" >   
     	<div class="col-sm-3 col-xs-10" style="line-height: 55px;">      
     		<a href="${initParam.rootPath }/index.do" style="font-size : 32px; color : #000; ">TabelScanner</a>
     	</div>
     	<div class="col-sm-9 hidden-xs" style="height: 100%;">
     		 
     	</div>
     	<div class="visible-xs-block" style="height: 100%;">
     	<button type="button" class="btn btn-default" aria-label="Right Align" style="height: 50px; margin-top: 5px; width: 45px;">  
     		<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>	
     	</button>

			
     	</div>
     </header>
	<div class="container">  
		<%--메인 body --%>
		<div class="row whole">
			<%-- 메뉴 --%>
			<nav class="col-sm-3 side">
				<tiles:insertAttribute name="menu" />
			</nav>
			<!-- 내용 -->
			<section class="col-sm-9 content">
				<tiles:insertAttribute name="content" />
			</section>
		</div>

	</div>

</body>
</html>
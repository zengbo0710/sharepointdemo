<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<head>
<%@ include file="/commons/meta.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>menu</title>

<link href="styles/left.css" type="text/css" rel="stylesheet" />
<script src="scripts/jquery.js"></script>
<script>
	$(document).ready(function() {
		$('.urbangreymenu li a').click(function() {
			$('.urbangreymenu li a').removeClass('currentClickMenu');
			$(this).addClass('currentClickMenu');
		});
		
		$('.headerbar').click(function() {
			$(this).next().toggle();
		});
	});
</script>


</head>

<body>

<div class="urbangreymenu">
	
	  <h3 class="headerbar">Maintenance Demo</h3>
	  <ul>
		<li><a href="${ctx}/tbincomingtasks" target="rightFrame">Incoming Task</a></li>
		<li><a href="${ctx}/tbknowledgebased" target="rightFrame">Knowledge based</a></li>
		<c:if test="${sessionScope.userInfo.role<=1}">
		<li><a href="${ctx}/tbuserinfo" target="rightFrame">User Info</a></li>
		</c:if>
	  </ul>
</div>

</body>

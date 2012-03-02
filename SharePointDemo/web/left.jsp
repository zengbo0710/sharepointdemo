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
	
	  <h3 class="headerbar">Share Point Demo</h3>
	  <ul>
		<li><a href="${ctx}/tbincomingtasks" target="rightFrame">Incoming Task</a></li>
		<li><a href="${ctx}/tbmaintenance" target="rightFrame">Maintenance</a></li>
		<li><a href="${ctx}/tbknowledgebased" target="rightFrame">Knowledge based</a></li>
		<li><a href="${ctx}/tbmaster" target="rightFrame">Master</a></li>
	  </ul>
</div>

</body>

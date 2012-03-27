<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Error Page</title>
	<script language="javascript">
		function showDetail()
		{
			var elm = document.getElementById('detail_system_error_msg');
			if(elm.style.display == '') {
				elm.style.display = 'none';
			}else {
				elm.style.display = '';
			}
		}
	</script>
</head>

<body>

<div id="content">
	<%
		//Exception from JSP didn't log yet ,should log it here.
		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		if(requestUri!=null&&requestUri.length()>0){
			LogFactory.getLog(requestUri).error(exception.getMessage(), exception);
		}
	%>
	<br />
	<img alt="system internal error" src="../images/error.png" />
	<h3>
	<br />
	</h3>
	<b><fmt:message key="Error_message"/>:</b> <%=exception.getMessage()%>
	<br>

	<button onclick="history.back();"><fmt:message key="Back"/></button>
	<br>

	<p>Please click <a href="#" onclick="showDetail();">here</a> to get information of error and report below message to administrator.</p>

	<div id="detail_system_error_msg" style="display:none">
		<pre><%exception.printStackTrace(new java.io.PrintWriter(out));%></pre>
	</div>
</div>
</body>
</html>
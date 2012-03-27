<%@ page contentType="text/html;charset=UTF-8" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>

<head>
	<%@ include file="/commons/meta.jsp" %>
	<base href="<%=basePath%>">
	<title>Log In</title>
<style type="text/css">            

</style> 	
</head>

<body>
<%@ include file="/commons/messages.jsp" %>

<form:form method="post" action="${ctx}/tbuserinfo/login" modelAttribute="tbUserInfo" >
	<table height="100%" width="100%" >
	<tr valign="middle">
		<td>
			<table align="center">
				<tr>	
					<th>Name&nbsp;</th>	
					<td>
					<input name="userName" class="required"/>
					</td>
				</tr>
				
				<tr>	
					<th>Password&nbsp;</th>	
					<td>
					<input type="password" name="password" class="required"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input id="submitButton" name="submitButton" type="submit" value="<fmt:message key="Login"/>" />
					</td>
				</tr>		
			</table>
		</td>
	</tr>
	</table>
</form:form>

<script>
	new Validation(document.forms[0],{onSubmit:true});
</script>

</body>
</html>
